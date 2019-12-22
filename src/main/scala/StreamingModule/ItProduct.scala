package StreamingModule

import RTL.{Component, Const, Mux, Or, Wire}
import SB.Identity
import SB.SLP.TemporalNG
import SPL.SPL
import linalg.Fields.F2
import linalg.Matrix

case class ItProduct[U](r: Int, factor: StreamingModule[U], endLoopOpt: Option[StreamingModule[U]] = None) extends StreamingModule[U](factor.t, factor.k)(factor.hw) {
  val endLoop = {
    val res = endLoopOpt.getOrElse(Identity(t, k))
    res * Delay(t, k, Math.max(1 + factor.latency + res.latency, T) - (1 + factor.latency + res.latency))
  }
  val innerLatency = 1 + factor.latency + endLoop.latency
  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    val feeding1 = new Wire(1)
    val feeding2 = new Mux(token(T - 1), Seq(feeding1, new Const(1, 0)))
    val feeding3 = new Mux(token(-1), Seq(feeding2, new Const(1, 1)))
    val feeding = feeding3.register
    feeding1.input = feeding
    val loopOutputsCopy = Seq.fill(K)(new Wire(hw.size))
    val loopInputs = loopOutputsCopy.zip(inputs).map { case (i1, i2) => new Mux(feeding, Seq(i1, i2)).register }
    val loopOutputs = factor.implement(rst, time => new Or((0 until r).map(_ * innerLatency + time + 1).map(token)), loopInputs)
    val loopEndOutputs = endLoop.implement(rst, time => new Or((0 until r - 1).map(_ * innerLatency + 1 + factor.latency + time).map(token)), loopOutputs)
    //val loopOutputs2 = loopOutputs.map(o => (0 until (innerLatency - (1 + factor.latency))).foldLeft(o)((x, _) => x.register))
    loopOutputsCopy.zip(loopEndOutputs).foreach { case (i1, i2) => i1.input = i2 }
    loopOutputs
  }

  override val latency: Int = (r - 1) * innerLatency + factor.latency + 1
  override val minGap = (r - 1) * innerLatency
  override val spl: SPL[U] = SPL.ItProduct(r, factor.spl, endLoopOpt.map(_.spl))
}

object ItProduct {
  /*def apply[U](r: Int, factor: StreamingModule[U]) = if(r==1)
    factor
  else
    new ItProduct[U](r, factor)*/
}