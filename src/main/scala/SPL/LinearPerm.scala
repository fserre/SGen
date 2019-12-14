/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL

import SB.HW.HW
import SB.SLP.{Spatial, Temporal, TemporalNG}
import SB.Signals._
import StreamingModule.StreamingModule
import linalg.Fields.F2
import linalg.{LUL, Matrix, Vec}

case class LinearPerm[T](P: Seq[Matrix[F2]]) extends SPL[T](P.head.m) {
  val ULU = false
  assert(P.forall(m => m.m == m.n))
  assert(P.forall(_.isInvertible))
  assert(P.forall(m => m.m == n))

  override def eval(inputs: Seq[T], set: Int): Seq[T] = LinearPerm.permute(P(set % P.size), inputs) //inputs.grouped(N).toSeq.zipWithIndex.flatMap { case (inputs, s) => LinearPerm.permute(P(s % P.size), inputs) }

  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = {
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
        TemporalNG(C3, C4) *
        Spatial(Vector.fill(P.size)(Matrix.identity[F2](k)), R2)
    }
    else {
      val L = new LUL((p1(0) :: p2(0)) / (p3(0) :: p4(0)), k, t).getSolution
      val R3 = p3(0) + L * p1(0)
      val R4 = p4(0) + L * p2(0)
      val C2 = p2(0) * R4.inverse
      val C1 = p1(0) + C2 * R3
      TemporalNG(L, Matrix.identity[F2](t)) *
        Spatial(C1, C2) *
        TemporalNG(R3, R4)
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

  def Rmat(r: Int, n: Int) = (0 until n / r).map(l => Matrix.identity[F2](n - r * (l + 1)) oplus Lmat(r, r * (l + 1))).reduceLeft(_ * _)

  def Lmat(m: Int, n: Int) = Cmat(n) ^ (n - m)

  def Cmat(n: Int) = Matrix.tabulate[F2](n, n)((i, j) => F2((i + 1) % n == j))

  def stream[T](matrices: Seq[Matrix[F2]], k: Int, hw: HW[T]) = LinearPerm[T](matrices).stream(k)(hw)

  //def L[DT](m: Int, n: Int) = LinearPerm[DT](Lmat(m, n))

  //def Linv[DT](m: Int, n: Int) = LinearPerm[DT](Lmat(m, n).inverse)

  //def R[DT](r: Int, n: Int) = LinearPerm[DT](Rmat(r, n))
}
