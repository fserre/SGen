package transforms

import ir.rtl.StreamingModule
import ir.rtl.hardwaretype.HW
import ir.spl.SPL

abstract class Transform[T](n: Int) extends SPL[T](n):
  def testParams: PartialFunction[HW[T],(Seq[T], Double)] = PartialFunction.empty

abstract class HighLevelTransform[T](n: Int) extends Transform[T](n):
  protected def spl: SPL[T]
  override def eval(inputs: Seq[T], set: Int) = spl.eval(inputs, set)
  override def stream(k: Int, control: ir.rtl.RAMControl)(using HW[T]) = spl.stream(k, control)
