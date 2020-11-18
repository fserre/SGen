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

package SB.HW

import RTL.Component
import SB.Signals.{Plus, Sig}
import linalg.Fields.Complex

/**
 * Class that represents a hardware representation
 *
 * @tparam T Type of the equivalent software datatype. Used for computations with constants.
 * @param size Size in bits of the representation
 */
abstract class HW[T: Numeric](val size: Int) {
  final val num = implicitly[Numeric[T]]

  def plus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def minus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def times(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def bitsOf(const: T): BigInt

  def valueOf(const: BigInt): T
}

object HW {

  implicit class compHW[T](x: HW[Complex[T]]) {
    def innerHW: HW[T] = x match {
      case x: ComplexHW[T] => x.hw
      case _ => throw new Exception("Invalid complex HW datatype")
    }
  }

}