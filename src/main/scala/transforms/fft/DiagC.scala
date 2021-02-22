/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
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

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, HW, Unsigned}
import ir.rtl.{AcyclicStreamingModule,RAMControl}
import ir.spl.{Repeatable, SPL}
import ir.rtl.signals.{Const, SetCounter, ROM, Sig, Timer}
import linalg.Fields.Complex
import linalg.Fields.Complex._


/**
 * Twiddle factors for non-iterative Pease FFTs
 *
 * @param n Log of the size of the transform
 * @param r Log of the radix
 * @param l Stage number
 */
case class DiagC(override val n: Int, r: Int, l: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]]:
  val num = Numeric[Complex[Double]]
  import num._
  def pow(x: Int): Int = 
    val j = x % (1 << r)
    val i = ((x >> r) >> (r * l)) << (r * l)
    i * j

  def coef(i: Int): Complex[Double] = DFT.omega(n, pow(i))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map ((input, i) => input * coef(i % (1 << n)))

  override def stream(k: Int,control:RAMControl)(using HW[Complex[Double]]): AcyclicStreamingModule[Complex[Double]] = new AcyclicStreamingModule(n - k, k):
    override def implement(inputs: Seq[Sig[Complex[Double]]]): Seq[Sig[Complex[Double]]] = (0 until K).map(p => 
      val twiddles = Vector.tabulate(T)(c => coef((c * K) + p))
      val twiddleHW = hw match
        case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(2, magnitude + fractional - 2))
        case _ => hw
      val control = Timer(T)
      val twiddle = ROM(twiddles, control)(twiddleHW)
      inputs(p) * twiddle)

    override def spl: SPL[Complex[Double]] = DiagC(this.n, r, l)

/**
 * Twiddle factors for iterative Pease FFTs
 *
 * @param n Log of the size of the transform
 * @param r Log of the radix
 */
case class StreamDiagC(override val n: Int, r: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]]:
  val num = Numeric[Complex[Double]]
  import num._
  def pow(x: Int, l: Int): Int = 
    val j = x % (1 << r)
    val i = ((x >> r) >> (r * l)) << (r * l)
    i * j

  def coef(i: Int, l: Int): Complex[Double] = DFT.omega(n, pow(i, l))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map((input, i) => input * coef(i % (1 << n), set % (n / r)))

  override def stream(k: Int,control:RAMControl)(using HW[Complex[Double]]): AcyclicStreamingModule[Complex[Double]] = new AcyclicStreamingModule(n - k, k):
    override def implement(inputs: Seq[Sig[Complex[Double]]]): Seq[Sig[Complex[Double]]] = (0 until K).map(p => 
      val j = p % (1 << r)
      val coefs = Vector.tabulate(1 << (this.n - r))(i => DFT.omega(this.n, i * j))
      val twiddleHW = hw match
        case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(2, magnitude + fractional - 2))
        case _ => hw
      val control1 = Timer(T) :: Const(p >> r)(Unsigned(this.k - r))
      val control2a = SetCounter(this.n / r)
      val control2 = ROM(Vector.tabulate(this.n / r)(i => ((1 << (i * r)) - 1) ^ ((1 << (this.n - r)) - 1)), control2a)(Unsigned(this.n - r))
      val control = control1 & control2
      val twiddle = ROM(coefs, control)(twiddleHW)
      inputs(p) * twiddle)

    override def toString: String = "StreamDiagC(" + this.n + "," + r + "," + this.k + ")"

    override def spl: SPL[Complex[Double]] = StreamDiagC(this.n, r)
    
