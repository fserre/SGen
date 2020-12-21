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

package StreamingModule

import RTL.Component
import AcyclicStreamingModule.HardwareType.HW
import AcyclicStreamingModule.{Identity, SB}
import SPL.SPL
import Utils.{AssociativeNode, AssociativeNodeCompanionT}

class Product[U] private (override val list: Seq[StreamingModule[U]]) extends StreamingModule(list.head.t, list.head.k)(list.head.hw) with AssociativeNode[StreamingModule[U]]{

  override val spl: SPL[U] = SPL.Product(list.map(_.spl))

  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    var res=inputs
    var curLatency=0
    list.reverse.foreach(t=>{
      res=t.implement(rst,time=>token(time+curLatency),res)
      curLatency+=t.latency
    })
    res
//    terms.foldRight(inputs)((sm, ins) => sm.implement(rst, token, ins))
  }
  override def minGap: Int = list.map(_.minGap).max
  override def latency: Int = list.map(_.latency).sum

  override def hasSinglePortedMem: Boolean = list.exists(_.hasSinglePortedMem)
}

object Product extends AssociativeNodeCompanionT[StreamingModule,Product] {
  override def create[T](inputs: Seq[StreamingModule[T]]): StreamingModule[T] = new Product(inputs)

  override def simplify[T](lhs: StreamingModule[T], rhs: StreamingModule[T]): Either[StreamingModule[T], (StreamingModule[T], StreamingModule[T])] = {
    val t=lhs.t
    val k=rhs.k
    implicit val hw: HW[T] =lhs.hw
    require(lhs.t==t)
    require(rhs.k==k)
    require(lhs.hw==hw)
    (lhs,rhs) match {
      case (_,Identity())=>Left(lhs)
      case (Identity(),_)=>Left(rhs)
      case(lhs:SB[T],rhs:SB[T])=>Left(AcyclicStreamingModule.Product(lhs,rhs))

      case _ =>Right((lhs,rhs))
    }
  }
}