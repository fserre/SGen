/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
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

package SPL.FFT

import AcyclicStreamingModule.HardwareType.HW
import SPL._
import StreamingModule.StreamingModule
import linalg.Fields.{Complex, F2}
import linalg.Matrix

object DFT {
  def Q[T](n: Int, r: Int, l: Int): SPL[T] = {
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

  def omega(n: Int, pow: Int): Complex[Double] = {
    val angle = -2 * Math.PI * pow / (1 << n)
    Complex(Math.cos(angle), Math.sin(angle))
  }
  def Pease(n: Int, r: Int): SPL[Complex[Double]] = {
    assert(n%r==0)
    if(n==1)
      DFT2()
    else
      LinearPerm(LinearPerm.Rmat(r, n)) * Product(n / r)(l => DiagC(n, r,n/r-l-1) * ITensor(n-r,CTDFT(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def ItPease(n: Int, r: Int): SPL[Complex[Double]] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2()
    else
      LinearPerm(LinearPerm.Rmat(r, n)) * ItProduct(n / r, StreamDiagC(n, r) * ITensor(n - r, CTDFT(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def ItPeaseFused(n: Int, r: Int): SPL[Complex[Double]] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2()
    else
      ItProduct(n / r + 1, LinearPerm(Seq.fill(n / r)(LinearPerm.Lmat(r, n).inverse) :+ LinearPerm.Rmat(r, n)), Some(StreamDiagC(n, r) * ITensor(n - r, CTDFT(r, 1))))
  }
  //def stream(n: Int, r: Int, k: Int, hw: HW[Complex[Double]],dualPorted:Boolean): StreamingModule[Complex[Double]] = CTDFT(n, r).stream(k)(hw)
}
