/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW.HW
import SB.SB


case class RAM[U: HW](input: Sig[U], addrWr: Sig[Int], addrRd: Sig[Int], latency: Int) extends Sig[U] {
  override def parents: Seq[(SigRef[_], Int)] = Seq((input, latency + 2), (addrWr, latency + 2), (addrRd, 1))

  override val hw: HW[U] = implicitly
  override val sb: SB[_] = input.sb
  override val pipeline = 1

  override def implement(cp: (SigRef[_], Int) => Component): Component = {
    val mem = new RTL.RAMWr(cp(addrWr, latency + 2), cp(input, latency + 2))
    new RTL.RAMRd(mem, cp(addrRd, 1))
  }

  override def graphDeclaration = graphName + "[label=\"RAM bank (" + (1 << addrRd.hw.size) + " × " + hw.size + " bits, latency=" + latency + ") |<data> Data|<wr> Write address |<rd> Read address \",shape=record];"

  override def graphNode = {
    List(addrWr.graphName + " -> " + graphName + ":wr;",
      //m.we.sigDef.graphName + " -> " + graphName + ":we;",
      input.graphName + " -> " + graphName + ":data;",
      addrRd.graphName + " -> " + graphName + ":rd;"
    )
  }

}

/*
object RAM {

  case class RAMWr[U](wrAddress: SigRef[Int], input: SigRef[U], _latency: Int) extends Operator[U](wrAddress, input)(input.hw) {
    override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.RAMWr(wrAddress, input)

    override val latency = _latency + 1

    override def graphDeclaration = ""

    override def graphNode = List()
  }

  case class RAMRd[U](mem: RAMWr[U], rdAddress: SigRef[Int]) extends Operator[U](mem, rdAddress)(mem.hw) {
    override def implement(implicit cp: SigRef[_] => Component): Component = cp(mem) match {
      case mem: RTL.RAMWr => new RTL.RAMRd(mem, rdAddress)
      case _ => throw new Exception("Expecting a RAM component")
    }

    override val pipeline = 1
    override val latency = 1

    override def graphDeclaration = graphName + "[label=\"RAM bank (" + (1 << rdAddress.hw.size) + " × " + hw.size + " bits, latency=" + mem.latency + ") |<data> Data|<wr> Write address |<rd> Read address \",shape=record];"

    override def graphNode = {
      List(mem.wrAddress.graphName + " -> " + graphName + ":wr;",
        //m.we.sigDef.graphName + " -> " + graphName + ":we;",
        mem.input.graphName + " -> " + graphName + ":data;",
        rdAddress.graphName + " -> " + graphName + ":rd;"
      )
    }

  }

  def apply[U: HW](input: Sig[U], addrWr: Sig[Int], addrRd: Sig[Int], latency: Int) = new RAMRd(new RAMWr(addrWr, input, latency), addrRd)
}
*/