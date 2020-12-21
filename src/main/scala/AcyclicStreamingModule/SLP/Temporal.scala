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

package AcyclicStreamingModule.SLP

import AcyclicStreamingModule.{Identity, SB}
import _root_.AcyclicStreamingModule.HardwareType.{HW, Unsigned}
import _root_.AcyclicStreamingModule.Signals._
import linalg.Fields.F2
import linalg.{Matrix, Vec}

import scala.annotation.tailrec


/**
 * Defines the method used to control memory banks within temporal permutations
 */
enum RAMControl{
  case Dual /// Read and write addresses are computed independently. This offers the highest flexibility (a dataset can be input at any time after a previous one), but this uses more resources.
  case Single /// Write address is the same as the read address, delayed by a constant time. This uses less resources, but it has less flexibility: a dataset must be input either immediately after the previous one, or wait that the previous dataset is completely out.
  case SinglePorted /// Write and read addresses are the same (single-ported memory). This has the same constraints as Single, but may have a higher latency.
}


case class Temporal[U: HW] private(override val P3: Seq[Matrix[F2]], override val P4: Seq[Matrix[F2]], control:RAMControl) extends SLP(P3.head.m, P3.head.n, P3.size) {
  // look if we have a bit matrix in the form of I_r oplus P, which could reduce the memory size (as it happens on Cooley Tukey FFT)
  val r = (0 until t).find(i => P3.exists(p => p.row(i).toInt != 0) || P4.exists(p => p.row(i).toInt != (1 << (t - i - 1)) || p.col(i).toInt != (1 << (t - i - 1)))).get

  val R=1<<r
  val innerP3 = P3.flatMap(p => Seq.fill(R)(p(r until p.m, 0 until p.n))) // the matrices as if the identical cycles in the dataset would be different sets
  val innerP4 = P4.flatMap(p => Seq.fill(R)(p(r until p.m, r until p.n)))

  // latency due to the permutation
  val innerLatency = (for {
    p <- 0 until K
    c <- 0 until T
    i <- 0 until size
  } yield c - Vec(P4(i) * Vec.fromInt(t, c) + P3(i) * Vec.fromInt(k, p)).toInt).max

  private def compBasis(basis: Matrix[F2] = Matrix.identity[F2](t-r), i: Int = 0): Vector[Matrix[F2]] = {
    val nextBasis = basis * innerP4(i).inverse
    if (i == innerP3.size - 1 && nextBasis.isIdentity)
      Vector(basis)
    else
      basis +: compBasis(nextBasis, (i + 1) % innerP4.size)
  }

  @tailrec
  private def simplify[T](list: Vector[T]): Vector[T] = {
    if (list.size % 2 == 0 && (0 until list.size / 2).forall(i => list(i) == list(i + list.size / 2)))
      simplify(list.take(list.size / 2))
    else
      list
  }

  private def shift[T](list: Vector[T]): Vector[T] = Vector.tabulate(list.size)(i => list((i + 1) % list.size))

  val basis = simplify(compBasis())

  val offset1 = Vector.tabulate(1 << k)(p => {
    def compOff(offset: Vec[F2] = Vec.fromInt(t-r, 0), i: Int = 0): Vector[Vec[F2]] = {
      val nextOffset = basis((i + 1) % basis.size) * innerP3(i % innerP3.size) * Vec.fromInt(k, p) + offset
      if (i % innerP3.size == innerP3.size - 1 && nextOffset.isZero && basis((i + 1) % basis.size).isIdentity)
        Vector(offset)
      else
        offset +: compOff(nextOffset, i + 1)
    }
    simplify(compOff())
  })

  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[?]): Seq[Sig[U]] = {

    val offsetLength = Utils.lcm(offset1.map(_.size))
    val offset2 = offset1.map(l => Vector.tabulate(offsetLength)(i => l(i % l.size)))

    val timerWrite = Timer(T)
    val timerWriteL = timerWrite(0 until t-r)
    val timerWriteH = timerWrite(t-r until t)
    val basisListWrite = basis.map(m => Concat(Vector.tabulate(t-r)(c => Const(m.row(c).toInt)(Unsigned(t-r), sb) scalar timerWriteL)))


    val controlWriteH = LateCounter((basis.size+R-1)/R, T)
    val controlWrite=controlWriteH::timerWriteH
    val basisWrite = Mux(controlWrite, basisListWrite)

    val controlWrite2H = LateCounter((offsetLength+R-1)/R, T)
    val controlWrite2=controlWrite2H::timerWriteH
    val offsetListWrite = offset2.map(i => ROM(i.map(x => x.toInt), controlWrite2)(Unsigned(t-r), sb))

    val addressesWrite = offsetListWrite.map(_ ^ basisWrite)

    if(control==RAMControl.Dual) {
      val timerRead = Timer(T)
      val timerReadL=timerRead(0 until t-r)
      val timerReadH=timerRead(t-r until t)
      val basisListRead = basis.map(m => Concat(Vector.tabulate(t-r)(c => Const[Int](m.row(c).toInt)(Unsigned(t-r), sb) scalar timerReadL)))

      val controlReadH = Counter((basis.size+R-1)/R)
      val controlRead=controlReadH::timerReadH
      val basisRead = Mux(controlRead, shift(basisListRead))

      val controlRead2H = Counter((offsetLength+R-1)/R)
      val controlRead2 = controlRead2H::timerReadH
      val offsetListRead = offset2.map(i => ROM(shift(i).map(x => x.toInt), controlRead2)(Unsigned(t-r), sb))

      val addressesRead = offsetListRead.map(_ ^ basisRead)

      inputs.zipWithIndex.map { case (i, p) => DualPortedRAM(i, addressesWrite(p), addressesRead(p), innerLatency) }
    }
    else
      inputs.zipWithIndex.map { case (i, p) => SinglePortedRAM(i, addressesWrite(p), if(control==RAMControl.Single) innerLatency else T/R-1, T/R) }
  }

  override def hasSinglePortedMem: Boolean = control!=RAMControl.Dual
}

object Temporal {
  def apply[U: HW](P3: Seq[Matrix[F2]], P4: Seq[Matrix[F2]], control:RAMControl): SB[U] = if (P3.forall(_.isZero) && P4.forall(_.isIdentity))
    Identity(P3.head.m, P3.head.n)
  else
    new Temporal(P3, P4,control)
  def apply[U: HW](P3: Matrix[F2], P4: Matrix[F2], control:RAMControl): SB[U] = Temporal(Seq(P3), Seq(P4),control)
}
//if(dualPorted)RAMControl.Dual else RAMControl.SinglePorted