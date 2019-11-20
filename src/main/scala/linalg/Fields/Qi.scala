/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package linalg.Fields

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
  override def toString = real.toString() + (if (im != Q.QIsFractional.zero) "+" + im.toString + "i" else "")
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
    def div(x: Qi, y: Qi) = {
      val denom = (y.real * y.real) + (y.im * y.im)
      Qi((x.real * y.real + x.im * y.im) / denom, (x.im * y.real - x.real * y.im) / denom)
    }

    def fromInt(x: Int) = Qi(x, 0)

    def times(x: Qi, y: Qi) = Qi(x.real * y.real - x.im * y.im, x.real * y.im + x.im * y.real)

    def minus(x: Qi, y: Qi) = plus(x, negate(y))

    def plus(x: Qi, y: Qi) = Qi(x.real + y.real, x.im + y.im)

    def negate(x: Qi) = Qi(-x.real, -x.im)

    /*
    The following operations do not make sense in the case of rational numbers, but are needed to extend Fractional[Qi]
    Any use of them will trigger a non implemented exception
     */
    def compare(x: Qi, y: Qi) = ???

    def toDouble(x: Qi) = ???

    def toLong(x: Qi) = ???

    def toFloat(x: Qi) = ???

    def toInt(x: Qi) = ???

    override def parseString(str: String): Option[Qi] = ???
  }

  implicit def ops(lhs: Qi): QiIsFractional.FractionalOps = QiIsFractional.mkNumericOps(lhs)
}
