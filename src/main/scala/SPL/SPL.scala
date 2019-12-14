/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL

import RTL._
import SB.HW.HW
import StreamingModule.{StreamingModule}

abstract class SPL[T](val n: Int) {
  val N = 1 << n

  def eval(inputs: Seq[T], set: Int): Seq[T]

  def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T]

  def *(rhs:SPL[T])=Product(this,rhs)

  //def eval(inputs:Seq[Int]):Seq[Int]
}
