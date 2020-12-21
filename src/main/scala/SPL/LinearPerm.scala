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

package SPL

import AcyclicStreamingModule.HardwareType.HW
import AcyclicStreamingModule.SLP.{RAMControl, Spatial, Temporal}
import StreamingModule.StreamingModule
import linalg.Fields.F2
import linalg.{LUL, Matrix, Vec}

case class LinearPerm[T](P: Seq[Matrix[F2]]) extends SPL[T](P.head.m) {
  val ULU = false
  assert(P.forall(m => m.m == m.n))
  assert(P.forall(_.isInvertible))
  assert(P.forall(m => m.m == n))

  override def eval(inputs: Seq[T], set: Int): Seq[T] = LinearPerm.permute(P(set % P.size), inputs) //inputs.grouped(N).toSeq.zipWithIndex.flatMap { case (inputs, s) => LinearPerm.permute(P(s % P.size), inputs) }

  override def stream(k: Int, control:RAMControl)(implicit hw: HW[T]): StreamingModule[T] = {
    def unblock(P: Matrix[F2], t: Int) = {
      assert(P.m == P.n)
      val k = P.m - t
      val P4 = P(0 until t, 0 until t)
      val P3 = P(0 until t, t until k + t)
      val P2 = P(t until k + t, 0 until t)
      val P1 = P(t until k + t, t until k + t)
      (P1, P2, P3, P4)
    }

    val t = n - k

    val ps = P.map(p => unblock(p, t))
    val p1 = ps.map(_._1)
    val p2 = ps.map(_._2)
    val p3 = ps.map(_._3)
    val p4 = ps.map(_._4)
    if (!ULU) {
      val L2 = P.map(p => new LUL(p, t, k).getSolution)
      val L1 = Vector.tabulate(P.size)(i => p1(i) + L2(i) * p3(i))
      val C4 = Vector.tabulate(P.size)(i => p4(i) + p3(i) * (p1(i) + L2(i) * p3(i)).inverse * (p2(i) + L2(i) * p4(i)))
      val C3 = p3
      val R2 = Vector.tabulate(P.size)(i => (p1(i) + L2(i) * p3(i)).inverse * (p2(i) + L2(i) * p4(i)))


      Spatial(L1, L2) *
        Temporal(C3, C4,control) *
        Spatial(Vector.fill(P.size)(Matrix.identity[F2](k)), R2)
    }
    else {
      val L = new LUL((p1.head :: p2.head) / (p3.head :: p4.head), k, t).getSolution
      val R3 = p3.head + L * p1.head
      val R4 = p4.head + L * p2.head
      val C2 = p2.head * R4.inverse
      val C1 = p1.head + C2 * R3
      Temporal(L, Matrix.identity[F2](t),control) *
        Spatial(C1, C2) *
        Temporal(R3, R4,control)
    }
  }
}

object LinearPerm {
  def apply[T](P:Matrix[F2]):SPL[T]=LinearPerm[T](Seq(P))
  def permute[T](P: Matrix[F2], v: Seq[T]): Seq[T] = {
    val Pinv = P.inverse
    Vector.tabulate(1 << P.m)(i => v(permute(Pinv, i)))
  }

  def permute(P: Matrix[F2], i: Int): Int = (P * Vec.fromInt(P.m, i)).toInt

  def Rmat(r: Int, n: Int): Matrix[F2] = (0 until n / r).map(l => Matrix.identity[F2](n - r * (l + 1)) oplus Lmat(r, r * (l + 1))).reduceLeft(_ * _)

  def Lmat(m: Int, n: Int): Matrix[F2] = Cmat(n) ^ (n - m)

  def Cmat(n: Int): Matrix[F2] = Matrix.tabulate[F2](n, n)((i, j) => F2((i + 1) % n == j))

  def stream[T](matrices: Seq[Matrix[F2]], k: Int, hw: HW[T], control:RAMControl): StreamingModule[T] = LinearPerm[T](matrices).stream(k,control)(hw)

  //def L[DT](m: Int, n: Int) = LinearPerm[DT](Lmat(m, n))

  //def Linv[DT](m: Int, n: Int) = LinearPerm[DT](Lmat(m, n).inverse)

  //def R[DT](r: Int, n: Int) = LinearPerm[DT](Rmat(r, n))
}
