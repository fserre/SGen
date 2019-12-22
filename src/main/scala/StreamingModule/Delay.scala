package StreamingModule

import RTL.Component
import SB.HW.HW
import SPL.SPL

case class Delay[U: HW](override val t: Int, override val k: Int, override val latency: Int) extends StreamingModule[U](t, k) {
  override def spl: SPL[U] = SPL.Identity[U](t + k)

  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = inputs.map(i => (0 until latency).foldLeft(i)((x, _) => x.register))

}
