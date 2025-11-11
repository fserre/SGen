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

package maths.linalg

import maths.fields.F2

/**
 * Class that represents a column vector. It behaves as a regular matrix.
 *
 * @param values Vector containing the elements
 * @tparam T Base field of the elements
 */
class Vec[T: Fractional](override val values: Vector[T]) extends Matrix[T](values.size, 1, values) {
  /**
   * Returns a printable string representing the vector
   *
   * @return A printable string representing the vector
   */
  override def toString: String = values.mkString("(", " ", ")^T")

  /**
   * Returns an element of the vector
   *
   * @param i index of the element
   * @return the element at index i
   */
  def apply(i: Int): T = values(i)

  def apply(rows: Range): Vec[T] = Vec(rows.map(i => this (i)).toVector)

  def +(rhs: Vec[T]): Vec[T] = {
    assert(values.size == rhs.values.size)
    new Vec[T](Vector.tabulate(values.size)(i => num.plus(values(i), rhs.values(i))))
  }

  infix def scalar(rhs: Vec[T]): T = values.zip(rhs.values).map(i => num.times(i._1, i._2)).sum
}

/**
 * Companion object of vectors
 */
object Vec {

  import scala.language.implicitConversions

  /**
   * Creates a new vector with the elements as arguments
   *
   * @param values Elements of the vector
   * @tparam T Base field of the elements
   * @return a new vector
   */
  def apply[T: Fractional](values: T*) = new Vec(values.toVector)

  /**
   * Creates a new vector
   *
   * @param values Elements of the vector
   * @tparam T Base field of the elements
   * @return a new vector
   */
  def apply[T: Fractional](values: Vector[T]) = new Vec(values)

  /**
   * Converts a one column matrix to a vector
   *
   * @param mat One column Matrix
   * @tparam T Base field of the elements
   * @return mat converted to a vector
   */
  implicit def apply[T: Fractional](mat: Matrix[T]): Vec[T] = {
    assert(mat.n == 1)
    new Vec(mat.values)
  }

  def ofSize(size: Int): Seq[Vec[F2]] = (0 until (1 << size)).map(i => fromInt(size, i))

  def fromInt(size: Int, value: Int) = new Vec[F2](Vector.tabulate(size)(i => F2((value & (1 << (size - i - 1))) != 0)))

  extension (v: Vec[F2]) {
    def toInt: Int = (0 until v.m).foldLeft(0)((res, k) => if (v(v.m - k - 1).value) res + (1 << k) else res)

    def bitCount: Int = (0 until v.m).foldLeft(0)((res, k) => if (v(k).value) res + 1 else res)
  }

}