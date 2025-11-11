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

package maths.fields

import scala.language.implicitConversions


/**
 * Class that represent an element of F2, i.e. the Galois field with two elements
 *
 * @param value a boolean set to true for 1, and false for 0
 */
case class F2(value: Boolean) extends AnyVal {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString: String = if (value) "1" else "."
}

object F2 {
  /**
   * Creates a new element of F2 from an integer
   *
   * @param x value
   * @return a new element of F2
   */
  implicit def fromInt(x: Int): F2 = F2IsFractional.fromInt(x)

  /**
   * Defines the operations on F2
   * Extends Fractional[F2] such that numeric and division operations can be implicitly used
   */
  implicit object F2IsFractional extends Fractional[F2] {
    def div(x: F2, y: F2): F2 = {
      assert(y.value)
      x
    }

    def toDouble(x: F2): Double = if (x.value) 1.0 else 0.0

    def toFloat(x: F2): Float = if (x.value) 1.0f else 0.0f

    def negate(x: F2): F2 = x

    def fromInt(x: Int): F2 = if (x % 2 == 0) F2(false) else F2(true)

    def toLong(x: F2): Long = if (x.value) 1L else 0L

    def times(x: F2, y: F2): F2 = F2(x.value && y.value)

    def minus(x: F2, y: F2): F2 = plus(x, y)

    def plus(x: F2, y: F2): F2 = F2(x.value ^ y.value)

    def compare(x: F2, y: F2): Int = toInt(x) - toInt(y)

    def toInt(x: F2): Int = if (x.value) 1 else 0

    override def parseString(str: String): Option[F2] = ???
  }

  implicit def ops(lhs: F2): F2IsFractional.FractionalOps = F2.F2IsFractional.mkNumericOps(lhs)
}
