/**
  * LUL Factorisation - ETH Zurich
  * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
  */
package linalg

/**
  * Class representing a block LUL factorisation problem
  *
  * @param P An invertible matrix over K
  * @param m Size of the left upper block (P1)
  * @param n Size of the right lower block (P4)
  * @tparam K Base field of the elements of P
  */
class LUL[K: Fractional](val P: Matrix[K], val m: Int, val n: Int) {
  assert(P.isInvertible && m + n == P.m)


  /**
    * upper left block of P
    */
  val P1 = P(0 until m, 0 until m)
  /**
    * upper right block of P
    */
  val P2 = P(0 until m, m until n + m)
  /**
    * lower left block of P
    */
  val P3 = P(m until n + m, 0 until m)
  /**
    * lower right block of P
    */
  val P4 = P(m until n + m, m until n + m)
  /**
    * Rank of P1
    */
  val p1 = P1.rk
  /**
    * rank of P2
    */
  val p2 = P2.rk
  /**
    * rank of P3
    */
  val p3 = P3.rk
  /**
    * rank of P4
    */
  val p4 = P4.rk
  /**
    * P2(ker P4)
    */
  val P2kerP4 = P2 * P4.ker
  /**
    * P1(ker P3)
    */
  val P1kerP3 = P1 * P3.ker
  /**
    * P4(ker P2)
    */
  val P4kerP2 = P4 * P2.ker
  /**
    * P3(ker P1)
    */
  val P3kerP1 = P3 * P1.ker
  /**
    * Minimal bound of rk R + rk L
    */
  val bound = Math.max(p3, m + n - p1 - p4)

  /**
    * Computes a solution that minimizes rk L and rk L + rk R
    *
    * @return an optimal L for the problem
    */
  def getSolution = if (p3 <= m + n - p1 - p4) solutionP3Smaller2() else solutionP3Bigger2()

  /**
    * Computes a solution in the case where p3 <= m + n - p1 - p4
    *
    * @return an optimal L
    */
  def solutionP3Smaller2() = {
    require(p3 <= m + n - p1 - p4)
    val Y1 = P3kerP1.doubleComplement(P4 inter P3, P3)
    val Y = Y1 ++ (Y1 ++ P4).complement
    val X2 = P2kerP4 inter P1
    val X3 = P1 -- (X2 ++ P1kerP3)
    val X1 = P2kerP4 -- X2
    val X4 = (X1 ++ X2 ++ X3 ++ P1kerP3).complement
    val F = ((P1.pseudoInverse * (X2 ++ X3)) ++ P1.ker) inter ((P3.pseudoInverse * Y1) ++ P3.ker)
    val Y2 = Y -- (P3 * ((P1.pseudoInverse * X2 ++ P1.ker) inter F))
    val right = (P1 * F) :: X1 :: P1kerP3 :: X4
    val left1 = (P3 * F) :: Y2
    val left2 = left1 :: Matrix.zeros(n, right.n - left1.n)
    left2 * right.inverse
  }

  /**
    * Computes a solution in the case where p3 >= m + n - p1 - p4
    *
    * @return an optimal L
    */
  def solutionP3Bigger2() = {
    require(p3 >= m + n - p1 - p4)
    val Y = (P4 inter P3).doubleComplement(P3kerP1, P3)
    val X2 = P2kerP4 inter P1
    val X3 = P1 -- (X2 ++ P1kerP3)
    val F = ((P1.pseudoInverse * (X2 ++ X3)) ++ P1.ker) inter ((P3.pseudoInverse * Y) ++ P3.ker)
    val Xp1 = P2kerP4 -- ((P1 * F) inter X2)
    val X4 = ((P1 * F) ++ Xp1 ++ P1kerP3).complement
    val Yp2 = Y -- P3 * (((P1.pseudoInverse * X2) ++ P1.ker) inter F)
    val right = (P1 * F) :: Xp1 :: P1kerP3 :: X4
    val left1 = (P3 * F) :: Yp2
    val left2 = left1 :: Matrix.zeros(n, right.n - left1.n)
    left2 * right.inverse
  }

  /**
    * Check whether a matrix is an optimal L for the problem
    *
    * @param S Solution (L) to try
    * @return if S is an optimal L
    */
  def isSolution(S: Matrix[K]) = {
    (P4 - (S * P2)).isInvertible && (S.rk + (P3 - S * P1).rk) == bound
  }
}

