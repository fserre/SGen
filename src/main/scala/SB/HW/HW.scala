/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW

import RTL.Component
import SB.Signals.{Plus, Sig}
import linalg.Fields.Complex

/**
 * Class that represents a hardware representation
 *
 * @param T Type of the equivalent software datatype. Used for computations with constants.
 * @param size Size in bits of the representation
 */
abstract class HW[T: Numeric](val size: Int) {
  final val num = implicitly[Numeric[T]]

  def plus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def minus(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def times(lhs: Sig[T], rhs: Sig[T]): Sig[T]

  def bitsOf(const: T): BigInt

  def valueOf(const: BigInt): T
}

object HW {

  implicit class compHW[T](x: HW[Complex[T]]) {
    def innerHW = x match {
      case x: ComplexHW[T] => x.hw
      case _ => throw new Exception("Invalid complex HW datatype")
    }
  }

}