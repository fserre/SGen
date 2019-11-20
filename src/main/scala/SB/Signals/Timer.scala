/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL._
import SB.HW.Unsigned
import SB.SB

case class Timer(limit: Int, reset: SigRef[Int]) extends Sig(reset)(Unsigned(BigInt(limit - 1).bitLength)) {
  /*override def implement(implicit nl: Netlist) = {
    nl.addSeq("if (" + reset.name + ")",
      "  " + name + " <= 0;",
      "else",
      "  " + name + " <= " + name + " + 1;")
  }*/

  override def implement(implicit conv: SigRef[_] => Component) = {
    val prev = Wire(hw.size)
    val prevpp=new Plus(Seq(prev,new Const(hw.size,1)))
    val res = new Mux(reset, Seq (prevpp,new Const(hw.size, 0))).register
    prev.input = res
    res
  }

  override def latency = 1
}

object Timer {
  def apply(limit: Int)(implicit sb:SB[_]): Sig[Int] = if (limit == 1) SB.Signals.Const(0)(Unsigned(0),sb) else new Timer(limit, Next(sb))
}