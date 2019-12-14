package SPL

import SB.HW.HW
import StreamingModule.StreamingModule

case class ItProduct[T](r: Int, factor: SPL[T]) extends SPL[T](factor.n) {
  override def eval(inputs: Seq[T], set: Int): Seq[T] = (0 until r).foldLeft(inputs)(factor.eval)

  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = StreamingModule.ItProduct(r, factor.stream(k))
}
