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
import ir.rtl.signals._

case class Unsigned(_size: Int) extends HW[Int](_size):
  class UnsignedPlus(override val lhs: SigRef[Int],override val rhs: SigRef[Int]) extends Plus(lhs,rhs):
    override def pipeline = 1

    override def implement(implicit cp: SigRef[?] => Component) =new ir.rtl.Plus(Seq(cp(lhs),cp(rhs)))

  case class UnsignedMinus(override val lhs: SigRef[Int],override val rhs: SigRef[Int]) extends Minus(lhs,rhs):
    override def pipeline = 1

    override def implement(implicit cp: SigRef[?] => Component) =new ir.rtl.Minus(cp(lhs),cp(rhs))

  override def plus(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = new UnsignedPlus(lhs,rhs)

  override def minus(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = UnsignedMinus(lhs, rhs)

  override def times(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = ???

  private val mask: BigInt = (BigInt(1) << size) - 1

  override def bitsOf(const: Int): BigInt = BigInt(const) & mask

  override def valueOf(const: BigInt): Int = const.toInt

  override def description: String = s"$size-bits unsigned integer"


