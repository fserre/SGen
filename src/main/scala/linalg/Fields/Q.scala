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
package linalg.Fields

import scala.language.implicitConversions

/**
 * Class that represents a rational number
 * It is immutable
 *
 * @param num   Numerator
 * @param denom Denominator
 */
class Q private(val num: Int, val denom: Int) {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString: String = num.toString + (if (denom != 1) "/" + denom.toString else "")

  /**
   * checks for equality with another object
   * It has to be redefined to handle the case where both numerators are zeros
   *
   * @param obj Object to be compared with
   * @return if obj equals this
   */
  override def equals(obj: Any): Boolean = obj match {
    case q: Q => (q.num == 0 && num == 0) || (q.num == num && q.denom == denom)
    case _ => false
  }

  /**
   * Redefines the hashCode to be compatible with the redefined equals
   *
   * @return a hashCode
   */
  override def hashCode: Int = num.hashCode()
}

/**
 * Companion object of the class Q
 */
object Q {
  /**
   * Creates a new rational number
   *
   * @param num   numerator
   * @param denom denominator
   * @return a new rational number, with simplified numerator and denominator
   */
  def apply(num: Int, denom: Int): Q = {
    def gcd(x: Int, y: Int): Int = {
      if (x == 0) y
      else if (x < 0) gcd(-x, y)
      else if (y < 0) -gcd(x, -y)
      else gcd(y % x, x)
    }

    assert(denom != 0)
    val g = gcd(num, denom)
    new Q(num / g, denom / g)
  }

  /**
   * Creates a new rational number from an integer
   *
   * @param num value
   * @return a new rational number
   */
  implicit def apply(num: Int): Q = apply(num, 1)


  /**
   * Defines the operations on rational numbers
   * Extends Fractional[Q] such that numeric and division operations can be implicitly used
   */
  implicit object QIsFractional extends Fractional[Q] {
    def div(lhs: Q, rhs: Q): Q = Q(lhs.num * rhs.denom, lhs.denom * rhs.num)

    def toFloat(x: Q): Float = x.num.toFloat / x.denom

    def toInt(x: Q): Int = toDouble(x).toInt

    def toDouble(x: Q): Double = x.num.toDouble / x.denom

    def fromInt(x: Int): Q = Q(x, 1)

    def toLong(x: Q): Long = toDouble(x).toLong

    def times(lhs: Q, rhs: Q): Q = Q(lhs.num * rhs.num, lhs.denom * rhs.denom)

    def minus(x: Q, y: Q): Q = plus(x, negate(y))

    def plus(lhs: Q, rhs: Q): Q = Q(lhs.num * rhs.denom + rhs.num * lhs.denom, lhs.denom * rhs.denom)

    def negate(x: Q): Q = Q(-x.num, x.denom)

    def compare(x: Q, y: Q): Int = x.num * y.denom - y.num * x.denom

    override def parseString(str: String): Option[Q] = ???
  }

  implicit def numericOps(lhs: Q): QIsFractional.FractionalOps = QIsFractional.mkNumericOps(lhs)
}
