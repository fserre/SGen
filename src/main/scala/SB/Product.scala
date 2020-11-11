/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB

import SB.HW.HW
import SB.SLP.Steady
import SPL.SPL
import SB.Signals.Sig
import StreamingModule.StreamingModule
import Utils.{AssociativeNode, AssociativeNodeCompanion, AssociativeNodeCompanionT}

class Product[U] private (override val list: Seq[SB[U]]) extends SB[U](list.head.t, list.head.k)(list.head.hw) with AssociativeNode[SB[U]] {
  assert(list.forall(_.t == t))
  assert(list.forall(_.k == k))

  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[_]): Seq[Sig[U]] = list.foldRight(inputs)(_ implement _)

  override def spl: SPL[U] = SPL.Product(list.map(_.spl))
}

object Product extends AssociativeNodeCompanionT[SB,Product] {
  override def simplify[T](lhs: SB[T], rhs: SB[T]): Either[SB[T], (SB[T], SB[T])] = {
    require(lhs.t == rhs.t)
    require(lhs.k == rhs.k)
    require(lhs.hw == rhs.hw)
    implicit val hw = lhs.hw
    val t=lhs.t
    (lhs, rhs) match {
      case (Identity(), rhs) => Left(rhs)
      case (lhs, Identity()) => Left(lhs)

      case (Steady(lhs,_),Steady(rhs,_))=>{
        val size =Utils.lcm(lhs.size, rhs.size)
        Left(Steady(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size)),t))
      }
      //todo:Add SLP

      case _ => Right((lhs, rhs))
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
  override def create[T](inputs: Seq[SB[T]]): SB[T] = new Product[T](inputs)
}
