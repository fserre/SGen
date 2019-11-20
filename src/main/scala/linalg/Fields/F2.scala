/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package linalg.Fields


/**
 * Class that represent an element of F2, i.e. the Galois field with two elements
 *
 * @param value a boolean set to true for 1, and false for 0
 */
case class F2(value: Boolean) {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString = if (value) "1" else "."
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
    def div(x: F2, y: F2) = {
      assert(y.value)
      x
    }

    def toDouble(x: F2) = if (x.value) 1.0 else 0.0

    def toFloat(x: F2) = if (x.value) 1.0f else 0.0f

    def negate(x: F2) = x

    def fromInt(x: Int) = if (x % 2 == 0) F2(false) else F2(true)

    def toLong(x: F2) = if (x.value) 1L else 0L

    def times(x: F2, y: F2) = F2(x.value && y.value)

    def minus(x: F2, y: F2) = plus(x, y)

    def plus(x: F2, y: F2) = F2(x.value ^ y.value)

    def compare(x: F2, y: F2) = toInt(x) - toInt(y)

    def toInt(x: F2) = if (x.value) 1 else 0

    override def parseString(str: String): Option[F2] = ???
  }

  implicit def ops(lhs: F2): F2IsFractional.FractionalOps = F2.F2IsFractional.mkNumericOps(lhs)
}
