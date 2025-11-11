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
import maths.linalg.Vec

import scala.collection.{IndexedSeqView, View}

/**
 * Matrix is a class to describe matrices.
 * It is immutable.
 *
 * @param m      number of columns (may be zero)
 * @param n      number of rows (may be zero)
 * @param values Vector containing the elements in row major order
 * @tparam T Base field of the elements
 */
case class Matrix[T: Fractional](m: Int, n: Int, values: Vector[T]) {
  assert(values.size == m * n)
  /**
   * Transposed matrix
   */
  lazy val transpose:Matrix[T] = Matrix.tabulate(n, m)((i, j) => this (j, i))
  lazy val norm:Double = Math.sqrt(values.map(x => {
    val abs = num.toDouble(num.abs(x))
    abs * abs
  }).sum)
  private lazy val diag :Vec[T]= {
    assert(m == n)
    Vec(Vector.tabulate(n)(i => this (i, i)))
  }
  /**
   * Rank of the matrix
   */
  lazy val rk:Int = reducedColEchelonFormInt._2
  /**
   * Provides the reduced Row Echelon Form of this matrix
   */
  private lazy val reducedRowEchelonForm:Matrix[T] = reducedRowEchelonFormInt._1
  /**
   * Provides the reduced Column Echelon Form of this matrix
   */
  private lazy val reducedColEchelonForm :Matrix[T]= reducedColEchelonFormInt._1
  private lazy val isFullRank:Boolean = rk == Math.min(m, n)
  /**
   * Returns whether the matrix is invertible
   */
  lazy val isInvertible:Boolean = m == n && isFullRank
  /**
   * Computes the inverse of the matrix
   */
  lazy val inverse:Matrix[T] = {
    assert(isInvertible)
    (this :: Matrix.identity(n)).reducedRowEchelonForm(0 until n, n until 2 * n)
  }
  /**
   * Returns the range of a matrix, i.e. a matrix witch columns are linear independent, and that spans the same subspace
   */
  lazy val range:Matrix[T] = this.reducedColEchelonForm(0 until this.m, 0 until this.rk)
  /**
   * Kernel of a matrix
   */
  lazy val ker:Matrix[T] = {
    val M = this / Matrix.identity[T](this.n)
    val M2 = M.reducedColEchelonForm
    (0 until this.n).find(j => (0 until this.m).forall(i => M2(i, j) == implicitly[Fractional[T]].zero)) match {
      case None => Matrix(this.n, 0, Vector())
      case Some(begin) => M2(this.m until this.m + this.n, begin until this.n)
    }
  }
  /**
   * Returns a generalized pseudo inverse of the matrix, ie a matrix such that:
   * this * pseudoInverse * this == this
   */
  lazy val pseudoInverse:Matrix[T] = {
    if (this.isInvertible) this.inverse
    else {
      //println(mat)
      val S = range.complement //transpose.ker//im.sup.values
      val M = (this :: S) / (Matrix.identity[T](this.n) :: Matrix.zeros[T](this.n, S.n))
      M.reducedColEchelonForm(this.m until M.m, 0 until this.m)
    }
  }
  /**
   * True if the matrix has independent columns
   */
  lazy val hasIndepCols:Boolean = this.rk == this.n
  /**
   * Provides a complement of the space represented by the matrix
   * Does not require the matrix to have independent columns
   */
  lazy val complement:Matrix[T] = Matrix.identity[T](this.m) -- this
  lazy val trace:T = diag.values.sum
  /**
   * Computes the reduced row echelon form of this matrix ans its rank, using gaussian elimination
   */
  private lazy val reducedRowEchelonFormInt = (0 until n).foldLeft((this, 0)) {
    case ((current, rank), column) =>
      (rank until m).find(i => current(i, column) != num.zero) match {
        case None => (current, rank)
        case Some(pivot) =>
          val cur2 = current.swapRows(pivot, rank)
          val cur3 = cur2.mulRow(rank, num.div(num.one, cur2(rank, column)))
          val cur4 = (0 until m).foldLeft(cur3)((current, i) => if (i == rank) current else current.addRowTo(rank, num.negate(current(i, column)), i))
          (cur4, rank + 1)
      }
  }
  /**
   * Computes the reduced column echelon form of this matrix and its rank, using gaussian elimination
   */
  private lazy val reducedColEchelonFormInt = (0 until m).foldLeft((this, 0)) {
    case ((current, rank), row) =>
      (rank until n).find(j => current(row, j) != num.zero) match {
        case None => (current, rank)
        case Some(pivot) =>
          val cur2 = current.swapCols(rank, pivot)
          val cur3 = cur2.mulCol(rank, num.div(num.one, cur2(row, rank)))
          val cur4 = (0 until n).foldLeft(cur3)((current, j) => if (j == rank) current else current.addColTo(rank, num.negate(current(row, j)), j))
          (cur4, rank + 1)
      }
  }
  val num:Fractional[T] = implicitly[Fractional[T]]

  def isZero:Boolean = values.forall(_ == num.zero)

  def isIdentity:Boolean = m == n && (0 until m).forall(j => (0 until m).forall(i => values(j*m+i)==(if (i == j)  num.one else  num.zero)))

  private def isReverseIdentity:Boolean =  m == n && (0 until m).forall(j => (0 until m).forall(i => values(j*m+i)==(if (i == n-j-1)  num.one else  num.zero)))

  /**
   * Returns a submatrix
   *
   * @param rows A range of the rows of the submatrix
   * @param cols A range of the columns of the submatrix
   * @return the submatrix formed by the specified rows and columns
   */
  def apply(rows: Range, cols: Range): Matrix[T] = Matrix(rows.size, cols.size, rows.flatMap(i => cols.map(j => this (i, j))).toVector)

  /**
   * Returns a Vec formed by the elements of a specified row
   *
   * @param i row index
   * @return a Vec formed by the elements of the specified row
   */
  def row(i: Int):Vec[T] = Vec(Vector.tabulate(n)(j => this (i, j)))

  /**
   * Returns a printable string representing the matrix
   *
   * @return A printable string representing the matrix
   */
  override def toString:String =
    if(isIdentity)
      s"I$n"
    else if (n*m==0)
      s"${n}x$m matrix"
    else if (isZero)
      s"${n}x$m 0"
    else if (isReverseIdentity)
      s"R$n"
    else
    {
      val elementsStr = (0 until m).map(i => (0 until n).map(j => if (this (i, j) != num.zero) this (i, j).toString else "."))
      val maxLength = elementsStr.map(_.map(_.length).max).max
      elementsStr.map(_.map(s => " " * (maxLength - s.length) + s).mkString("(", " ", ")\n")).mkString("")
    }

  def toTex:String = {
    "\\begin{pmatrix}" +
      (0 until m).map(j => (0 until n).map(i => apply(j, i)).mkString(" & ")).mkString("\\\\") +
      "\\end{pmatrix}"
  }

  /**
   * Returns the value of the element at row i and column j
   *
   * @param i row
   * @param j column
   * @return the element at the specified position
   */
  def apply(i: Int, j: Int):T = values(i * n + j)

  /**
   * Adds two matrices
   *
   * @param rhs A matrix with the same size
   * @return the sum of two matrices
   */
  def +(rhs: Matrix[T]):Matrix[T] = {
    assert(m == rhs.m && n == rhs.n)
    new Matrix(m, n, Vector.tabulate(m * n)(i => num.plus(values(i), rhs.values(i))))
  }

  /**
   * Removes a matrix to another one
   *
   * @param rhs A matrix with the same size
   * @return the difference of this matrix with rhs
   */
  def -(rhs: Matrix[T]):Matrix[T] = {
    assert(m == rhs.m && n == rhs.n)
    new Matrix(m, n, Vector.tabulate(m * n)(i => num.minus(values(i), rhs.values(i))))
  }

  /**
   * Multiplies two matrices
   *
   * @param rhs A matrix with a compatible size
   * @return the product of this matrix with rhs
   */
  def *(rhs: Vec[T]): Vec[T] = {
    assert(n == rhs.m)
    Vec[T](Vector.tabulate(m)(i => (0 until n).map(k => num.times(this (i, k), rhs(k))).sum))
  }

  def ^(k: Int): Matrix[T] = {
    (0 until k).foldLeft(Matrix.identity(n))((M, _) => M * this)
  }

  /**
   * Multiplies two matrices
   *
   * @param rhs A matrix with a compatible size
   * @return the product of this matrix with rhs
   */
  def *(rhs: Matrix[T]): Matrix[T] = {
    assert(n == rhs.m)
    Matrix.tabulate(m, rhs.n)((i, j) => (0 until n).map(k => num.times(this (i, k), rhs(k, j))).sum)
  }

  /**
   * Returns this matrix with two rows swapped
   *
   * @param row1 index of the first row
   * @param row2 index of the second row
   * @return this matrix with row1 and row2 swapped
   */
  private def swapRows(row1: Int, row2: Int):Matrix[T] = Matrix.tabulate(m, n)((i, j) => if (i == row1) this (row2, j) else if (i == row2) this (row1, j) else this (i, j))

  /**
   * Returns this matrix with two columns swapped
   *
   * @param col1 index of the first column
   * @param col2 index of the second column
   * @return this matrix with col1 and col2 swapped
   */
  private def swapCols(col1: Int, col2: Int):Matrix[T] = Matrix.tabulate(m, n)((i, j) => if (j == col1) this (i, col2) else if (j == col2) this (i, col1) else this (i, j))

  /**
   * Returns the same matrix, with a row multiplied by a scalar added to another one
   *
   * @param row1 index of the first row
   * @param l    scalar that will be multiplied to row1
   * @param row2 index of the second row
   * @return this matrix with row1 multiplied by a scalar added to row2
   */
  private def addRowTo(row1: Int, l: T, row2: Int):Matrix[T] = Matrix.tabulate(m, n)((i, j) => if (i == row2) num.plus(this (i, j), num.times(l, this (row1, j))) else this (i, j))

  /**
   * Returns the same matrix, with a column multiplied by a scalar added to another one
   *
   * @param col1 index of the first column
   * @param l    scalar that will be multiplied to col1
   * @param col2 index of the second column
   * @return the same matrix with column col1 multiplied by a scalar l added to col2
   */
  private def addColTo(col1: Int, l: T, col2: Int):Matrix[T] = Matrix.tabulate(m, n)((i, j) => if (j == col2) num.plus(this (i, j), num.times(l, this (i, col1))) else this (i, j))

  /**
   * Returns the same matrix, with a row multiplied by a scalar
   *
   * @param row index of the row
   * @param l   scalar
   * @return the same matrix, with row multiplied by l
   */
  private def mulRow(row: Int, l: T):Matrix[T] = {
    assert(l != num.zero)
    Matrix.tabulate(m, n)((i, j) => if (i == row) num.times(l, this (row, j)) else this (i, j))
  }

  /**
   * Returns the same matrix, with a column multiplied by a scalar
   *
   * @param col index of the column
   * @param l   scalar
   * @return the same matrix, with column col multiplied by l
   */
  private def mulCol(col: Int, l: T):Matrix[T] = {
    assert(l != num.zero)
    Matrix.tabulate(m, n)((i, j) => if (j == col) num.times(l, this (i, col)) else this (i, j))
  }

  override def equals(rhs: Any):Boolean = {
    rhs match {
      case mat: Matrix[?] => mat.m == m && mat.n == n && (0 until m).forall(i => (0 until n).forall(j => this (i, j) == mat(i, j)))
      case _ => false
    }
  }

  override def hashCode:Int = m

  /**
   * Computes a matrix representing a complement of a subspace within another one and that has a trivial intersection with a third one
   * * The matrices do not need to have independent columns
   *
   * @param B subspace of C, with a dimension smaller than this, with which the output will have a trivial intersection
   * @param C a matrix representing a subspace
   * @return a matrix representing a complement of this within C and that has a trivial intersection with B
   */
  def doubleComplement(B: Matrix[T], C: Matrix[T]):Matrix[T] = {
    val A = this
    require(A.rk >= B.rk)
    val AiB = A inter B
    val P = A -- AiB
    val Q = B -- AiB
    val Sp = C -- (A ++ B)
    Matrix.fromVecs[T](C.m, P.cols.zip(Q.cols).map(t => Vec(t._1 + t._2))) :: Sp
  }

  /**
   * Returns an iterator over the columns of the matrix
   *
   * @return an iterator over the columns of the matrix
   */
  private def cols:IndexedSeq[Vec[T]] = (0 until n).map(col)

  /**
   * Computes a matrix representing the sum of two subspaces
   * It does not require the matrices to have independent columns
   *
   * @param rhs a matrix representing another subspace
   * @return a matrix representing the sum of this and rhs
   */
  def ++(rhs: Matrix[T]):Matrix[T] = (this :: rhs).range

  /**
   * Computes a matrix representing a complement of a subspace within another one
   * The matrices do not need to have independent columns
   *
   * @param rhs a matrix representing another subspace
   * @return a matrix representing a complement of rhs within this
   */
  def --(rhs: Matrix[T]):Matrix[T] = (0 until this.n).map(this.col).foldLeft(Matrix(this.m, 0, Vector())) { (acc, v) =>
    val cur = acc :: v
    if ((rhs :: cur).rk > (rhs :: acc).rk) cur else acc
  }

  /**
   * Returns the jth column vector
   *
   * @param j column index
   * @return the specified column
   */
  def col(j: Int):Vec[T] = Vec(Vector.tabulate(m)(i => this (i, j)))

  /**
   * Computes a matrix representing the intersection of two subspaces
   * The matrices do not need to have independent columns
   *
   * @param rhs a matrix representing another subspace
   * @return a matrix representing the intersection of this and rhs
   */
  infix def inter(rhs: Matrix[T]):Matrix[T] = {
    val M = (this :: rhs) / (this :: Matrix.zeros[T](this.m, rhs.n))
    val M2 = M.reducedColEchelonForm
    (0 until M2.n).find(j => (0 until this.m).forall(i => M2(i, j) == implicitly[Fractional[T]].zero)) match {
      case None => Matrix(this.m, 0, Vector())
      case Some(begin) => (begin until M2.n).find(j => (this.m until 2 * this.m).forall(i => M2(i, j) == implicitly[Fractional[T]].zero)) match {
        case None => M2(this.m until 2 * this.m, begin until M2.n)
        case Some(end) => M2(this.m until 2 * this.m, begin until end)
      }
    }
  }

  infix def oplus(rhs: Matrix[T]):Matrix[T] = (this :: Matrix.zeros(this.m, rhs.n)) / (Matrix.zeros(rhs.m, this.n) :: rhs)

  /**
   * Concatenates horizontally two matrices with the same number of rows
   *
   * @param lhs Matrix to be concatenated with
   * @return The concatenation of this matrix with lhs
   */
  def ::(lhs: Matrix[T]):Matrix[T] = {
    assert(m == lhs.m)
    Matrix.tabulate(m, n + lhs.n)((i, j) => if (j < lhs.n) lhs(i, j) else this (i, j - lhs.n))
  }

  /**
   * Concatenates vertically two matrices with the same number of columns
   *
   * @param rhs Lower matrix
   * @return the vertical concatenation of this matrix with rhs on the bottom
   */
  def /(rhs: Matrix[T]):Matrix[T] = {
    assert(n == rhs.n)
    Matrix(m + rhs.m, n, values ++ rhs.values)
  }
}

