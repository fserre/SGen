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

package ir.rtl.hardwaretype

import ir.rtl.Component
import ir.rtl.signals._

import scala.io.Source



case class Flopoco(wE: Int, wF: Int) extends HW[Double](wE+wF+3) {
  private val filename = "flopoco/flopoco_" + wE + "_" + wF + ".vhdl"
  private val (latPlus, latDiff, latMult) = {
    val path = java.nio.file.Paths.get(filename)

    if (!java.nio.file.Files.isRegularFile(path)) {
      println("Error: Flopoco file not found for wE=" + wE + " and wF=" + wF)
      println("Please execute the command:")
      println()
      println("flopoco outputFile=" + path.toAbsolutePath + " target=Virtex6 frequency=700 FPMult name=mult wE=" + wE + " wF=" + wF + " FPAdd name=add wE=" + wE + " wF=" + wF + " sub=false FPAdd name=diff wE=" + wE + " wF=" + wF + " sub=true")
      throw new Exception("Flopoco file not found for wE=" + wE + " and wF=" + wF)
    }
    val source = Source.fromFile(filename)
    val flopoco = source.getLines().mkString("\n")
    source.close()
    var pos = flopoco.indexOf("FPAdd_" + wE + "_" + wF)
    pos = flopoco.indexOf(" Pipeline depth: ", pos) + 17
    var posEnd = flopoco.indexOf(" ", pos)
    val latPlus = flopoco.slice(pos, posEnd).toInt
    pos = flopoco.indexOf("FPSub_" + wE + "_" + wF)
    pos = flopoco.indexOf(" Pipeline depth: ", pos) + 17
    posEnd = flopoco.indexOf(" ", pos)
    val latDiff = flopoco.slice(pos, posEnd).toInt
    pos = flopoco.indexOf("FPMult_" + wE + "_" + wF)
    pos = flopoco.indexOf(" Pipeline depth: ", pos) + 17
    posEnd = flopoco.indexOf(" ", pos)
    val latMult = flopoco.slice(pos, posEnd).toInt
    (latPlus, latDiff, latMult)
  }
  case class FloPlus(override val lhs: SigRef[Double], override val rhs: SigRef[Double]) extends Plus(lhs, rhs) {
    override def latency: Int = latPlus

    override def pipeline = 1

    override def implement(implicit cp: SigRef[?] => Component) = new ir.rtl.Extern(lhs.hw.size, filename, "add", "R", ("clk", new ir.rtl.Input(1, "clk")), ("rst", sb.reset), ("X", cp(lhs)), ("Y", cp(rhs)))
  }

  case class FloMinus(override val lhs: SigRef[Double],override val rhs: SigRef[Double]) extends Minus(lhs,rhs) {
    override def latency: Int = latDiff

    override def pipeline = 1

    override def implement(implicit cp: SigRef[?] => Component) = new ir.rtl.Extern(lhs.hw.size, filename, "diff", "R", ("clk", new ir.rtl.Input(1, "clk")), ("rst", sb.reset), ("X", cp(lhs)), ("Y", cp(rhs)))
  }

  case class FloTimes(override val lhs: SigRef[Double], override val rhs: SigRef[Double]) extends Times(lhs, rhs) {
    override def pipeline = 1

    override def latency: Int = latMult

    override def implement(implicit cp: SigRef[?] => Component) = new ir.rtl.Extern(lhs.hw.size, filename, "mult", "R", ("clk", new ir.rtl.Input(1, "clk")), ("rst", sb.reset), ("X", cp(lhs)), ("Y", cp(rhs)))

  }

  override def plus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloPlus(lhs, rhs)


  override def minus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloMinus(lhs, rhs)

  override def times(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloTimes(lhs, rhs)
  private val biasDouble=(BigInt(1)<<(11-1))-1
  private val bias=(BigInt(1)<<(wE-1))-1
  override def bitsOf(const: Double): BigInt = {
    if (const.isNaN)
      BigInt(3)<<(wE+wF+1)
    else if (const.isPosInfinity)
      BigInt(4)<<(wE+wF)
    else if (const.isNegInfinity)
      BigInt(5)<<(wE+wF)
    else if(const>=0 && const<java.lang.Double.MIN_NORMAL)
      BigInt(0)
    else if(const<=0 && -const<java.lang.Double.MIN_NORMAL)
      BigInt(1)<<(wE+wF)
    else{
      val bits=java.lang.Double.doubleToLongBits(const)
      val exponent = (bits & 0x7ff0000000000000L) >> 52
      val mantissa = bits & 0x000fffffffffffffL
      val newExponent = BigInt(exponent)-biasDouble+bias
      val newMantissa = BigInt(mantissa)>>(52-wF)
      if(newExponent<0)
        if (const<0) 
          BigInt(1)<<(wE+wF)
        else 
          BigInt(0)
      else if(newExponent>=(BigInt(1)<<wE))
        if (const<0) 
          BigInt(5)<<(wE+wF)
        else
          BigInt(4)<<(wE+wF)
      else
        newMantissa+(newExponent<<wF)+(if(const<0) BigInt(1)<<(wE+wF) else BigInt(0))+(BigInt(1)<<(wE+wF+1))
    }
  }

  override def valueOf(const: BigInt): Double = {
    val flags=const>>(wE+wF)
    if(flags==0)
      0d
    else if(flags==1)
      -0d
    else if(flags==4)
      Double.PositiveInfinity
    else if(flags==5)
      Double.NegativeInfinity
    else if(flags==6 || flags==7)
      Double.NaN
    else{
      val exponent=((const & ((BigInt(1)<<(wE+wF))-1))>>wF)-bias+biasDouble
      val mantissa=(const & ((BigInt(1)<<wF)-1))<<(52-wF)
      val res=java.lang.Double.longBitsToDouble(((exponent<<52)+mantissa).toLong)
      if(const.testBit(wE+wF))
        -res
      else
        res
    }
  }

  override def description: String = s"floating-point number in FloPoCo format (wE=$wE, wF=$wF)"
}


