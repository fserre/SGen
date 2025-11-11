/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
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

package ir.rtl.hardwaretype

import ir.rtl.Component
import ir.rtl.signals.{Plus, Sig}
import maths.fields.Complex

/**
 * Class that represents a hardware representation. Used as a context bound for the type paramter of signals to indicate how to implement them in hardware.
 *
 * @tparam T Type of the equivalent software datatype. Used for computations with constants.
 * @param size Size in bits of the representation
 */
abstract class HW[T: Numeric](val size: Int):
  /** Text describing the hardware datatype */
  def description: String

  /** return a Sig representing the sum of two sigs that have this as a context bound.  */
  def plus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  /** return a Sig representing the difference between two sigs that have this as a context bound.  */
  def minus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  /** return a Sig representing the product of two sigs that have this as a context bound.  */
  def times(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  /** Gets the bit representation of a constant */
  def bitsOf(const: T): BigInt

  /** Get the value of a constant from its bits */
  def valueOf(const: BigInt): T

  /** Numeric context bound of T */
  final val num = Numeric[T]

  def MID_VALUE: T

  def MAX_VALUE: T
  
  def values: Iterator[T]


object HW:
  inline def apply[T](using hw: HW[T]) = hw

  /** HW of a Complex software datatype provide the underlying HW. */
  extension [T](x: HW[Complex[T]]) inline def innerHW: HW[T] = x match
    case x: ComplexHW[T] => x.hw
    case _ => throw new Exception("Invalid complex HW datatype")
