/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL

import SB.HW.HW
import SB.SB
import StreamingModule.StreamingModule


case class ITensor[T] private (r:Int, factor:Repeatable[T]) extends SPL[T](factor.n+r) {
  override def eval(inputs: Seq[T]): Seq[T] = //inputs.grouped(1<<n).toSeq.map(_.grouped(1<<factor.n).toVector).transpose.flatten.map(factor.eval).map(_.grouped(1<<factor.n).toVector).transpose.flatten.flatten
  inputs.grouped(factor.N).toSeq.flatMap(factor.eval)

  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = SB.ITensor(r,factor.stream(Math.min(factor.n,k)),k)
}

object ITensor{
  def apply[T](r:Int, factor:Repeatable[T]):SPL[T]=apply(r,factor:SPL[T])
  def apply[T](r:Int, factor:SPL[T]):SPL[T]=if(r==0)
    factor
  else
    factor match{
    case factor:Repeatable[T] => new ITensor(r,factor)
    case _ => throw new Exception("Non repeatable SPL used in ITensor")
  }
}

trait Repeatable[T] extends SPL[T]{
  override def stream(k: Int)(implicit hw: HW[T]): SB[T]
}