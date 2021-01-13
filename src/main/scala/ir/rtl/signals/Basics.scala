/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
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

package ir.rtl.signals

import ir.rtl.{Component, SB}
import ir.rtl.hardwaretype.{HW, Unsigned}

case class Input[T](input: Int, override val hw: HW[T]) extends Source[T](hw) {
  override def implement: Component = ???

  override lazy val graphName: String = "inputs:s" + input

  override def graphDeclaration: String = ""
  
  override val hash = input.hashCode()
}

case object Next extends Source(Unsigned(1)) {
  override val hash="Next".hashCode()
  
  override def implement: Component = ???

  override def toString="Next"
}

case object Reset extends Source(Unsigned(1)) {
  override def implement: Component = ???
  override val hash="Reset".hashCode()
}

case class Const[T](value: T, override val hw: HW[T]) extends Source(hw) {
  //override def toString(s: Sig[_] => String): String = value.toString

  override def implement = new ir.rtl.Const(hw.size, hw.bitsOf(value))

  override def graphDeclaration = "" //graphName + "[label=\""+value.toString+"\"];"

  override lazy val graphName: String = value.toString

  /*override def equals(obj: Any): Boolean = obj match {
    case other: Const[?] => other.hw == hw && hw.bitsOf(value) == other.hw.bitsOf(other.value)
    case _ => false
  }*/

  override val hash = hw.bitsOf(value).hashCode()
}
object Const{
  def apply[T](value:T)(implicit hw:HW[T]):Sig[T]=Const(value,hw)

  def unapply[T](arg: Sig[T]): Option[T] = arg match{
    case arg:Const[T]=>Some(arg.value)
    case _ =>None
  }


}
case object Null {
  def apply(): Sig[Int] = Const(0)(Unsigned(0))

  def unapply[T](arg: Sig[T]): Boolean = arg.hw == Unsigned(0)
}