package StreamingModule

import RTL.{Component, Const, Mux, Or, Wire}
import SPL.SPL

case class ItProduct[U](r: Int, factor: StreamingModule[U]) extends StreamingModule[U](factor.t, factor.k)(factor.hw) {
  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    val feeding1 = new Wire(1)
    val feeding2 = new Mux(token(-1), Seq(feeding1, new Const(1, 1)))
    val feeding3 = new Mux(token(T - 1), Seq(feeding2, new Const(1, 0)))
    val feeding = feeding3.register
    feeding1.input = feeding
    val loopOutputsCopy = Seq.fill(K)(new Wire(hw.size))
    val loopInputs = loopOutputsCopy.zip(inputs).map { case (i1, i2) => new Mux(feeding, Seq(i1, i2)).register }
    val loopOutputs = factor.implement(rst, time => new Or((0 until r).map(_ * (1 + factor.latency) + time + 1).map(token)), loopInputs)
    loopOutputsCopy.zip(loopOutputs).foreach { case (i1, i2) => i1.input = i2 }
    loopOutputs
  }

  override val latency: Int = r * (1 + factor.latency)
  override val minGap = (r - 1) * (1 + factor.latency)
  override val spl: SPL[U] = SPL.ItProduct(r, factor.spl)
}
