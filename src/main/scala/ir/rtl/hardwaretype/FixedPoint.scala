/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
 * /____/\____/\___/_/ /_/  https://github.com/fserre/sgen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 */

package ir.rtl.hardwaretype

import ir.rtl.Component
import ir.rtl.signals.{Const, Minus, Plus, Sig, Times}

/**
 * Fixed point arithmetic representation
 *
 * @param magnitude Number of bits of the integer part
 * @param fractional Number of bits of the fractional part
 */
case class FixedPoint(magnitude: Int, fractional: Int) extends HW[Double](magnitude + fractional):
  override def plus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixPlus(lhs, rhs)

  override def minus(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixMinus(lhs, rhs)

  override def times(lhs: Sig[Double], rhs: Sig[Double]): Sig[Double] = FixTimes(lhs, rhs)
  override def bitsOf(const: Double): BigInt =
    if const<0 then
      (bitsOf(-const) ^ ((BigInt(1) << size) - 1)) + 1
    else
      ((BigInt(1)<<fractional).toDouble*BigDecimal(const)).toBigInt

  override def valueOf(const: BigInt): Double =
    if const.testBit(size - 1) then
      -((const ^ ((BigInt(1) << size) - 1)) + 1).toDouble / Math.pow(2, fractional)
    else
      const.toDouble / Math.pow(2, fractional)

  override def description: String = if fractional==0 then s"$magnitude-bits signed integer in two's complement format" else s"signed fixed-point number ($magnitude. $fractional bits representation)"


  case class FixPlus(override val lhs: Sig[Double], override val rhs: Sig[Double]) extends Plus(lhs, rhs):
    override def pipeline = 1

    override def implement(implicit cp: Sig[?] => Component) = new ir.rtl.Plus(Seq(cp(this.lhs), cp(this.rhs)))

  case class FixMinus(override val lhs: Sig[Double], override val rhs: Sig[Double]) extends Minus(lhs,rhs):
    override def pipeline = 1

    override def implement(implicit cp: Sig[?] => Component) = new ir.rtl.Minus(cp(this.lhs), cp(this.rhs))

  case class FixTimes(override val lhs: Sig[Double], override val rhs: Sig[Double]) extends Times(lhs, rhs):
    override def pipeline = this.rhs match
      case Const(value) if value > 0 && this.rhs.hw.bitsOf(value).bitCount == 1 => 0
      case _ => 3

    override def implement(implicit cp: Sig[?] => Component): Component =
      this.rhs match
        case Const(value) if value > 0 && this.rhs.hw.bitsOf(value).bitCount == 1 =>
          val shift = this.rhs.hw.bitsOf(value).lowestSetBit - this.rhs.hw.asInstanceOf[FixedPoint].fractional
          if shift > 0 then
            ir.rtl.Concat(Seq(ir.rtl.Tap(cp(this.lhs), 0 until (this.lhs.hw.size - shift)),ir.rtl.Const(shift,0)))
          else
            ir.rtl.Concat(Seq(ir.rtl.Const(-shift, 0), ir.rtl.Tap(cp(this.lhs), (-shift) until this.lhs.hw.size)))
        case _ =>
          val shift = this.rhs.hw.asInstanceOf[FixedPoint].fractional
          ir.rtl.Tap(ir.rtl.Times(cp(this.lhs), cp(this.rhs)), shift until (shift + this.lhs.hw.size))
