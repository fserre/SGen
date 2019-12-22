/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL.WHT

import SB.HW.HW
import SPL.{ITensor, ItProduct, LinearPerm, Product, SPL}
import _root_.SPL.FFT.DFT2
import linalg.Fields.{Complex, F2}
import linalg.Matrix

object WHT {
  def Q[T](n: Int, r: Int, l: Int) = {
    val mat1 = Matrix.identity[F2](r * l) oplus LinearPerm.Lmat(n - r * (l + 1), n - r * l)
    val mat2 = Matrix.identity[F2](r * (l + 1)) oplus LinearPerm.Lmat(r, n - r * (l + 1))
    val mat = mat1 * mat2
    LinearPerm[T](mat)
  }

  def apply[T: Numeric](n: Int, r: Int): SPL[T] = {
  if (n == 1)
    DFT2[T]()
  else
    LinearPerm(LinearPerm.Lmat(r, n)) * Product(n / r)(l => ITensor(n - r, WHT[T](r, 1)) * Q(n, r, l))
  }

  def Pease[T: Numeric](n: Int, r: Int): SPL[T] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2[T]()
    else
      Product(n / r)(l => ITensor(n - r, apply(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def ItPease[T: Numeric](n: Int, r: Int): SPL[T] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2[T]()
    else
      ItProduct(n / r, ITensor(n - r, apply(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def stream[T](n: Int, r: Int, k: Int, hw: HW[T]) = WHT[T](n, r)(hw.num).stream(k)(hw)
}
