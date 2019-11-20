/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW.HW

object RAM {

  case class RAMWr[U](wrAddress: SigRef[Int], input: SigRef[U], _latency: Int) extends Sig[U](wrAddress, input)(input.hw) {
    override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.RAMWr(wrAddress, input)

    override val latency = _latency + 1
  }

  case class RAMRd[U](mem: RAMWr[U], rdAddress: SigRef[Int]) extends Sig[U](mem, rdAddress)(mem.hw) {
    override def implement(implicit cp: SigRef[_] => Component): Component = cp(mem) match {
      case mem: RTL.RAMWr => new RTL.RAMRd(mem, rdAddress)
      case _ => throw new Exception("Expecting a RAM component")
    }

    override val pipeline = 1
    override val latency = 1
  }

  def apply[U: HW](input: Sig[U], addrWr: Sig[Int], addrRd: Sig[Int], latency: Int) = new RAMRd(new RAMWr(addrWr, input, latency), addrRd)
}
