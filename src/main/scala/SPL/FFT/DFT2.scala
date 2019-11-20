/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL.FFT

import SB.HW.HW
import SB.SB
import _root_.SB.Signals.Sig
import SPL.{Repeatable, SPL}
import StreamingModule.StreamingModule
import linalg.Fields.Complex

class DFT2[T](implicit val num:Numeric[T]) extends SPL[T](1) with Repeatable[T]{
  override def eval(inputs: Seq[T]) = inputs.grouped(2).toSeq.flatMap(i=>Seq(num.plus(i(0),i(1)),num.minus(i(0),i(1))))

  override def stream(k: Int)(implicit hw: HW[T]) = {
    require(k==1)
    new SB(0,1){
      override def toString: String = "F2"

      override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[_]) = inputs.grouped(2).toSeq.flatMap(i=>Seq(i(0)+i(1),i(0)-i(1)))

      override def spl=DFT2[T]()
    }
  }
}

object DFT2{
  def apply[T:Numeric]()=new DFT2[T]()
  def unapply[T](arg:SPL[T])=arg match{
    case _:DFT2[T] => true
    case _ => false
  }
}