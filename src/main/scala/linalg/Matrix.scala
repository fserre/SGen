/**
  * LUL Factorisation - ETH Zurich
  * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
  */
package linalg

/**
  * Matrix is a class to describe matrices.
  * It is immutable.
  *
  * @param m      number of columns (may be zero)
  * @param n      number of rows (may be zero)
  * @param values Vector containing the elements in row major order
  * @tparam T Base field of the elements
  */
case class Matrix[T: Fractional](val m: Int, val n: Int, val values: Vector[T]) {
  assert(values.size == m * n)
  /**
    * Transposed matrix
    */
  lazy val transpose = Matrix.tabulate(n, m)((i, j) => this (j, i))
  lazy val norm = math.sqrt(num.toDouble(values.map(x => {
    val abs = num.abs(x)
    num.times(abs, abs)
  }).sum))
  lazy val diag = {
    assert(m == n)
    Vec(Vector.tabulate(n)(i => this (i, i)))
  }
  /**
    * Rank of the matrix
    */
  lazy val rk = reducedColEchelonFormInt._2
  /**
    * Provides the reduced Row Echelon Form of this matrix
    */
  lazy val reducedRowEchelonForm = reducedRowEchelonFormInt._1
  /**
    * Provides the reduced Column Echelon Form of this matrix
    */
  lazy val reducedColEchelonForm = reducedColEchelonFormInt._1
  lazy val isFullRank = rk == Math.min(m, n)
  /**
    * Returns whether the matrix is invertible
    */
  lazy val isInvertible = m == n && isFullRank
  /**
    * Computes the inverse of the matrix
    */
  lazy val inverse = {
    assert(isInvertible)
    (this :: Matrix.identity(n)).reducedRowEchelonForm(0 until n, n until 2 * n)
  }
  /**
    * Returns the range of a matrix, i.e. a matrix witch columns are linear independent, and that spans the same subspace
    */
  lazy val range = this.reducedColEchelonForm(0 until this.m, 0 until this.rk)
  /**
    * Kernel of a matrix
    */
  lazy val ker = {
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
  lazy val pseudoInverse = {
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
  lazy val hasIndepCols = this.rk == this.n
  /**
    * Provides a complement of the space represented by the matrix
    * Does not require the matrix to have independent columns
    */
  lazy val complement = Matrix.identity[T](this.m) -- this
  lazy val trace = diag.values.sum
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
  val num = implicitly[Fractional[T]]

  def isZero() = values.forall(_ == num.zero)

  def isIdentity() = m == n && (0 until m).forall(j => (0 until m).forall(i => if (i == j) values(j * m + i) == num.one else values(j * m + i) == num.zero))

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
  def row(i: Int) = Vec(Vector.tabulate(n)(j => this (i, j)))

  /**
    * Returns a printable string representing the matrix
    *
    * @return A printable string representing the matrix
    */
  override def toString = if (n * m > 0) {
    val elementsStr = (0 until m).map(i => (0 until n).map(j => if (this (i, j) != num.zero) this (i, j).toString else ""))
    val maxLength = elementsStr.map(_.map(_.length).max).max
    elementsStr.map(_.map(s => " " * (maxLength - s.length) + s).mkString("(", " ", ")\n")).mkString("")
  } else n + "x" + m + " matrix"

  def toTex = {
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
  def apply(i: Int, j: Int) = values(i * n + j)

  /**
    * Adds two matrices
    *
    * @param rhs A matrix with the same size
    * @return the sum of two matrices
    */
  def +(rhs: Matrix[T]) = {
    assert(m == rhs.m && n == rhs.n)
    new Matrix(m, n, Vector.tabulate(m * n)(i => num.plus(values(i), rhs.values(i))))
  }

  /**
    * Removes a matrix to another one
    *
    * @param rhs A matrix with the same size
    * @return the difference of this matrix with rhs
    */
  def -(rhs: Matrix[T]) = {
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
  def swapRows(row1: Int, row2: Int) = Matrix.tabulate(m, n)((i, j) => if (i == row1) this (row2, j) else if (i == row2) this (row1, j) else this (i, j))

  /**
    * Returns this matrix with two columns swapped
    *
    * @param col1 index of the first column
    * @param col2 index of the second column
    * @return this matrix with col1 and col2 swapped
    */
  def swapCols(col1: Int, col2: Int) = Matrix.tabulate(m, n)((i, j) => if (j == col1) this (i, col2) else if (j == col2) this (i, col1) else this (i, j))

  /**
    * Returns the same matrix, with a row multiplied by a scalar added to another one
    *
    * @param row1 index of the first row
    * @param l    scalar that will be multiplied to row1
    * @param row2 index of the second row
    * @return this matrix with row1 multiplied by a scalar added to row2
    */
  def addRowTo(row1: Int, l: T, row2: Int) = Matrix.tabulate(m, n)((i, j) => if (i == row2) num.plus(this (i, j), num.times(l, this (row1, j))) else this (i, j))

  /**
    * Returns the same matrix, with a column multiplied by a scalar added to another one
    *
    * @param col1 index of the first column
    * @param l    scalar that will be multiplied to col1
    * @param col2 index of the second column
    * @return the same matrix with column col1 multiplied by a scalar l added to col2
    */
  def addColTo(col1: Int, l: T, col2: Int) = Matrix.tabulate(m, n)((i, j) => if (j == col2) num.plus(this (i, j), num.times(l, this (i, col1))) else this (i, j))

  /**
    * Returns the same matrix, with a row multiplied by a scalar
    *
    * @param row index of the row
    * @param l   scalar
    * @return the same matrix, with row multiplied by l
    */
  def mulRow(row: Int, l: T) = {
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
  def mulCol(col: Int, l: T) = {
    assert(l != num.zero)
    Matrix.tabulate(m, n)((i, j) => if (j == col) num.times(l, this (i, col)) else this (i, j))
  }

  override def equals(rhs: Any) = {
    rhs match {
      case mat: Matrix[T] => (mat.m == m && mat.n == n && (0 until m).forall(i => (0 until n).forall(j => this (i, j) == mat(i, j))))
      case _ => false
    }
  }

  override def hashCode = m

  /**
    * Computes a matrix representing a complement of a subspace within another one and that has a trivial intersection with a third one
    * * The matrices do not need to have independent columns
    *
    * @param B subspace of C, with a dimension smaller than this, with which the output will have a trivial intersection
    * @param C a matrix representing a subspace
    * @return a matrix representing a complement of this within C and that has a trivial intersection with B
    */
  def doubleComplement(B: Matrix[T], C: Matrix[T]) = {
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
  def cols = (0 until n).map(col)

  /**
    * Computes a matrix representing the sum of two subspaces
    * It does not require the matrices to have independent columns
    *
    * @param rhs a matrix representing another subspace
    * @return a matrix representing the sum of this and rhs
    */
  def ++(rhs: Matrix[T]) = (this :: rhs).range

  /**
    * Computes a matrix representing a complement of a subspace within another one
    * The matrices do not need to have independent columns
    *
    * @param rhs a matrix representing another subspace
    * @return a matrix representing a complement of rhs within this
    */
  def --(rhs: Matrix[T]) = {
    (Matrix(this.m, 0, Vector()) /: (0 until this.n).map(this.col)) ((acc, v) => {
      val cur = acc :: v
      if ((rhs :: cur).rk > (rhs :: acc).rk) cur else acc
    })
  }

  /**
    * Returns the jth column vector
    *
    * @param j column index
    * @return the specified column
    */
  def col(j: Int) = Vec(Vector.tabulate(m)(i => this (i, j)))

  /**
    * Computes a matrix representing the intersection of two subspaces
    * The matrices do not need to have independent columns
    *
    * @param rhs a matrix representing another subspace
    * @return a matrix representing the intersection of this and rhs
    */
  def inter(rhs: Matrix[T]) = {
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

  def oplus(rhs: Matrix[T]) = (this :: Matrix.zeros(this.m, rhs.n)) / (Matrix.zeros(rhs.m, this.n) :: rhs)

  /**
    * Concatenates horizontally two matrices with the same number of rows
    *
    * @param lhs Matrix to be concatenated with
    * @return The concatenation of this matrix with lhs
    */
  def ::(lhs: Matrix[T]) = {
    assert(m == lhs.m)
    Matrix.tabulate(m, n + lhs.n)((i, j) => if (j < lhs.n) lhs(i, j) else this (i, j - lhs.n))
  }

  /**
    * Concatenates vertically two matrices with the same number of columns
    *
    * @param rhs Lower matrix
    * @return the vertical concatenation of this matrix with rhs on the bottom
    */
  def /(rhs: Matrix[T]) = {
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
    * Creates a new matrix
    *
    * @param m      number of rows
    * @param n      number of columns
    * @param values elements of the matrix in row major order
    * @tparam T Base field of the matrix elements
    * @return a new matrix
    */
  //def apply[T: Fractional](m: Int, n: Int, values: Vector[T]) = new Matrix(m, n, values)

  /**
    * Creates a new Matrix by concatenating a collection of columns
    *
    * @param m      number of rows
    * @param values a collection of Vecs of size m
    * @tparam T Base field of the matrix elements
    * @return a new matrix with the specified columns
    */
  def fromVecs[T: Fractional](m: Int, values: Traversable[Vec[T]]) = {
    assert(values.forall(_.m == m))
    (Matrix[T](m, 0, Vector()) /: values) (_ :: _)
  }

  /**
    * Returns a zero filled matrix
    *
    * @param m number of rows
    * @param n number of columns
    * @tparam T Base field of the elements
    * @return a zero filled matrix with the specified size
    */
  def zeros[T: Fractional](m: Int, n: Int) = tabulate(m, n)((_, _) => implicitly[Fractional[T]].zero)

  /**
    * Returns a one filled matrix
    *
    * @param m number of rows
    * @param n number of columns
    * @tparam T Base field of the elements
    * @return a matrix of the specified dimention filled with ones
    */
  def ones[T: Fractional](m: Int, n: Int) = tabulate(m, n)((_, _) => implicitly[Fractional[T]].one)

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
  def reverseIdentity[T: Fractional](n: Int) = tabulate(n, n)((i, j) => if (n - i - 1 == j) implicitly[Fractional[T]].one else implicitly[Numeric[T]].zero)

  def element[T: Fractional](m: Int, n: Int, i: Int, j: Int) = tabulate(m, n)((x, y) => if (x == i && y == j) implicitly[Fractional[T]].one else implicitly[Fractional[T]].zero)

  def invertibles(n: Int) = matrices(n, n).map(identity[F2](n) + _).filter(_.isInvertible)

  /**
    * Returns the identity matrix
    *
    * @param n Size of the matrix
    * @tparam T Base field of the elements
    * @return the identity matrix of the specified size
    */
  def identity[T: Fractional](n: Int) = tabulate(n, n)((i, j) => if (i == j) implicitly[Fractional[T]].one else implicitly[Numeric[T]].zero)

  def matrices(m: Int, n: Int) = (0 until 1 << (n * m)).toIterator.map(i => fromBigInt(m, n, i))

  def fromBigInt(m: Int, n: Int, value: BigInt) = Matrix(m, n, Vector.tabulate(m * n)(i => F2(value.testBit(m * n - i - 1))))

  implicit class MatrixF2(m: Matrix[F2]) {
    lazy val order = {
      assert(m.isInvertible)
      var result = 1
      var current = m
      while (current != Matrix.identity[F2](m.m)) {
        result += 1
        current *= m
      }
      result
    }
    lazy val toBigInt = {
      (0 until (m.m * m.n)).foldLeft(BigInt(0))((cur, i) => if (m.values(i).value) cur.setBit(i) else cur)
    }
    lazy val toByteArray = toBigInt.toByteArray
  }

}

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
  override def toString = values.mkString("(", " ", ")^T")

  /**
    * Returns an element of the vector
    *
    * @param i index of the element
    * @return the element at index i
    */
  def apply(i: Int) = values(i)

  def apply(rows: Range): Vec[T] = Vec(rows.map(i => this (i)).toVector)

  def +(rhs: Vec[T]) = {
    assert(values.size == rhs.values.size)
    new Vec[T](Vector.tabulate(values.size)(i => num.plus(values(i), rhs.values(i))))
  }

  def scalar(rhs: Vec[T]) = values.zip(rhs.values).map(i => num.times(i._1, i._2)).sum
}

/**
  * Companion object of vectors
  */
object Vec {
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

  def ofSize(size: Int) = (0 until (1 << size)).map(i => fromInt(size, i))

  def fromInt(size: Int, value: Int) = new Vec[F2](Vector.tabulate(size)(i => F2((value & (1 << (size - i - 1))) != 0)))

  implicit class VecF2(v: Vec[F2]) {
    def toInt() = (0 until v.m).foldLeft(0)((res, k) => if (v(v.m - k - 1).value) res + (1 << k) else res)

    def bitCount() = (0 until v.m).foldLeft(0)((res, k) => if (v(k).value) res + 1 else res)
  }

}

