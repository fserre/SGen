/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW

import RTL.Component
import SB.Signals._

import scala.io.Source



case class Flopoco(wE: Int, wF: Int) extends HW[Double](wE+wF+3) {
  require(wE==8)
  require(wF==23)
  private val filename = "flopoco/flopoco_" + wE + "_" + wF + ".vhdl"
  private val (latPlus, latDiff, latMult) = {
    val path = java.nio.file.Paths.get(filename)

    if (!java.nio.file.Files.isRegularFile(path)) {
      println("Error: Flopoco file not found for wE=" + wE + " and wF=" + wF)
      println("Please execute the command:")
      println()
      println("flopoco outputFile=" + path.toAbsolutePath + " target=Virtex6 frequency=700 name=mult FPMult wE=8 wF=23 name=add FPAdd wE=8 wF=23 sub=false name=diff FPAdd wE=8 wF=23 sub=true")
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

    override def implement(implicit conv: SigRef[_] => Component) = new RTL.Extern(lhs.hw.size, filename, "add", "R", ("clk", new RTL.Input(1, "clk")), ("rst", sb.reset), ("X", lhs), ("Y", rhs))
  }

  case class FloMinus(override val lhs: SigRef[Double],override val rhs: SigRef[Double]) extends Minus(lhs,rhs) {
    override def latency: Int = latDiff

    override def pipeline = 1

    override def implement(implicit conv: SigRef[_] => Component) = new RTL.Extern(lhs.hw.size, filename, "diff", "R", ("clk", new RTL.Input(1, "clk")), ("rst", sb.reset), ("X", lhs), ("Y", rhs))
  }

  case class FloTimes(override val lhs: SigRef[Double], override val rhs: SigRef[Double]) extends Times(lhs, rhs) {
    override def pipeline = 1

    override def latency: Int = latMult

    override def implement(implicit conv: SigRef[_] => Component) = new RTL.Extern(lhs.hw.size, filename, "mult", "R", ("clk", new RTL.Input(1, "clk")), ("rst", sb.reset), ("X", lhs), ("Y", rhs))

  }

  override def plus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloPlus(lhs, rhs)


  override def minus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloMinus(lhs, rhs)

  override def times(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FloTimes(lhs, rhs)
  private val biasDouble=(1<<(11-1))-1
  private val bias=(1<<(wE-1))-1
  override def bitsOf(const: Double): BigInt = {
    if (const.isNaN)
      3L<<(wE+wF+1)
    else if (const.isPosInfinity)
      4L<<(wE+wF)
    else if (const.isNegInfinity)
      5L<<(wE+wF)
    else if(const>=0 && const<java.lang.Double.MIN_NORMAL)
      0L
    else if(const<=0 && -const<java.lang.Double.MIN_NORMAL)
      1L<<(wE+wF)
    else{
      val bits=java.lang.Double.doubleToLongBits(const)
      val exponent = ((bits & 0x7ff0000000000000L) >> 52)-biasDouble+bias
      val mantissa = (bits & 0x000fffffffffffffL)>>(52-wF)
      if(exponent<0)
        if(const<0) 1L<<(wE+wF) else 0L
      else if(exponent>=(1L<<wE))
        if(const<0) 5L<<(wE+wF) else  4L<<(wE+wF)
      else
        mantissa+(exponent<<wF)+(if(const<0)(1L<<(wE+wF)) else 0)+(1L<<(wE+wF+1))
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
}


