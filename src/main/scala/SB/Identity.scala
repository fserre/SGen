/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB

import SB.HW.HW
import SB.Signals.Sig
import SPL.SPL
import StreamingModule.StreamingModule

case class Identity[T:HW](override val t:Int,override val k:Int) extends SB[T](t,k) {
  override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[_]): Seq[Sig[T]] = inputs
  override def spl: SPL[T] = SPL.Identity[T](t+k)
}

object Identity{
  def unapply[T](arg: StreamingModule[T]):Boolean = arg match{
    case _:Identity[T] => true
    case _ => false
  }
}