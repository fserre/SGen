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

package SB.Signals

import RTL.Component
import SB.HardwareType.{HW, Unsigned}
import SB.SB

case class Input[T](input: Component, override val hw: HW[T], override val sb: SB[T]) extends Source[T](hw, sb) {
  override def implement: Component = input

  //override def toString: String = input.name

  override def graphName: String = "inputs:i" + ref.i

  override def graphDeclaration: String = ""
}

case class Next(override val sb: SB[_]) extends Source(Unsigned(1), sb) {
  override def implement: Component = ???
  override def toString="Next"
}
object Next{
  //def apply()(implicit sb:SB[_])=new Next(sb)

  def unapply[T](arg: Sig[T]): Boolean = arg match{
    case _:Next => true
    case _ => false
  }
}

case class Reset(override val sb: SB[_]) extends Source(Unsigned(1), sb) {
  override def implement: Component = ???


}
object Reset{
  //def apply()(implicit sb:SB[_])=new Reset(sb)

  def unapply[T](arg: Sig[T]): Boolean = arg match{
    case _:Reset => true
    case _ => false
  }
}

case class Const[T](value: T, override val hw: HW[T], override val sb: SB[_]) extends Source(hw, sb) {
  override def toString(s: SigRef[_] => String): String = value.toString

  override def implement = new RTL.Const(hw.size, hw.bitsOf(value))

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
  def apply()(implicit sb:SB[_]): Sig[Int] = Const(0)(Unsigned(0),sb)

  def unapply[T](arg: Sig[T]): Boolean = arg.hw == Unsigned(0)
}