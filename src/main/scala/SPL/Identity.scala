/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL
import SB.HW.HW
import StreamingModule.StreamingModule

case class Identity[T](override val n:Int) extends SPL[T](n) {
  override def eval(inputs: Seq[T], set: Int): Seq[T] = inputs

  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = ???
}
object Identity{


  def unapply[T](arg: SPL[T]):Boolean = arg match{
    case _:Identity[T] => true
    case _ => false
  }
}