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

package ir.rtl

import ir.rtl._
import ir.spl.SPL

case class ItProduct[U](r: Int, factor: StreamingModule[U], endLoopOpt: Option[StreamingModule[U]] = None) extends StreamingModule[U](factor.t, factor.k)(factor.hw) {
  val endLoop: StreamingModule[U] = {
    val res = endLoopOpt.getOrElse(Identity(t, k))
    res * Delay(t, k, Math.max(1 + factor.latency + res.latency, T) - (1 + factor.latency + res.latency))
  }
  val innerLatency: Int = 1 + factor.latency + endLoop.latency
  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    val feeding1 = new Wire(1)
    val feeding2 = new Mux(token(T - 1), Seq(feeding1, new Const(1, 0)))
    val feeding3 = new Mux(token(-1), Seq(feeding2, new Const(1, 1)))
    val feeding = feeding3.register
    feeding1.input = feeding
    val loopOutputsCopy = Seq.fill(K)(new Wire(hw.size))
    val loopInputs = loopOutputsCopy.zip(inputs).map { case (i1, i2) => new Mux(feeding, Seq(i1, i2)).register }
    val loopOutputs = factor.implement(rst, time => new Or((0 until r).map(_ * innerLatency + time + 1).map(token)), loopInputs)
    val loopEndOutputs = endLoop.implement(rst, time => new Or((0 until r - 1).map(_ * innerLatency + 1 + factor.latency + time).map(token)), loopOutputs)
    //val loopOutputs2 = loopOutputs.map(o => (0 until (innerLatency - (1 + factor.latency))).foldLeft(o)((x, _) => x.register))
    loopOutputsCopy.zip(loopEndOutputs).foreach { case (i1, i2) => i1.input = i2 }
    loopOutputs
  }

  override val latency: Int = (r - 1) * innerLatency + factor.latency + 1
  override val minGap: Int = (r - 1) * innerLatency
  override val spl: SPL[U] = ir.spl.ItProduct(r, factor.spl, endLoopOpt.map(_.spl))

  override def hasSinglePortedMem: Boolean = factor.hasSinglePortedMem
}

object ItProduct {
  /*def apply[U](r: Int, factor: StreamingModule[U]) = if(r==1)
    factor
  else
    new ItProduct[U](r, factor)*/
}