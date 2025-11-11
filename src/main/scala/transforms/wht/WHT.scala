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

package transforms
package wht

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Flopoco, HW, IEEE754}
import ir.rtl.{RAMControl, StreamingModule}
import ir.spl.{ITensor, ItProduct, Product, SPL}
import transforms.fft.{DFT, DFT2}
import maths.fields.{Complex, F2}
import maths.linalg.Matrix
import transforms.perm.LinearPerm
import transforms.perm.LinearPerm.{*, given}

import scala.language.implicitConversions


abstract class WHT[T](n: Int, r: Int) extends HighLevelTransform[T](n):
  require(n % r == 0, s"n ($n) must be a multiple of r ($r)")

  override def testParams: PartialFunction[HW[T], (Seq[T], Double)] =
    case hw@FixedPoint(magnitude, fractional) if hw.MID_VALUE*(1<<n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1)<<(n+1)).toDouble / (BigInt(1) << fractional).toDouble)
    case hw@Flopoco(wE, wF) if wE <= 11 && wF <= 52 && hw.MID_VALUE * (1 << n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1) << (n + 1)).toDouble / (BigInt(1) << wF).toDouble)
    case hw@IEEE754(wE, wF) if wE <= 11 && wF <= 52 && hw.MID_VALUE * (1 << n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1) << (n + 1)).toDouble / (BigInt(1) << wF).toDouble)


  private def testInputs(hw: HW[T]) =
    val inputs0 = Seq.tabulate(1 << n)(_ => 0) // First test input set contains only ones
    val inputs1 = Seq.tabulate(1 << n)(_ => 1) // Second set contains only ones
    val inputs2 = Seq.tabulate(1 << n)(k => if k == 0 then 1 else 0) // Fourth set is a dirac
    (inputs0 ++ inputs1 ++ inputs2).map(hw.num.fromInt)

case class CTWHT[T: Numeric](override val n: Int, r: Int, scalingFactor: T) extends WHT[T](n, r):
  override val spl: SPL[T] =
  if n == 1 then
    DFT2[T](scalingFactor)
  else
    Lmat(r, n) * Product(n / r)(l => ITensor(n - r, CTWHT[T](r, 1, scalingFactor).spl) * Qmat(n, r, l))

case class Pease[T: Numeric](override val n: Int, r: Int, scalingFactor: T) extends WHT[T](n, r):
  override val spl: SPL[T] =
  if n == 1 then
    DFT2[T](scalingFactor)
  else
    Product(n / r)(_ => ITensor(n - r, CTWHT(r, 1, scalingFactor).spl) * Lmat(r, n).inverse)



case class ItPease[T: Numeric](override val n: Int, r: Int, scalingFactor: T) extends WHT[T](n, r):
  override val spl: SPL[T] =
    if n == 1 then
      DFT2[T](scalingFactor)
    else
      ItProduct(n / r, ITensor(n - r, CTWHT(r, 1, scalingFactor).spl) * Lmat(r, n).inverse)

case class ItPeaseFused[T: Numeric](override val n: Int, r: Int, scalingFactor: T) extends WHT[T](n, r):
  override val spl: SPL[T] =
    if n == 1 then
      DFT2[T](scalingFactor)
    else
      ItProduct(n / r + 1, perm.LinearPerm(Seq.fill(n / r)(Lmat(r, n).inverse) :+ Rmat(r, n)), Some(ITensor(n - r, CTWHT(r, 1, scalingFactor).spl)))


