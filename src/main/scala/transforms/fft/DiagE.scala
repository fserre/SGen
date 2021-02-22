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

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, HW}
import ir.rtl.{AcyclicStreamingModule, StreamingModule,RAMControl}
import ir.rtl.signals.{ROM, Sig, Timer}
import ir.spl.{Identity, Repeatable, SPL}
import linalg.Fields.Complex
import linalg.Fields.Complex._

/**
 * Twiddle factors for non-iterative Cooley-Tukey FFTs
 * 
 * @param n Log of the size of the transform
 * @param r Log of the radix
 * @param l Stage number
 */
case class DiagE private (override val n: Int, r: Int, l: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]]:
  val num = Numeric[Complex[Double]]
  import num._
  def pow(x: Int): Int = 
    val j = x % (1 << r)
    val i = (x >> r) % (1 << (n - r * (l + 1)))
    (i * j) << (r * l)

  def coef(i: Int): Complex[Double] = DFT.omega(n, pow(i))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map((input, i) => input * coef(i % (1 << n)))

  override def stream(k: Int,control:RAMControl)(using HW[Complex[Double]]): AcyclicStreamingModule[Complex[Double]] = new AcyclicStreamingModule(n - k, k): 
    override def implement(inputs: Seq[Sig[Complex[Double]]]): Seq[Sig[Complex[Double]]] = (0 until K).map(p => 
      val twiddles = Vector.tabulate(T)(c => coef((c * K) + p))
      val twiddleHW = hw match // The hardware datatype used for the twiddles is the same as the one used by the data, EXCEPT in case of FixedPoint: to maximize precision, we store as many fractional bits as possible, as twiddles are in the unit circle. 
        case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(2, magnitude + fractional - 2))
        case _ => hw
      val control = Timer(T)
      val twiddle = ROM(twiddles, control)(twiddleHW)
      inputs(p) * twiddle)

    override def toString: String = "DiagE(" + this.n + "," + r + "," + l + "," + this.k + ")"

    override def spl: SPL[Complex[Double]] = DiagE(this.n, r, l)
  
/** Companion object of class DiagE */
object DiagE:
  def apply(n: Int, r: Int, l: Int):SPL[Complex[Double]]=
    if n == r * (l + 1) then
      Identity[Complex[Double]](n) 
    else
      new DiagE(n, r, l)
