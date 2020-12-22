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

package transforms
package WHT

import DSL.RTL.HardwareType.HW
import DSL.RTL.{RAMControl, StreamingModule}
import DSL.SPL.{ITensor, ItProduct, Product, SPL}
import transforms.FFT.DFT2
import linalg.Fields.{Complex, F2}
import linalg.Matrix
import transforms.SLP.LinearPerm

object WHT {
  def Q[T](n: Int, r: Int, l: Int): SPL[T] = {
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
      Product(n / r)(_ => ITensor(n - r, apply(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def ItPease[T: Numeric](n: Int, r: Int): SPL[T] = {
    assert(n % r == 0)
    if (n == 1)
      DFT2[T]()
    else
      ItProduct(n / r, ITensor(n - r, apply(r, 1)) * LinearPerm(LinearPerm.Lmat(r, n).inverse))
  }

  def stream[T](n: Int, r: Int, k: Int, hw: HW[T],control:RAMControl): StreamingModule[T] = WHT[T](n, r)(using hw.num).stream(k,control)(using hw)
}
