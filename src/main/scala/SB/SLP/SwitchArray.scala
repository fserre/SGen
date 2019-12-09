/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.SLP

import SB.HW.HW
import SB.{Identity, SB}
import _root_.SB.Signals._
import linalg.Fields.F2
import linalg.{Matrix, Vec}

case class SwitchArray[U: HW] private(v: Seq[Vec[F2]], override val k: Int) extends SLP(v.head.m, k, v.size) {
  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[_]): Seq[Sig[U]] = {
    val timer = Timer(T)
    val vec = Vector.tabulate(v.size)(j => timer scalar v(j))
    val set = Counter(size)
    val control = Mux(set, vec)

    (0 until inputs.size).toVector.map(i => (if (i % 2 == 0) (control ? (inputs(i + 1), inputs(i))) else (control ? (inputs(i - 1), inputs(i)))))

  }

  override val P2 = v.map(v => (Matrix.zeros[F2](k - 1, t) / v.transpose))
}

object SwitchArray {
  def apply[U: HW](v: Seq[Vec[F2]], k: Int): SB[U] = if (v.forall(_.isZero()))
    Identity(v.head.m, k)
  else
    new SwitchArray(v, k)

  def apply[U: HW](v: Vec[F2], k: Int): SB[U] = apply(Seq(v), k)
}