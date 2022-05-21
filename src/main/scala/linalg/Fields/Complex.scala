/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
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
import scala.math.Numeric.Implicits._
import math.Ordering.Implicits.infixOrderingOps
import scala.reflect.ClassTag

/**
 * Class that represents a complex number
 *
 * @param re real part
 * @param im imaginary part
 */
case class Complex[+T: Numeric](re: T, im: T):
  /**
   * Returns a printable string representing the number
   *
   * @return A printable string representing the number
   */
  override def toString: String = re.toString + (if (im != implicitly[Numeric[T]].zero) "+" + im.toString + "i" else "")

  def conjugate: Complex[T] = Complex(re, -im)

  def swap: Complex[T] = Complex(im, re)

  def norm2: T = re * re + im * im


/**
 * Companion object of the class Complex
 */
object Complex :
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
  given complexIsFractional[T](using num: Numeric[T]): Fractional[Complex[T]] with
    import num._

    override def plus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re + y.re, x.im + y.im)

    override def minus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re - y.re, x.im - y.im)

    override def times(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re * y.re - x.im * y.im, x.re * y.im + x.im * y.re)

    override def negate(x: Complex[T]): Complex[T] = Complex(-x.re, -x.im)

    override def fromInt(x: Int): Complex[T] = Complex(num.fromInt(x))

    override def abs(x: Complex[T]): Complex[T] = ???

    override def parseString(str: String): Option[Complex[T]] = ???

    override def toInt(x: Complex[T]): Int = ???

    override def toLong(x: Complex[T]): Long = ???

    override def toFloat(x: Complex[T]): Float = ???

    override def toDouble(x: Complex[T]): Double = num.toDouble(x.re)

    override def lt(lhs: Complex[T], rhs: Complex[T]) = false

    override def compare(x: Complex[T], y: Complex[T]): Int = ???

    override def div(x: Complex[T], y: Complex[T]): Complex[T] = ???
      /*val denom = y.re * y.re + y.im * y.im
      Complex((x.re * y.re + x.im * y.im) / denom, (x.im * y.re - x.re * y.im)/denom)*/

  //implicit def NumericOps[T: Numeric: ClassTag](lhs: Complex[T]): Fractional[Complex[T]]#FractionalOps = complexIsFractional.mkNumericOps(lhs)

