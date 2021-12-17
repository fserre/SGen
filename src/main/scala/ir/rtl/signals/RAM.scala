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

package ir.rtl.signals

import ir.rtl.{Component, AcyclicStreamingModule}
import ir.rtl.hardwaretype.{HW, Unsigned}

/** Signal that represents a RAM which read and write addresses are controled by two independent signals */
case class DualControlRAM[U](input: Sig[U], addrWr: Sig[Int], addrRd: Sig[Int], latency: Int) extends Sig[U](using input.hw):
  override def parents: Seq[(Sig[?], Int)] = Seq((input, latency + 2), (addrWr, latency + 2), (addrRd, 1))

  override def changeParent(parentId: Int, newParent: Sig[_]): Sig[U] = parentId match
    case 0 => copy(input = newParent.asInstanceOf[Sig[U]])
    case 1 => copy(addrWr = newParent.asInstanceOf[Sig[Int]])
    case 2 => copy(addrRd = newParent.asInstanceOf[Sig[Int]])

  override val pipeline = 1

  override def implement(cp: (Sig[?], Int) => Component): Component = ir.rtl.RAM(cp(input, latency + 2), cp(addrWr, latency + 2), cp(addrRd, 1))

  override val hash = Seq(input,addrWr,latency).hashCode()

/** Signal that represents a RAM which read and write addresses are controled by the same signal */
case class SingleControlRAM[U](input: Sig[U], addrWr: Sig[Int], latency: Int, T: Int) extends Sig[U](using input.hw):
  val timeRd: Int = T + 1

  override def parents: Seq[(Sig[?], Int)] = Seq((input, latency + 2), (addrWr, latency + 2), (addrWr, timeRd))

  override def changeParent(parentId: Int, newParent: Sig[_]): Sig[U] = parentId match
    case 0 => copy(input = newParent.asInstanceOf[Sig[U]])
    case 1 | 2 => copy(addrWr = newParent.asInstanceOf[Sig[Int]])

  override val pipeline = 1

  override def implement(cp: (Sig[?], Int) => Component): Component = ir.rtl.RAM(cp(input, latency + 2), cp(addrWr, latency + 2), cp(addrWr, timeRd))

  override val hash = Seq(input,addrWr,latency).hashCode()

/** Signal that computes temporal permutations using a double shift register*/
case class DoubleShiftReg[U] private (input: Sig[U], switch: Sig[Int], timer: Sig[Int]) extends Sig[U](using input.hw):

  override val hash = Seq(input, switch, timer).hashCode()

  override val pipeline = 1

  override def parents: Seq[(Sig[?], Int)] =
    switch match
      case Const(value) if value == 1 => Seq((timer, 0), (switch,0), (input,1), (input,-1))
      case _ => Seq((timer, 0), (switch,0), (input,0), (input,1), (input,-1))

  override def changeParent(parentId: Int, newParent: Sig[_]): Sig[U] = parentId match
    case 0 => DoubleShiftReg(input, switch, newParent.asInstanceOf[Sig[Int]])
    case 1 => DoubleShiftReg(input, newParent.asInstanceOf[Sig[Int]], timer)
    case _ => DoubleShiftReg(newParent.asInstanceOf[Sig[U]], switch, timer)

  override def implement(cp: (Sig[?], Int) => Component): Component =
    switch match
      case Const(value) if value == 1 => ir.rtl.Mux(cp(timer,0),Seq(cp(input, 1), cp(input, -1)))
      case _ => ir.rtl.Mux(cp(switch, 0), Seq(cp(input, 0), ir.rtl.Mux(cp(timer,0),Seq(cp(input, 1), cp(input, -1)))))

/** Companion object of class DoubleShiftReg */
object DoubleShiftReg:
  def apply[U](input: Sig[U], switch: Sig[Int], timer: Sig[Int]) =
    require(switch.hw == Unsigned(1))
    require(timer.hw == Unsigned(1))
    switch match
      case Zero() => input
      case _ => new DoubleShiftReg(input, switch, timer)
