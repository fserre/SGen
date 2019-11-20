/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package linalg.Fields

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
  override def toString = num.toString + (if (denom != 1) "/" + denom.toString else "")

  /**
   * checks for equality with another object
   * It has to be redefined to handle the case where both numerators are zeros
   *
   * @param obj Object to be compared with
   * @return if obj equals this
   */
  override def equals(obj: Any) = obj match {
    case q: Q => (q.num == 0 && num == 0) || (q.num == num && q.denom == denom)
    case _ => false
  }

  /**
   * Redefines the hashCode to be compatible with the redefined equals
   *
   * @return a hashCode
   */
  override def hashCode = num.hashCode()
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
    def div(lhs: Q, rhs: Q) = Q(lhs.num * rhs.denom, lhs.denom * rhs.num)

    def toFloat(x: Q) = x.num.toFloat / x.denom

    def toInt(x: Q) = toDouble(x).toInt

    def toDouble(x: Q) = x.num.toDouble / x.denom

    def fromInt(x: Int) = Q(x, 1)

    def toLong(x: Q) = toDouble(x).toLong

    def times(lhs: Q, rhs: Q) = Q(lhs.num * rhs.num, lhs.denom * rhs.denom)

    def minus(x: Q, y: Q) = plus(x, negate(y))

    def plus(lhs: Q, rhs: Q) = Q(lhs.num * rhs.denom + rhs.num * lhs.denom, lhs.denom * rhs.denom)

    def negate(x: Q) = Q(-x.num, x.denom)

    def compare(x: Q, y: Q) = x.num * y.denom - y.num * x.denom

    override def parseString(str: String): Option[Q] = ???
  }

  implicit def numericOps(lhs: Q): QIsFractional.FractionalOps = QIsFractional.mkNumericOps(lhs)
}
