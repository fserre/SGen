/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
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

package SB.Signals

import RTL._
import SB.HW.{HW, Unsigned}
import SB.SB

case class Counter(limit: Int, trigger: SigRef[Int], reset: SigRef[Int], resetValue: Int, delayTrigger: Int = 0) extends Sig[Int] {
  //Operator(trigger, reset)(Unsigned(BigInt(limit - 1).bitLength))
  override implicit val sb: SB[_] = trigger.sb
  override implicit val hw: HW[Int] = Unsigned(BigInt(limit - 1).bitLength)

  override def implement(cp: (SigRef[_], Int) => Component): Component = /*Counter.mkCounter(limit,resetValue,cp(reset,1),trigger.sig match{
    case One()=> None
    case _ => Some(cp(trigger,1-delayTrigger))
  })*/ {
    val prev = Wire(hw.size)
    val prevpp=new Plus(Seq(prev,new Const(hw.size,1)))
    val prevInc = if (BigInt(limit).bitCount > 1)
      new Mux(new Equals(prev, new Const(hw.size, limit - 1)),Seq(prevpp,new Const(hw.size, 0)))
    else
      prevpp
    val res1 = trigger.sig match {
      case One() => prevInc
      case _ => new Mux(cp(trigger, 1 - delayTrigger), Vector(prev, prevInc))
    }
    val res = new Mux(cp(reset, 1), Vector(res1, new Const(hw.size, resetValue))).register
    prev.input = res
    res
  }

  //override def latency = 1
  override def parents: Seq[(SigRef[_], Int)] = Seq((trigger, 1 - delayTrigger), (reset, 1))
}

object Counter {
  def apply(limit: Int)(implicit sb:SB[_]): Sig[Int] = if (limit == 1) SB.Signals.Const(0)(Unsigned(0),sb) else new Counter(limit, Next(sb), Reset(sb), limit - 1)

  /*def mkCounter(limit:Int,resetValue:Int,reset:Component,trigger:Option[Component])={
    val size=BigInt(limit - 1).bitLength
    val prev = Wire(size)
    val prevpp=new Plus(Seq(prev,new Const(size,1)))
    val prevInc = if (BigInt(limit).bitCount > 1)
      new Mux(new Equals(prev, new Const(size, limit - 1)),Seq(prevpp,new Const(size, 0)))
    else
      prevpp
    val res1 = trigger match {
      case None => prevInc
      case Some(trigger) => new Mux(trigger, Vector(prev, prevInc))
    }
    val res = new Mux(reset, Vector(res1, new Const(size, resetValue))).register
    prev.input = res
    res
  }*/
}

object LateCounter {
  def apply(limit: Int, delay: Int)(implicit sb: SB[_]): Sig[Int] = if (limit == 1) SB.Signals.Const(0)(Unsigned(0), sb) else new Counter(limit, Next(sb), Reset(sb), 0, delay)
}

object Timer {
  def apply(limit: Int)(implicit sb: SB[_]): Sig[Int] = if (limit == 1) SB.Signals.Const(0)(Unsigned(0), sb) else new Counter(limit, One()(Unsigned(1), sb), Next(sb), 0)
}