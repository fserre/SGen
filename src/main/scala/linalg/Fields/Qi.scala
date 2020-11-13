/*
 *     _____ ______          SGen - A Generator of Streaming Hardware
 *    / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *    \__ \/ / __/ _ \/ __ \
 *   ___/ / /_/ /  __/ / / /
 *  /____/\____/\___/_/ /_/  Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software Foundation,
 *  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 */

package linalg.Fields

import scala.language.implicitConversions
import scala.math.Fractional.Implicits._

/**
 * Class that represents a Gaussian rational number
 *
 * @param real real part
 * @param im   imaginary part
 */
case class Qi(real: Q, im: Q) {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString: String = real.toString() + (if (im != Q.QIsFractional.zero) "+" + im.toString + "i" else "")
}

/**
 * Companion object of the class Qi
 */
object Qi {
  /**
   * Creates a new gaussian rational from an integer
   *
   * @param x value
   * @return a new gaussian rational
   */
  implicit def apply(x: Int): Qi = QiIsFractional.fromInt(x)

  /**
   * Defines the operations on gaussian rational numbers
   * Extends Fractional[Qi] such that numeric and division operations can be implicitly used
   */
  implicit object QiIsFractional extends Fractional[Qi] {
    def div(x: Qi, y: Qi): Qi = {
      val denom = (y.real * y.real) + (y.im * y.im)
      Qi((x.real * y.real + x.im * y.im) / denom, (x.im * y.real - x.real * y.im) / denom)
    }

    def fromInt(x: Int): Qi = Qi(x, 0)

    def times(x: Qi, y: Qi): Qi = Qi(x.real * y.real - x.im * y.im, x.real * y.im + x.im * y.real)

    def minus(x: Qi, y: Qi): Qi = plus(x, negate(y))

    def plus(x: Qi, y: Qi): Qi = Qi(x.real + y.real, x.im + y.im)

    def negate(x: Qi): Qi = Qi(-x.real, -x.im)

    /*
    The following operations do not make sense in the case of rational numbers, but are needed to extend Fractional[Qi]
    Any use of them will trigger a non implemented exception
     */
    def compare(x: Qi, y: Qi): Int = ???

    def toDouble(x: Qi): Double = ???

    def toLong(x: Qi): Long = ???

    def toFloat(x: Qi): Float = ???

    def toInt(x: Qi): Int = ???

    override def parseString(str: String): Option[Qi] = ???
  }

  implicit def ops(lhs: Qi): QiIsFractional.FractionalOps = QiIsFractional.mkNumericOps(lhs)
}
