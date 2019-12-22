/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW

import RTL.Component
import SB.Signals.{Minus, Plus, Sig, SigRef, Times}

//todo:Check for negative numbers
case class FixPlus(override val lhs: SigRef[Double], override val rhs: SigRef[Double]) extends Plus(lhs, rhs) {
  //override def getVerilog(implicit v: Verilog): Unit = v.addComb("assign "+id+ " = "+terms.map(id).mkString(" + ")+";")
  override def pipeline = 1

  override def implement(implicit conv: SigRef[_] => Component) = new RTL.Plus(Seq(lhs,rhs))
}

case class FixMinus(override val lhs: SigRef[Double],override val rhs: SigRef[Double]) extends Minus(lhs,rhs) {
  //override def getVerilog(implicit v: Verilog): Unit = v.addComb("assign "+id+ " = "+terms.map(id).mkString(" + ")+";")
  override def pipeline = 1

  override def implement(implicit conv: SigRef[_] => Component) = new RTL.Minus(lhs,rhs)
}

case class FixTimes(override val lhs: SigRef[Double], override val rhs: SigRef[Double]) extends Times(lhs, rhs) {
  //override def getVerilog(implicit v: Verilog): Unit = v.addComb("assign "+id+ " = "+terms.map(id).mkString(" + ")+";")
  override def pipeline = 3

  override def implement(implicit conv: SigRef[_] => Component) = {
    val shift = rhs.hw.asInstanceOf[FixedPoint].fractional
    new RTL.Tap(new RTL.Times(lhs, rhs), shift until (shift + lhs.hw.size))
  }
}

case class FixedPoint(magnitude: Int, fractional: Int) extends HW[Double](magnitude+fractional) {


  override def plus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixPlus(lhs, rhs)


  override def minus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixMinus(lhs, rhs)

  override def times(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixTimes(lhs, rhs)

  override def bitsOf(const: Double): BigInt = if(const<0)
    (bitsOf(-const)^((BigInt(1)<<size)-1))+1
    else
    ((BigInt(1)<<fractional).toDouble*BigDecimal(const)).toBigInt

  override def valueOf(const: BigInt): Double = {
    if (const.testBit(size - 1))
      -((const ^ ((BigInt(1) << size) - 1)) + 1).toDouble / Math.pow(2, fractional)
    else
      const.toDouble / Math.pow(2, fractional)
  }
}


