/*
 *     _____ ______          SGen - A Generator of Streaming Hardware
 *    / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *    \__ \/ / __/ _ \/ __ \
 *   ___/ / /_/ /  __/ / / /
 *  /____/\____/\___/_/ /_/  Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software Foundation,
 *  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 */

package SB.HW

import RTL.{Component, Extern}
import SB.Signals.{Operator, Sig, SigRef}

case class IEEE754(wE: Int, wF: Int) extends HW[Double](wE + wF + 1) {
  that =>
  private val filename = "flopoco/ieee_" + wE + "_" + wF + ".vhdl"
  private val path = java.nio.file.Paths.get(filename)
  if (!java.nio.file.Files.isRegularFile(path)) {
    println("Error: Flopoco conversion file not found for wE=" + wE + " and wF=" + wF)
    println("Please execute the command:")
    println()
    println("flopoco outputFile=" + path.toAbsolutePath + " target=Virtex6 frequency=700 InputIEEE name=IEEE2Flopoco wEIn=" + wE + " wFIn=" + wF + " wEOut=" + wE + " wFOut=" + wF + " OutputIEEE name=Flopoco2IEEE wEIn=" + wE + " wFIn=" + wF + " wEOut=" + wE + " wFOut=" + wF)
    throw new Exception("Flopoco conversion file not found for wE=" + wE + " and wF=" + wF)
  }
  private val biasDouble = (1 << (11 - 1)) - 1
  private val bias = (1 << (wE - 1)) - 1

  override def plus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = {
    require(lhs.hw == this)
    require(rhs.hw == this)
    FlopocoToIEEE(IEEEToFlopoco(lhs) + IEEEToFlopoco(rhs))
  }

  override def minus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = {
    require(lhs.hw == this)
    require(rhs.hw == this)
    FlopocoToIEEE(IEEEToFlopoco(lhs) - IEEEToFlopoco(rhs))
  }

  override def times(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = {
    require(lhs.hw == this)
    require(rhs.hw == this)
    FlopocoToIEEE(IEEEToFlopoco(lhs) * IEEEToFlopoco(rhs))
  }

  override def bitsOf(const: Double): BigInt = {
    if (const.isNaN)
      (((1L << wE) - 1) << wF) + 1
    else if (const.isPosInfinity)
      ((1L << wE) - 1) << wF
    else if (const.isNegInfinity)
      (1L << (wE + wF)) + (((1L << wE) - 1) << wF)
    else if (const >= 0 && const < java.lang.Double.MIN_NORMAL)
      0L
    else if (const <= 0 && -const < java.lang.Double.MIN_NORMAL)
      1L << (wE + wF)
    else {
      val bits = java.lang.Double.doubleToLongBits(const)
      val exponent = ((bits & 0x7ff0000000000000L) >> 52) - biasDouble + bias
      val mantissa = (bits & 0x000fffffffffffffL) >> (52 - wF)
      if (exponent < 0)
        if (const < 0) 1L << (wE + wF) else 0L
      else if (exponent >= (1L << wE))
        if (const < 0) (1L << (wE + wF)) + (((1L << wE) - 1) << wF) else ((1L << wE) - 1) << wF
      else
        mantissa + (exponent << wF) + (if (const < 0) 1L << (wE + wF) else 0)
    }
  }

  override def valueOf(const: BigInt): Double = {
    val exponent = ((const & ((BigInt(1) << (wE + wF)) - 1)) >> wF) - bias
    val mantissa = (const & ((BigInt(1) << wF) - 1)) << (52 - wF)
    val negative = const.testBit(wE + wF)
    if (exponent == -bias)
      if (negative)
        -0d
      else
        0d
    else if (exponent == bias + 1 && mantissa != 0)
      Double.NaN
    else if (exponent == bias + 1)
      if (negative)
        Double.NegativeInfinity
      else
        Double.PositiveInfinity
    else {
      val res = java.lang.Double.longBitsToDouble((((exponent + biasDouble) << 52) + mantissa).toLong)
      if (negative)
        -res
      else
        res
    }


  }

  private case class IEEEToFlopoco(input: Sig[Double]) extends Operator[Double](input)(Flopoco(wE, wF)) {

    require(input.hw == that)

    //override def implement(implicit cp: SigRef[_] => Component): Component = new Extern(hw.size,filename,"IEEE2Flopoco",)
    override def implement(implicit cp: SigRef[_] => Component): Component = new Extern(hw.size, filename, "IEEE2Flopoco", "R", ("clk", new RTL.Input(1, "clk")), ("rst", sb.reset), ("X", cp(input)))
  }

  private case class FlopocoToIEEE(input: Sig[Double]) extends Operator[Double](input)(that) {
    require(input.hw == Flopoco(wE, wF))

    override def implement(implicit cp: SigRef[_] => Component): Component = new Extern(size, filename, "Flopoco2IEEE", "R", ("clk", new RTL.Input(1, "clk")), ("rst", sb.reset), ("X", cp(input)))
  }

}

object IEEE754 {


}