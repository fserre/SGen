/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB
import SB.Signals.Sig
import SPL.{Repeatable, SPL}

case class ITensor[T](r: Int, factor: SB[T], override val k: Int) extends SB[T](r + factor.n - k, k)(factor.hw) {
//println("r:"+r+" k:"+k+" factor:"+factor)
  require((k>factor.n && factor.n==factor.k) || factor.k==k)
  override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[_]): Seq[Sig[T]] = if(k>factor.n)
    inputs.grouped(1<<factor.n).toSeq.map(factor.implement(_)).flatten
  else
    factor.implement(inputs)

  override def spl: SPL[T] = SPL.ITensor(r,factor.spl)
}
