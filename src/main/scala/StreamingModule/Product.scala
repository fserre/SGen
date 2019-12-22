/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package StreamingModule

import RTL.Component
import SB.HW.HW
import SB.{Identity, SB}
import Utils.{AssociativeNode, AssociativeNodeCompanionT}

class Product[U] private (override val list: Seq[StreamingModule[U]]) extends StreamingModule(list.head.t, list.head.k)(list.head.hw) with AssociativeNode[StreamingModule[U]]{

  override val spl = SPL.Product(list.map(_.spl))

  override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]) = {
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
}

object Product extends AssociativeNodeCompanionT[StreamingModule,Product] {
  override def create[T](inputs: Seq[StreamingModule[T]]): StreamingModule[T] = new Product(inputs)

  override def simplify[T](lhs: StreamingModule[T], rhs: StreamingModule[T]): Either[StreamingModule[T], (StreamingModule[T], StreamingModule[T])] = {
    val t=lhs.t
    val k=rhs.k
    implicit val hw=lhs.hw
    require(lhs.t==t)
    require(rhs.k==k)
    require(lhs.hw==hw)
    (lhs,rhs) match {
      case (_,Identity())=>Left(lhs)
      case (Identity(),_)=>Left(rhs)
      case(lhs:SB[T],rhs:SB[T])=>Left(SB.Product(lhs,rhs))

      case _ =>Right((lhs,rhs))
    }
  }
}