/**
 * Companion object of Matrix
 */
object Matrix {
  def apply(m: Int, n: Int, values: String) = new Matrix[F2](m, n, Vector.tabulate(m * n)(i => F2(values(i) == '1')))

  /**
   * Creates a new Matrix by concatenating a collection of columns
   *
   * @param m      number of rows
   * @param values a collection of Vecs of size m
   * @tparam T Base field of the matrix elements
   * @return a new matrix with the specified columns
   */
  private def fromVecs[T: Fractional](m: Int, values: Seq[Vec[T]]):Matrix[T] = {
    assert(values.forall(_.m == m))
    values.foldLeft(Matrix[T](m, 0, Vector()))(_ :: _)
  }

  /**
   * Returns a zero filled matrix
   *
   * @param m number of rows
   * @param n number of columns
   * @tparam T Base field of the elements
   * @return a zero filled matrix with the specified size
   */
  def zeros[T: Fractional](m: Int, n: Int):Matrix[T] = tabulate(m, n)((_, _) => implicitly[Fractional[T]].zero)

  /**
   * Returns a one filled matrix
   *
   * @param m number of rows
   * @param n number of columns
   * @tparam T Base field of the elements
   * @return a matrix of the specified dimention filled with ones
   */
  def ones[T: Fractional](m: Int, n: Int):Matrix[T] = tabulate(m, n)((_, _) => implicitly[Fractional[T]].one)

