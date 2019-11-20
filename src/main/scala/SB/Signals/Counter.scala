/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL._
import SB.HW.Unsigned
import SB.SB

case class Counter(limit: Int, trigger: SigRef[Int], reset: SigRef[Int], resetValue: Int) extends Sig(trigger, reset)(Unsigned(BigInt(limit - 1).bitLength)) {
  /*override def implement(implicit nl: Netlist) = {
    nl.addSeq("if (" + reset.name + ")",
      "  " + name + " <= 0;",
      "else",
      "  " + name + " <= " + name + " + 1;")
  }*/

  override def implement(implicit cp: SigRef[_] => Component) = {
    val prev = Wire(hw.size)
    //val control=cp(reset)::trigger
    //val res = Mux(control,Vector(prev,prev+1,Const(hw.size, 0),Const(hw.size, 0))).register
    val prevpp=new Plus(Seq(prev,new Const(hw.size,1)))
    val prevInc = if (BigInt(limit).bitCount > 1)
      new Mux(new Equals(prev, new Const(hw.size, limit - 1)),Seq(prevpp,new Const(hw.size, 0)))
    else
      prevpp
    val res1 = new Mux(trigger, Vector(prev, prevInc))
    val res = new Mux(reset, Vector(res1, new Const(hw.size, resetValue))).register
    prev.input = res
    res
  }

  override def latency = 1
}

object Counter {
  def apply(limit: Int)(implicit sb:SB[_]): Sig[Int] = if (limit == 1) SB.Signals.Const(0)(Unsigned(0),sb) else new Counter(limit, Next(sb), Reset(sb), limit - 1)
}
