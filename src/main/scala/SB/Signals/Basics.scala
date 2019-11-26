/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW.{HW, Unsigned}
import SB.SB

case class Input[T](input: Component,override val hw:HW[T],override val sb:SB[T]) extends Sig[T]()(hw,sb) {
  override def implement(implicit conv: SigRef[_] => Component): Component = input

  override def toString: String = input.toString

  override def graphName = "inputs:i" + ref.i

  override def graphDeclaration: String = ""
}

case class Next(override val sb:SB[_]) extends Sig()(Unsigned(1),sb) {
  override def implement(implicit conv: SigRef[_] => Component): Component = ???
  override def toString="Next"
}
object Next{
  //def apply()(implicit sb:SB[_])=new Next(sb)

  def unapply[T](arg: Sig[T]): Boolean = arg match{
    case _:Next => true
    case _ => false
  }
}
case class Reset(override val sb:SB[_]) extends Sig()(Unsigned(1),sb) {
  override def implement(implicit conv: SigRef[_] => Component): Component = ???


}
object Reset{
  //def apply()(implicit sb:SB[_])=new Reset(sb)

  def unapply[T](arg: Sig[T]): Boolean = arg match{
    case _:Reset => true
    case _ => false
  }
}

case class Const[T](value: T,override val hw:HW[T], override val sb:SB[_]) extends Sig[T]()(hw,sb) {
  override def toString(s: SigRef[_] => String): String = value.toString
  override def implement(implicit conv: SigRef[_] => Component) = new RTL.Const(hw.size, hw.bitsOf(value))

  override def graphDeclaration = "" //graphName + "[label=\""+value.toString+"\"];"

  override def graphName: String = value.toString

  override def equals(obj: Any): Boolean = obj match {
    case other: Const[T] => other.hw == hw && other.sb == sb && hw.bitsOf(value) == hw.bitsOf(other.value)
    case _ => false
  }

  override val hashCode: Int = hw.bitsOf(value).hashCode()
}
object Const{
  def apply[T](value:T)(implicit hw:HW[T],sb:SB[_]):Sig[T]=Const(value,hw,sb)

  def unapply[T](arg: Sig[T]): Option[T] = arg match{
    case arg:Const[T]=>Some(arg.value)
    case _ =>None
  }


}
case object Null {
  def apply()(implicit sb:SB[_]) = Const(0)(Unsigned(0),sb)

  def unapply[T](arg: Sig[T]) = arg.hw == Unsigned(0)
}