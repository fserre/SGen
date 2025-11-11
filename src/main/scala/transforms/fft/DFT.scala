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

package transforms.fft

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Flopoco, HW, IEEE754}
import ir.rtl.{AcyclicStreamingModule, StreamingModule}
import ir.spl.*
import maths.fields.{Complex, F2}
import maths.linalg.Matrix
import transforms.{HighLevelTransform, Transform, perm}
import transforms.perm.LinearPerm
import transforms.perm.LinearPerm.{*, given}

import scala.language.implicitConversions
import scala.math.Numeric.Implicits.infixNumericOps


object DFT:
  def omega(n: Int, pow: Int): Complex[Double] =
   if pow % (1 << n) == 0 then
     Complex(1)
   else if 2 * (pow % (1 << n)) == (1 << n) then
     Complex(-1)
   else if 4 * (pow % (1 << n)) == (1 << n) then
     Complex(0,-1)
   else if 4 * (pow % (1 << n)) == 3 * (1 << n) then
     Complex(0,1)
   else
     val angle = -2 * Math.PI * pow / (1 << n)
     Complex(Math.cos(angle), Math.sin(angle))

abstract class DFT(n: Int, r: Int) extends HighLevelTransform[Complex[Double]](n):
  require(n % r == 0, s"n ($n) must be a multiple of r ($r)")

  override def testParams: PartialFunction[HW[Complex[Double]], (Seq[Complex[Double]], Double)] =
    case ComplexHW(hw@FixedPoint(magnitude, fractional)) if hw.MID_VALUE*(1<<n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1)<<(n + 1)).toDouble / (BigInt(1) << fractional).toDouble)
    case ComplexHW(hw@Flopoco(wE, wF)) if wE <= 11 && wF <= 52 && hw.MID_VALUE * (1 << n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1) << (n + 1)).toDouble / (BigInt(1) << wF).toDouble)
    case ComplexHW(hw@IEEE754(wE, wF)) if wE <= 11 && wF <= 52 && hw.MID_VALUE * (1 << n) <= hw.MAX_VALUE => (testInputs(hw), (BigInt(1) << (n + 1)).toDouble / (BigInt(1) << wF).toDouble)

  def testInputs(hw: HW[Double]):Seq[Complex[Double]] =
    val inputs0 = Seq.fill(1 << n)(Complex(0.0)) // First test input set contains only ones
    val inputs1 = Seq.fill(1 << n)(Complex(hw.MID_VALUE)) // Second set contains only ones
    val inputs2 = Seq.tabulate(1 << n)(k => DFT.omega(n, (1 << n) - k) * hw.MID_VALUE) // Third set is e^(2ikPI/2^n)
    val inputs3 = Seq.tabulate(1 << n)(k => if k == 0 then Complex(hw.MID_VALUE) else Complex(0.0)) // Fourth set is a dirac
    inputs0 ++ inputs1 ++ inputs2 ++ inputs3
  
case class CTDFT(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl: SPL[Complex[Double]] = 
    if n == 1 then
      DFT2(scalingFactor)
    else
      Lmat(r, n) * Product(n / r)(l => ITensor(n - r, CTDFT(r, 1, scalingFactor).spl) * DiagE(n, r, l) * Qmat(n, r, l)) * Rmat(r, n)

case class ICTDFT(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl: SPL[Complex[Double]] = Swap(n) * CTDFT(n, r, scalingFactor).spl * Swap(n)

case class Pease(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl: SPL[Complex[Double]] =
    if n == 1 then
      DFT2(scalingFactor)
    else
      Rmat(r, n) * Product(n / r)(l => DiagC(n, r, n / r - l - 1) * ITensor(n - r, CTDFT(r, 1, scalingFactor).spl) * Lmat(r, n).inverse)
    
case class ItPease(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl =
    if n == 1 then
      DFT2(scalingFactor)
    else
      Rmat(r, n) * ItProduct(n / r, StreamDiagC(n, r) * ITensor(n - r, CTDFT(r, 1, scalingFactor).spl) * Lmat(r, n).inverse)

case class ItPeaseFused(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl = 
    if n == 1 then
      DFT2(scalingFactor)
    else
      ItProduct(n / r + 1, perm.LinearPerm(Seq.fill(n / r)(Lmat(r, n).inverse) :+ Rmat(r, n)), Some(StreamDiagC(n, r) * ITensor(n - r, CTDFT(r, 1, scalingFactor).spl)))
  //def stream(n: Int, r: Int, k: Int, hw: HW[Complex[Double]],dualPorted:Boolean): StreamingModule[Complex[Double]] = CTDFT(n, r).stream(k)(hw)

case class IItPeaseFused(override val n: Int, r: Int, scalingFactor: Complex[Double]) extends DFT(n, r):
  override val spl = Swap(n) * ItPeaseFused(n, r, scalingFactor) * Swap(n)

/** Dummy module used for representation in graphs 
case class DFT(_t:Int, _k:Int) extends AcyclicStreamingModule(_t, _k)(using ComplexHW(FixedPoint(8,8))):
  override def implement(inputs: Seq[ir.rtl.signals.Sig[Complex[Double]]]) = ???

  override def spl = DFT.CTDFT(t + k, 1, 1)
*/