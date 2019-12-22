package SPL

import SB.HW.HW
import StreamingModule.StreamingModule

case class ItProduct[T](r: Int, factor: SPL[T], endLoopOpt: Option[SPL[T]] = None) extends SPL[T](factor.n) {
  val endLoop = endLoopOpt.getOrElse(Identity[T](n))

  override def eval(inputs: Seq[T], set: Int): Seq[T] = factor.eval((0 until (r - 1)).foldLeft(inputs)((endLoop * factor).eval), r - 1)

  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = StreamingModule.ItProduct(r, factor.stream(k), endLoopOpt.map(_.stream(k)))
}

object ItProduct {
  //def apply[T](r: Int, factor: SPL[T]) = if (r == 1) factor else new ItProduct[T](r, factor)
}