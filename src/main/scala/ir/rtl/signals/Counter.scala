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

import ir.rtl.{AcyclicStreamingModule, _}
import ir.rtl.hardwaretype.{HW, Unsigned}

/**
  * Counter signal
  *  
  * @param limit Upper limit of the counter (goes from 0 to limit - 1)
  * @param trigger Signal to increment the counter
  * @param reset Signal to set the counter back to resetValue
  * @param resetValue Reset value
  * @param delayTrigger Advance that should be requested on the trigger signal
  */
case class Counter(limit: Int, trigger: Sig[Int], reset: Sig[Int], resetValue: Int, delayTrigger: Int = 0) extends Sig(using Unsigned(BigInt(limit - 1).bitLength)):
  override val hash = Seq("Counter",limit,trigger,reset,resetValue,delayTrigger).hashCode()
  
  override def implement(cp: (Sig[?], Int) => Component): Component = 
    val prev = Wire(hw.size)
    val prevpp = Plus(Seq(prev, Const(hw.size,1)))
    val prevInc = if BigInt(limit).bitCount > 1 then
      Mux(Equals(prev, Const(hw.size, limit - 1)), Seq(prevpp, Const(hw.size, 0)))
    else
      prevpp
    val res1 = trigger match
      case One() => prevInc
      case _ => Mux(cp(trigger, 1 - delayTrigger), Vector(prev, prevInc))
    val res = Mux(cp(reset, 1), Vector(res1, Const(hw.size, resetValue))).register
    prev.input = res
    res
  override def parents: Seq[(Sig[?], Int)] = Seq((trigger, 1 - delayTrigger), (reset, 1))

/** Object that allows to create dataset counters.*/
object Counter:
  /**
    * Counter that counts the number of datasets that went through. It updates itself when a new dataset enters.  
    * 
    * @param limit Upper limit of the counter (goes from 0 to limit - 1)
    */
  def apply(limit: Int): Sig[Int] = if limit == 1 then signals.Const(0)(Unsigned(0)) else new Counter(limit, Next, Reset, limit - 1)

/** Object that allows to create counters with a late update.*/
object LateCounter:
  /**
   * Counter that counts the number of datasets that went through. It updates when the previous dataset leaves.
   *
   * @param limit Upper limit of the counter (goes from 0 to limit - 1)
   * @param delay Duration of a dataset (AcyclicStreamingModule.T)
   */
  def apply(limit: Int, delay: Int): Sig[Int] = if limit == 1 then signals.Const(0)(Unsigned(0)) else new Counter(limit, Next, Reset, 0, delay)

/** Object that allows to create timers, i.e. signals that count the number of cycles since the last dataset entered.*/
object Timer :
  /**
   * Counter that counts the number of cycles since the last dataset entered.
   *
   * @param limit Upper limit of the counter (goes from 0 to limit - 1)
   */
  def apply(limit: Int): Sig[Int] = if limit == 1 then signals.Const(0)(Unsigned(0)) else new Counter(limit, One(using Unsigned(1)), Next, 0)
  def unapply(arg: Sig[?]) = arg match
    case Counter(limit, signals.One(), signals.Next, resetValue, delayTrigger) if resetValue == 0 && delayTrigger==0 => Some(limit)
    case _ => None
