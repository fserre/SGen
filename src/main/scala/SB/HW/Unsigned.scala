/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW

import RTL.Component
import SB.Signals._

case class Unsigned(_size: Int) extends HW[Int](_size) {

  class UnsignedPlus(override val lhs: SigRef[Int],override val rhs: SigRef[Int]) extends Plus(lhs,rhs) {
    //override def getVerilog(implicit v: Verilog): Unit = v.addComb("assign "+id+ " = "+terms.map(id).mkString(" + ")+";")
    override def pipeline = 1

    override def implement(implicit conv: SigRef[_] => Component) =new RTL.Plus(Seq(lhs,rhs))
  }

  override def plus(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = new UnsignedPlus(lhs,rhs)
  case class UnsignedMinus(override val lhs: SigRef[Int],override val rhs: SigRef[Int]) extends Minus(lhs,rhs) {
    //override def getVerilog(implicit v: Verilog): Unit = v.addComb("assign "+id+ " = "+terms.map(id).mkString(" + ")+";")
    override def pipeline = 1

    override def implement(implicit conv: SigRef[_] => Component) =new RTL.Minus(lhs,rhs)
  }
  override def minus(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = new UnsignedMinus(lhs,rhs)

  override def times(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = ???

  val mask = (BigInt(1) << size) - 1

  override def bitsOf(const: Int): BigInt = BigInt(const) & mask

  override def valueOf(const: BigInt): Int = const.toInt
}

