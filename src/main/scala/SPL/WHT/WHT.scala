/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL.WHT

import SPL.{ITensor, LinearPerm, Product, SPL}
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
def apply[T:Numeric](n:Int):SPL[T]={
  if (n == 1)
    DFT2[T]()
  else
    LinearPerm(LinearPerm.Lmat(1, n)) * Product(n)(l => ITensor(n-1,DFT2[T]())  * Q(n, 1, l))
}
}
