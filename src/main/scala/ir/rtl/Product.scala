/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
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

import ir.{AssociativeNode, AssociativeNodeCompanionT}
import transforms.perm.Steady
import ir.rtl.signals.Sig
import ir.rtl.hardwaretype.HW
import ir.rtl.{Component, StreamingModule}
import ir.spl.SPL
import ir.AssociativeNode

class Product[U] private (override val list: Seq[StreamingModule[U]]) extends StreamingModule(list.head.t, list.head.k)(using list.head.hw) with AssociativeNode[StreamingModule[U]]{

  override val spl: SPL[U] = ir.spl.Product(list.map(_.spl))

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

object Product extends AssociativeNodeCompanionT[StreamingModule,Product]([T] => (inputs:Seq[StreamingModule[T]]) => new Product(inputs)) {
  //override def create[T](inputs: Seq[StreamingModule[T]]): StreamingModule[T] = new Product(inputs)

  override def simplify[T](lhs: StreamingModule[T], rhs: StreamingModule[T]) = {
    val t=lhs.t
    val k=rhs.k
    implicit val hw: HW[T] =lhs.hw
    require(lhs.t==t)
    require(rhs.k==k)
    require(lhs.hw==hw)
    (lhs,rhs) match {
      case (_,Identity())=>Some(lhs)
      case (Identity(),_)=>Some(rhs)
      case(lhs:AcyclicStreamingModule[T],rhs:AcyclicStreamingModule[T])=>Some(AcyclicProduct(lhs,rhs))

      case _ =>None
    }
  }
}

class AcyclicProduct[U] private(override val list: Seq[AcyclicStreamingModule[U]]) extends AcyclicStreamingModule[U](list.head.t, list.head.k)(using list.head.hw) with AssociativeNode[AcyclicStreamingModule[U]] {
  assert(list.forall(_.t == t))
  assert(list.forall(_.k == k))

  override def implement(inputs: Seq[Sig[U]]): Seq[Sig[U]] =
    require (inputs.size==K)
    list.foldRight(inputs)(_.implement(_))

  override def spl: SPL[U] = ir.spl.Product(list.map(_.spl))

  override def hasSinglePortedMem: Boolean = list.exists(_.hasSinglePortedMem)
}

object AcyclicProduct extends AssociativeNodeCompanionT[AcyclicStreamingModule,AcyclicProduct]([T] => (inputs:Seq[AcyclicStreamingModule[T]]) => new AcyclicProduct(inputs))  {
  override def simplify[T](lhs: AcyclicStreamingModule[T], rhs: AcyclicStreamingModule[T]) = {
    require(lhs.t == rhs.t)
    require(lhs.k == rhs.k)
    require(lhs.hw == rhs.hw)
    implicit val hw: HW[T] = lhs.hw
    val t=lhs.t
    (lhs, rhs) match {
      case (Identity(), _) => Some(rhs)
      case (_, Identity()) => Some(lhs)

      case (Steady(lhs,_),Steady(rhs,_))=>
        val size =Utils.lcm(lhs.size, rhs.size)
        Some(Steady(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size)),t))
      //todo:Add SLP

      case _ => None
    }
  }
  /*def apply[U](lhs: SB[U], rhs: SB[U]): SB[U] = {
    require(lhs.t == rhs.t)
    require(lhs.k == rhs.k)
    require(lhs.hw == rhs.hw)
    val t = rhs.t
    val k = rhs.k
    implicit val hw = lhs.hw
    (lhs, rhs) match {
      case (Identity(), rhs) => rhs
      case (lhs, Identity()) => lhs
      //todo:Add SLP

      case (ProductSB(lhs), ProductSB(rhs)) => ProductSB( lhs ++ rhs)
      case (lhs, ProductSB(rhs)) => ProductSB( lhs +: rhs)

      case (ProductSB( lhsl :+ lhsr), rhs) => ProductSB(lhsr, rhs) match {
        case ProductSB( rhs) => new ProductSB(lhsl ++ rhs)
        case rhs => ProductSB(ProductSB(lhsl), rhs)
      }
      case _ => new ProductSB(Seq(lhs, rhs))
    }
  }*/

  //def apply[U: HW](factors: Seq[SB[U]]): SB[U] = factors.reduceLeft((lhs, rhs) => ProductSB(lhs, rhs))
  //override def create[T](inputs: Seq[AcyclicStreamingModule[T]]): AcyclicStreamingModule[T] = new AcyclicProduct[T](inputs)
}