  /**
   * Builds a new matrix by tabulating the elements using a function
   *
   * @param m number of rows
   * @param n number of columns
   * @param f a function returning an element, given its position in the matrix
   * @tparam T Base field of the matrix elements
   * @return a matrix tabulated using f
   */
  def tabulate[T: Fractional](m: Int, n: Int)(f: (Int, Int) => T) = new Matrix(m, n, Vector.tabulate(m * n)(x => f(x / n, x % n)))

  /**
   * Returns a square matrix filled with ones in the anti-diagonal, and zeros elsewhere
   *
   * @param n size of the matrix
   * @tparam T Base field of the elements
   * @return a square matrix filled with ones in the anti-diagonal, and zeros elsewhere
   */
  def reverseIdentity[T: Fractional](n: Int):Matrix[T] = tabulate(n, n)((i, j) => if (n - i - 1 == j) implicitly[Fractional[T]].one else implicitly[Numeric[T]].zero)

  def element[T: Fractional](m: Int, n: Int, i: Int, j: Int):Matrix[T] = tabulate(m, n)((x, y) => if (x == i && y == j) implicitly[Fractional[T]].one else implicitly[Fractional[T]].zero)

  def invertibles(n: Int):View[Matrix[F2]] = matrices(n, n).map(identity[F2](n) + _).filter(_.isInvertible)

  /**
   * Returns the identity matrix
   *
   * @param n Size of the matrix
   * @tparam T Base field of the elements
   * @return the identity matrix of the specified size
   */
  def identity[T: Fractional](n: Int):Matrix[T] = tabulate(n, n)((i, j) => if (i == j) implicitly[Fractional[T]].one else implicitly[Numeric[T]].zero)

  def matrices(m: Int, n: Int): IndexedSeqView[Matrix[F2]] = (0 until 1 << (n * m)).view.map(i => fromBigInt(m, n, i))

  private def fromBigInt(m: Int, n: Int, value: BigInt):Matrix[F2] = Matrix(m, n, Vector.tabulate(m * n)(i => F2(value.testBit(m * n - i - 1))))

  extension (m: Matrix[F2]) {
    def order:Int = {
      assert(m.isInvertible)
      var result = 1
      var current = m
      while (current != Matrix.identity[F2](m.m)) {
        result += 1
        current *= m
      }
      result
    }
    def toBigInt:BigInt = (0 until (m.m * m.n)).foldLeft(BigInt(0))((cur, i) => if (m.values(i).value) cur.setBit(i) else cur)
    def toByteArray:Array[Byte] = toBigInt.toByteArray
  }

}





