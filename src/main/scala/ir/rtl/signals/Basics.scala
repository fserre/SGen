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

/** Input signal.
 * @param input Input identifier (from 0 to AcyclicStreamingModule.K)
 * @param HW$T$0 Hardware datatype of the signal
 * @tparam T Software datatype of the signal
 */
case class Input[T: HW](input: Int) extends Source[T]:
  override def implement: Component = ??? // node is handled by AcyclicStreamingModule directly

  override val hash = input.hashCode()


/**
  * Next signal (it is set when a new signal is entering, 0 otherwise)
  */
case object Next extends Source(using Unsigned(1)):
  override val hash="Next".hashCode()
  
  override def implement: Component = ??? // node is handled by AcyclicStreamingModule directly


/**
 * Reset signal (set at the beginning, 0 otherwise)
 */
case object Reset extends Source(using Unsigned(1)):
  override def implement: Component = ??? // node is handled by AcyclicStreamingModule directly

  override val hash="Reset".hashCode()

/**
 * A constant (immediate) value
 * @param value Value of the constant
 * @param HW$T$0 Hardware datatype of the signal
 * @tparam T Software datatype of the signal
 */
case class Const[T: HW](value: T) extends Source[T]:
  val bits = hw.bitsOf(value)
  
  override def implement = ??? // node is handled by AcyclicStreamingModule directly

  override def equals(obj: Any): Boolean = obj match
    case other: Const[?] => other.hw == hw && bits == other.bits
    case _ => false
  
  override val hash = hw.bitsOf(value).hashCode()

/**
  * Null signals are represented by signals of size 0 
  */
object Null:
  /**
    * Creates a null signal
    */
  def apply(): Sig[Int] = Const(0)(Unsigned(0))

  /**
   * Checks if a signal is null
   */
  def unapply[T](arg: Sig[T]): Boolean = arg.hw == Unsigned(0)
