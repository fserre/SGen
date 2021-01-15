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

import ir.rtl.{Component, AcyclicStreamingModule}
import ir.rtl.hardwaretype.{HW, Unsigned}

case class Input[T: HW](input: Int) extends Source[T]:
  override def implement: Component = ???

  override val hash = input.hashCode()


case object Next extends Source(using Unsigned(1)):
  override val hash="Next".hashCode()
  
  override def implement: Component = ???


case object Reset extends Source(using Unsigned(1)):
  override def implement: Component = ???

  override val hash="Reset".hashCode()


case class Const[T: HW](value: T) extends Source[T]:
  val bits = hw.bitsOf(value)
  
  override def implement = ??? 

  override def equals(obj: Any): Boolean = obj match
    case other: Const[?] => other.hw == hw && bits == other.bits
    case _ => false
  
  override val hash = hw.bitsOf(value).hashCode()

case object Null:
  def apply(): Sig[Int] = Const(0)(Unsigned(0))

  def unapply[T](arg: Sig[T]): Boolean = arg.hw == Unsigned(0)
