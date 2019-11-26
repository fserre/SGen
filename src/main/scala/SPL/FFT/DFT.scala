package SPL.FFT

import SB.HW.HW
import SPL._
import _root_.SPL.WHT.WHT
import linalg.Fields.{Complex, F2}
import linalg.Matrix

object DFT {
  def Q[T](n: Int, r: Int, l: Int) = {
    val mat1 = Matrix.identity[F2](r * l) oplus LinearPerm.Lmat(n - r * (l + 1), n - r * l)
    val mat2 = Matrix.identity[F2](r * (l + 1)) oplus LinearPerm.Lmat(r, n - r * (l + 1))
    val mat = mat1 * mat2
    LinearPerm[T](mat)
  }

  def CTDFT(n: Int, r: Int): SPL[Complex[Double]] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2()
    else
      LinearPerm(LinearPerm.Lmat(r, n)) * Product(n / r)(l => ITensor(n - r, CTDFT(r, 1)) * DiagE(n, r, l) * Q(n, r, l)) * LinearPerm(LinearPerm.Rmat(r, n))
  }

  def omega(n: Int, pow: Int) = {
    val angle = -2 * Math.PI * pow / (1 << n)
    Complex(Math.cos(angle), Math.sin(angle))
  }

  def stream(n: Int, r: Int, k: Int, hw: HW[Complex[Double]]) = CTDFT(n, r).stream(k)(hw)
}
