/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW

import RTL.Component
import SB.Signals.{Plus, Sig}


abstract class HW[T: Numeric](val size: Int) {
  val num = implicitly[Numeric[T]]

  def plus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def minus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def times(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def bitsOf(const: T): BigInt

  def valueOf(const: BigInt): T
}

