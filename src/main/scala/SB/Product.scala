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

package SB

import SB.HardwareType.HW
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

  override def hasSinglePortedMem: Boolean = list.exists(_.hasSinglePortedMem)
}

object Product extends AssociativeNodeCompanionT[SB,Product] {
  override def simplify[T](lhs: SB[T], rhs: SB[T]): Either[SB[T], (SB[T], SB[T])] = {
    require(lhs.t == rhs.t)
    require(lhs.k == rhs.k)
    require(lhs.hw == rhs.hw)
    implicit val hw: HW[T] = lhs.hw
    val t=lhs.t
    (lhs, rhs) match {
      case (Identity(), rhs) => Left(rhs)
      case (lhs, Identity()) => Left(lhs)

      case (Steady(lhs,_),Steady(rhs,_))=>
        val size =Utils.lcm(lhs.size, rhs.size)
        Left(Steady(Seq.tabulate(size)(i => lhs(i % lhs.size) * rhs(i % rhs.size)),t))
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
