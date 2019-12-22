/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package linalg.Fields


import scala.math.Numeric.Implicits._

/**
 * Class that represents a complex number
 *
 * @param re real part
 * @param im imaginary part
 */
case class Complex[T: Numeric](re: T, im: T) {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString = re.toString() + (if (im != implicitly[Numeric[T]].zero) "+" + im.toString + "i" else "")

  def conjugate = Complex(re, -im)
}

/**
 * Companion object of the class Complex
 */
object Complex {
  /**
   * Creates a new real complex
   *
   * @param x value
   * @return a new complex
   */
  implicit def apply[T:Numeric](x: T): Complex[T] = Complex(x,implicitly[Numeric[T]].zero)

  /**
   * Defines the operations oncomplex numbers
   */
  implicit def ComplexIsFractional[T: Numeric]: Fractional[Complex[T]] = new Fractional[Complex[T]] {
  val num=implicitly[Numeric[T]]

    override def plus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.plus(x.re, y.re), num.plus(x.im, y.im))

    override def minus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.minus(x.re, y.re), num.minus(x.im, y.im))

    override def times(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.minus(num.times(x.re, y.re), num.times(x.im, y.im)), num.plus(num.times(x.re, y.im), num.times(x.im, y.re)))

    override def negate(x: Complex[T]): Complex[T] = Complex(num.negate(x.re), num.negate(x.im))

    override def fromInt(x: Int): Complex[T] = Complex(num.fromInt(x))

    override def abs(x: Complex[T]): Complex[T] = times(x,x.conjugate)

    override def parseString(str: String): Option[Complex[T]] = ???

    override def toInt(x: Complex[T]): Int = ???

    override def toLong(x: Complex[T]): Long = ???

    override def toFloat(x: Complex[T]): Float = ???

    override def toDouble(x: Complex[T]): Double = num.toDouble(x.re)

    override def lt(lhs: Complex[T], rhs: Complex[T]) = false
    override def compare(x: Complex[T], y: Complex[T]): Int = ???

    //override def div(x: Complex[T], y: Complex[T]): Complex[T] = ???
    override def div(x: Complex[T], y: Complex[T]): Complex[T] = ???
  }

  implicit def NumericOps[T: Numeric](lhs: Complex[T]) = ComplexIsFractional.mkNumericOps(lhs)
}
