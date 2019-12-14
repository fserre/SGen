/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SPL

import SB.HW.HW
import StreamingModule.StreamingModule
import Utils.{AssociativeNode, AssociativeNodeCompanionT}


class Product[T] private(override val list: Seq[SPL[T]]) extends SPL[T](list.head.n) with AssociativeNode[SPL[T]]{
  assert(list.forall(_.n == n))

  override def eval(inputs: Seq[T], set: Int): Seq[T] = list.foldRight(inputs)((spl, ins) => spl.eval(ins, set))
//TODO: Handle when SB
  override def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T] = StreamingModule.Product(list.map(_.stream(k)))
}

object Product extends AssociativeNodeCompanionT[SPL,Product] {
  override def simplify[T](lhs: SPL[T], rhs: SPL[T]): Either[SPL[T], (SPL[T], SPL[T])] = {
    require(lhs.n==rhs.n)
    val n = rhs.n
    (lhs, rhs) match {
      case (Identity(), rhs) => Left(rhs)
      case (lhs, Identity()) => Left(lhs)
      case (LinearPerm(lhs), LinearPerm(rhs)) => {
        val size =Utils.lcm(lhs.size, rhs.size)
        Left(LinearPerm(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size))))
      }
      case _ => Right((lhs,rhs))
    }
    }
  /*def apply[T](lhs: SPL[T], rhs: SPL[T]): SPL[T] = {
    require(lhs.n == rhs.n)
    val n = rhs.n
    (lhs, rhs) match {
      case (Identity(), rhs) => rhs
      case (lhs, Identity()) => lhs
      case (LinearPerm(lhs), LinearPerm(rhs)) => {
        val size = Math.max(lhs.size, rhs.size)
        LinearPerm(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size)))
      }

      case (Product(lhs), Product(rhs)) => Product(lhs ++ rhs)
      case (lhs, Product(rhs)) => Product(lhs +: rhs)
      case (Product(lhsl :+ lhsr), rhs) => Product(lhsr, rhs) match {
        case Product(rhs) => new Product(lhsl ++ rhs)
        case rhs => Product(Product(lhsl), rhs)
      }
      case (Product(lhs), rhs) => new Product(lhs :+ rhs)
      case _ => new Product(Seq(lhs, rhs))
    }
  }*/

  //def apply[T](factors: Seq[SPL[T]]): SPL[T] = factors.reduceLeft((lhs, rhs) => Product(lhs, rhs))
  def apply[T](nb:Int)(block:Int=>SPL[T]):SPL[T]=(0 until nb).map(block).reduceLeft(_ * _)

  override def create[T](inputs: Seq[SPL[T]]): SPL[T] = new Product(inputs)
}
