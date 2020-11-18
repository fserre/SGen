/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
 * /____/\____/\___/_/ /_/  https://github.com/fserre/sgen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 */

package SB.SLP

import SB.{Identity, SB}
import _root_.SB.HW.{HW, Unsigned}
import _root_.SB.Signals._
import linalg.Fields.F2
import linalg.{Matrix, Vec}

import scala.annotation.tailrec

case class Temporal[U: HW] private(override val P3: Seq[Matrix[F2]], override val P4: Seq[Matrix[F2]], dualPorted:Boolean=true) extends SLP(P3.head.m, P3.head.n, P3.size) {
  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[_]): Seq[Sig[U]] = {

    val latency = (for {
      p <- 0 until K
      c <- 0 until T
      i <- 0 until size
    } yield c - Vec(P4(i) * Vec.fromInt(t, c) + P3(i) * Vec.fromInt(k, p)).toInt).max

    def compBasis(basis: Matrix[F2] = Matrix.identity[F2](t), i: Int = 0): Vector[Matrix[F2]] = {
      val nextBasis = basis * P4(i).inverse
      if (i == P3.size - 1 && nextBasis.isIdentity)
        Vector(basis)
      else
        basis +: compBasis(nextBasis, (i + 1) % P4.size)
    }

    @tailrec
    def simplify[T](list: Vector[T]): Vector[T] = {
      if (list.size % 2 == 0 && (0 until list.size / 2).forall(i => list(i) == list(i + list.size / 2)))
        simplify(list.take(list.size / 2))
      else
        list
    }

    def shift[T](list: Vector[T]): Vector[T] = Vector.tabulate(list.size)(i => list((i + 1) % list.size))

    val basis = /*simplify(*/ compBasis() //)
    val offset1 = Vector.tabulate(1 << k)(p => {
      def compOff(offset: Vec[F2] = Vec.fromInt(t, 0), i: Int = 0): Vector[Vec[F2]] = {
        val nextOffset = basis((i + 1) % basis.size) * P3(i % P3.size) * Vec.fromInt(k, p) + offset
        if (i % P3.size == P3.size - 1 && nextOffset.isZero && basis((i + 1) % basis.size).isIdentity)
          Vector(offset)
        else
          offset +: compOff(nextOffset, i + 1)
      }
      /*simplify(*/ compOff() //)
    })
    val offsetLength = Utils.lcm(offset1.map(_.size))
    val offset2 = offset1.map(l => Vector.tabulate(offsetLength)(i => l(i % l.size)))

    val timerWrite1 = Timer(T)
    val basisListWrite = basis.map(m => Concat(Vector.tabulate(t)(r => Const(m.row(r).toInt)(Unsigned(t), sb) scalar timerWrite1)))


    val controlWrite = LateCounter(basis.size, T)
    val basisWrite = Mux(controlWrite, basisListWrite)

    val controlWrite2 = LateCounter(offsetLength, T)
    val offsetListWrite = offset2.map(i => ROM(i.map(x => x.toInt), controlWrite2)(Unsigned(t), sb))

    val addressesWrite = offsetListWrite.map(_ ^ basisWrite)

    if(dualPorted) {
      val timerRead1 = Timer(T)
      val basisListRead = basis.map(m => Concat(Vector.tabulate(t)(r => Const[Int](m.row(r).toInt)(Unsigned(t), sb) scalar timerRead1)))

      val controlRead = Counter(basis.size)
      val basisRead = Mux(controlRead, shift(basisListRead))

      val controlRead2 = Counter(offsetLength)
      val offsetListRead = offset2.map(i => ROM(shift(i).map(x => x.toInt), controlRead2)(Unsigned(t), sb))

      val addressesRead = offsetListRead.map(_ ^ basisRead)

      inputs.zipWithIndex.map { case (i, p) => DualPortedRAM(i, addressesWrite(p), addressesRead(p), latency) }
    }
    else
      inputs.zipWithIndex.map { case (i, p) => SinglePortedRAM(i, addressesWrite(p), latency, T) }
  }
}

object Temporal {
  def apply[U: HW](P3: Seq[Matrix[F2]], P4: Seq[Matrix[F2]]): SB[U] = if (P3.forall(_.isZero) && P4.forall(_.isIdentity))
    Identity(P3.head.m, P3.head.n)
  else
    new Temporal(P3, P4)

  def apply[U: HW](P3: Matrix[F2], P4: Matrix[F2]): SB[U] = Temporal(Seq(P3), Seq(P4))
}