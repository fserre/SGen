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

package SPL

import RTL.HardwareType.HW
import RTL.{RAMControl, StreamingModule}
import Utils.{AssociativeNode, AssociativeNodeCompanionT}
import transforms.SLP
import transforms.SLP.LinearPerm


class Product[T] private(override val list: Seq[SPL[T]]) extends SPL[T](list.head.n) with AssociativeNode[SPL[T]]{
  assert(list.forall(_.n == n))
  override def eval(inputs: Seq[T], set: Int): Seq[T] = list.foldRight(inputs)((spl, ins) => spl.eval(ins, set))
//TODO: Handle when SB
  override def stream(k: Int,control:RAMControl)(implicit hw: HW[T]): StreamingModule[T] = RTL.Product(list.map(_.stream(k,control)))
}

object Product extends AssociativeNodeCompanionT[SPL,Product] {
  override def simplify[T](lhs: SPL[T], rhs: SPL[T]): Either[SPL[T], (SPL[T], SPL[T])] = {
    require(lhs.n==rhs.n)
    (lhs, rhs) match {
      case (Identity(), rhs) => Left(rhs)
      case (lhs, Identity()) => Left(lhs)
      case (LinearPerm(lhs), LinearPerm(rhs)) =>
        val size =Utils.lcm(lhs.size, rhs.size)
        Left(SLP.LinearPerm(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size))))
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
