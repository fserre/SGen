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

import RTL.Component
import SB.{HardwareType, SB}
import _root_.SB.HardwareType.{HW, Unsigned}
import Utils.{AssociativeNode, AssociativeNodeCompanion}

import scala.annotation.tailrec

class And private (terms: Seq[SigRef[Int]]) extends AssociativeSig[Int](terms," & ",8){
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.And(terms.map(cp))

  override val pipeline = 1
}

object And extends AssociativeSigCompanion[Int, And](arg => new And(arg.map(_.ref)), (lhs: Sig[Int], rhs: Sig[Int]) => {
  require(lhs.hw == rhs.hw)
  implicit val hw: HW[Int] = lhs.hw
  implicit val sb: SB[_] =lhs.sb
  def withConst(const:Int,input:Sig[Int])={
    val bits = hw.bitsOf(const)
    Concat((0 until hw.size).reverse.map(i=>if(bits.testBit(i)) input(i) else Const(0)(Unsigned(1),sb)))
  }
  (lhs,rhs) match{
    case (Const(lhs), Const(rhs)) => Left(Const(lhs & rhs))
    case (_,Const(value)) => Left(withConst(value,lhs))
    case (Const(value),_) => Left(withConst(value,rhs))
    case (lhs,rhs) => Right(lhs,rhs)
  }
})


case class Not private(input: SigRef[Int]) extends Operator[Int](input)(input.hw) {
  override def implement(implicit cp: SigRef[_] => Component): Component =new RTL.Not(cp(input))
}

object Not{
  def apply(input: Sig[Int]): Sig[Int] = {
    implicit val hw: HW[Int] = input.hw
    implicit val sb: SB[_] = input.sb
    input match {
      case Const(value) => Const(((1 << hw.size) - 1) ^ value)
      case Not(input) => input
      case _ => new Not(input)
    }
  }

  def unapply(arg: Sig[Int]): Option[Sig[Int]] = arg match{
    case arg:Not => Some(arg.input)
    case _=>None
  }
}

class Xor private(terms: Seq[SigRef[Int]]) extends AssociativeSig[Int](terms, " ^ ",9) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Xor(terms.map(cp))

  override val pipeline = 1
}

object Xor extends AssociativeSigCompanion[Int, Xor](arg => new Xor(arg.map(_.ref)), (lhs: Sig[Int], rhs: Sig[Int]) => {
//println(lhs+" "+rhs)

  require(lhs.hw == rhs.hw)
  implicit val hw: HW[Int] = lhs.hw
  implicit val sb: SB[_] =lhs.sb
  def withConst(const:Int,input:Sig[Int])={
    val bits = hw.bitsOf(const)
    Concat((0 until hw.size).reverse.map(i=>if(bits.testBit(i)) Not(input(i)) else input(i)))
  }
  (lhs,rhs) match{
    case (Const(lhs), Const(rhs)) => Left(Const(lhs ^ rhs))
    case (_, Const(value)) => Left(withConst(value,lhs))
    case (Const(value),_)=>Left(withConst(value,rhs))
    case (lhs,rhs) => Right(lhs,rhs)
  }
})
object RedXor {
  def apply(input: Sig[Int]): Sig[Int] = Xor((0 until input.hw.size).map(input(_)))
}
class Concat private(terms: Seq[SigRef[Int]]) extends AssociativeSig[Int](terms," :: ",12)(Unsigned(terms.map(_.hw.size).sum)) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Concat(terms.map(cp))
}

object Concat extends AssociativeSigCompanion[Int, Concat]({ (list: Seq[Sig[Int]]) => new Concat(list.map(_.ref)) }, (lhs: Sig[Int], rhs: Sig[Int]) => {
  implicit val sb: SB[_] =lhs.sb
  (lhs,rhs) match{
    case (lhs:Const[Int], rhs:Const[Int]) => Left(Const((lhs.value << rhs.hw.size) + rhs.value)(Unsigned(lhs.hw.size + rhs.hw.size),sb))
    case (_, Null()) => Left(lhs)
    case (Null(),_) => Left(rhs)
    case (Tap(lhs, lr), Tap(rhs, rr)) if lhs == rhs && rr.last + 1 == lr.start => Left(lhs(rr.start to lr.last))
    case (lhs,rhs) => Right(lhs,rhs)
  }
})

case class Tap private(input: SigRef[Int], range: Range) extends Operator[Int](input)(Unsigned(range.size)) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Tap(cp(input), range)
}

object Tap {
  def apply(input: Sig[Int], range: Range): Sig[Int] = {
    implicit val sb: SB[_] =input.sb
    input match {
      case _ if range.isEmpty => Null()
      case _ if range.length == input.hw.size => input
      case Const(value) => Const(((((1 << range.length) - 1) << range.start) & value) >> range.start)(Unsigned(range.length),sb)
      case Tap(input2, r2) => Tap(input2, (r2.start + range.start) to (r2.start + range.last))
      case Concat(signals: Seq[Sig[Int]]) =>
        @tailrec
        def trimLeft(in: Seq[Sig[Int]], start: Int): Seq[Sig[Int]] = {
          if (in.head.hw.size <= start)
            trimLeft(in.tail, start - in.head.hw.size)
          else
            Tap(in.head, 0 until (in.head.hw.size - start)) +: in.tail
        }

        @tailrec
        def trimRight(in: Seq[Sig[Int]], end: Int): Seq[Sig[Int]] = {
          if (in.last.hw.size <= end)
            trimRight(in.take(in.size - 1), end - in.last.hw.size)
          else
            in.take(in.size - 1) :+ Tap(in.last, end until in.last.hw.size)
        }

        Concat(trimRight(trimLeft(signals, input.hw.size - range.last - 1), range.start))
      case _ => new Tap(input, range)
    }
  }

  def unapply(arg: Sig[Int]): Option[(Sig[Int], Range)] = arg match{
    case arg:Tap => Some(arg.input,arg.range)
    case _=> None
  }
}