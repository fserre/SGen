/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.HW
import SB.Signals._
import linalg.Fields._


case class ComplexHW[T](hw:HW[T]) extends HW[Complex[T]](hw.size*2)(Complex.ComplexIsFractional[T](hw.num):Numeric[Complex[T]]) {
  implicit val componentHW=hw

  override def plus(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)+Re(rhs),Im(lhs)+Im(rhs))(this)

  override def minus(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)-Re(rhs),Im(lhs)-Im(rhs))(this)

  override def times(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)*Re(rhs)-Im(lhs)*Im(rhs),Re(lhs)*Im(rhs)+Im(lhs)*Re(rhs))(this)

  override def bitsOf(const: Complex[T]): BigInt = (hw.bitsOf(const.im) << hw.size) + hw.bitsOf(const.re)

  override def valueOf(const: BigInt): Complex[T] = Complex(hw.valueOf(((BigInt(1)<<hw.size)-1) & const),hw.valueOf(const>>hw.size))(hw.num)
}
