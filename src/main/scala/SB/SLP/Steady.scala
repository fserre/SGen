/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.SLP

import SB.{Identity, SB}
import _root_.SB.HW.HW
import SPL.LinearPerm
import _root_.SB.Signals._
import StreamingModule.StreamingModule
import linalg.Fields.F2
import linalg.Matrix

case class Steady[U: HW] private(override val P1: Seq[Matrix[F2]], override val t: Int) extends SLP(t, P1.head.m, P1.size) {
  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[_]): Seq[Sig[U]] = {
    val set = Counter(size)
    Vector.tabulate(K)(i => Mux(set, Vector.tabulate(P.size)(j => inputs(LinearPerm.permute(P(j).inverse, i)))))
  }
}

object Steady {
  def apply[U: HW](P1: Seq[Matrix[F2]], t: Int): SB[U] = if (P1.forall(_.isIdentity())) Identity(t, P1.head.m) else new Steady(P1, t)

  def apply[U: HW](P1: Matrix[F2], t: Int): SB[U] = Steady(Seq(P1), t)
}
