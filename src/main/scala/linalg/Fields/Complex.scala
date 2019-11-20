/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package linalg.Fields


import scala.math.Numeric.Implicits._

/**
 * Class that represents a complex number
 *
 * @param real real part
 * @param im   imaginary part
 */
case class Complex[T:Numeric](real: T, im: T) {
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString = real.toString() + (if (im != implicitly[Numeric[T]].zero) "+" + im.toString + "i" else "")
  def conjugate=Complex(real,-im)
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
  implicit def ComplexIsFractional[T:Numeric]:Numeric[Complex[T]] =new Numeric[Complex[T]] {
  val num=implicitly[Numeric[T]]
    override def plus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.plus(x.real,y.real),num.plus(x.im,y.im))

    override def minus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.minus(x.real,y.real),num.minus(x.im,y.im))

    override def times(x: Complex[T], y: Complex[T]): Complex[T] = Complex(num.minus(num.times(x.real,y.real),num.times(x.im,y.im)),num.plus(num.times(x.real,y.im),num.times(x.im,y.real)))

    override def negate(x: Complex[T]): Complex[T] = Complex(num.negate(x.real),num.negate(x.im))

    override def fromInt(x: Int): Complex[T] = Complex(num.fromInt(x))

    override def abs(x: Complex[T]): Complex[T] = times(x,x.conjugate)

    override def parseString(str: String): Option[Complex[T]] = ???

    override def toInt(x: Complex[T]): Int = ???

    override def toLong(x: Complex[T]): Long = ???

    override def toFloat(x: Complex[T]): Float = ???

    override def toDouble(x: Complex[T]): Double = num.toDouble(x.real)

    override def compare(x: Complex[T], y: Complex[T]): Int = ???

    //override def div(x: Complex[T], y: Complex[T]): Complex[T] = ???
  }

}
