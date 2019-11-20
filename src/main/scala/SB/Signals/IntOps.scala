/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW
import SB.HW.Unsigned
import Utils.{AssociativeNode, AssociativeNodeCompanion}

class And private (terms: Seq[SigRef[Int]]) extends AssociativeSig[Int](terms," & ",8){
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.And(terms.map(cp))

  override val pipeline = 1
}

object And extends AssociativeSigCompanion[Int,And](arg => new And(arg.map(_.ref)),(lhs:Sig[Int],rhs:Sig[Int])=>{
  require(lhs.hw == rhs.hw)
  implicit val hw = lhs.hw
  implicit val sb=lhs.sb
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



case class Not private(input: SigRef[Int]) extends Sig[Int](input)(input.hw) {
  override def implement(implicit cp: SigRef[_] => Component): Component =new RTL.Not(input)
}

object Not{
  def apply(input: Sig[Int])=input match{
    case Not(input) => input
    case _ => new Not(input)
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

object Xor extends AssociativeSigCompanion [Int,Xor](arg=>new Xor(arg.map(_.ref)),(lhs:Sig[Int],rhs:Sig[Int])=>{
//println(lhs+" "+rhs)

  require(lhs.hw == rhs.hw)
  implicit val hw = lhs.hw
  implicit val sb=lhs.sb
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
  def apply(input: Sig[Int]) = Xor((0 until input.hw.size).map(input(_)))
}
class Concat private(terms: Seq[SigRef[Int]]) extends AssociativeSig[Int](terms," :: ",12)(HW.Unsigned(terms.map(_.hw.size).sum)) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Concat(terms.map(cp))
}

object Concat extends AssociativeSigCompanion[Int,Concat]({list:Seq[Sig[Int]]=>new Concat(list.map(_.ref))},(lhs:Sig[Int],rhs:Sig[Int])=>{
  implicit val sb=lhs.sb
  (lhs,rhs) match{
    case (lhs:Const[Int], rhs:Const[Int]) => Left(Const((lhs.value << rhs.hw.size) + rhs.value)(Unsigned(lhs.hw.size + rhs.hw.size),sb))
    case (_, Null()) => Left(lhs)
    case (Null(),_) => Left(rhs)
    case (Tap(lhs, lr), Tap(rhs, rr)) if lhs == rhs && rr.last + 1 == lr.start => Left(lhs(rr.start to lr.last))
    case (lhs,rhs) => Right(lhs,rhs)
  }
})

case class Tap private(input: SigRef[Int], range: Range) extends Sig[Int](input)(Unsigned(range.size)) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Tap(input, range)
}

object Tap {
  def apply(input: Sig[Int], range: Range): Sig[Int] = {
    implicit val sb=input.sb
    input match {
      case _ if range.size == 0 => Null()
      case _ if range.length == input.hw.size => input
      case Const(value) => Const(((((1 << range.length) - 1) << range.start) & value) >> range.start)(Unsigned(range.length),sb)
      case Tap(input2, r2) => Tap(input2, (r2.start + range.start) to (r2.start + range.last))
      case Concat(signals: Seq[Sig[Int]]) => {
        def trimLeft(in: Seq[Sig[Int]], start: Int): Seq[Sig[Int]] = {
          if (in.head.hw.size <= start)
            trimLeft(in.tail, start - in.head.hw.size)
          else
            Tap(in.head, 0 until (in.head.hw.size - start)) +: in.tail
        }

        def trimRight(in: Seq[Sig[Int]], end: Int): Seq[Sig[Int]] = {
          if (in.last.hw.size <= end)
            trimRight(in.take(in.size - 1), end - in.last.hw.size)
          else
            in.take(in.size - 1) :+ Tap(in.last, end until in.last.hw.size)
        }

        Concat(trimRight(trimLeft(signals, input.hw.size - range.last - 1), range.start))
      }
      case _ => new Tap(input, range)
    }
  }

  def unapply(arg: Sig[Int]): Option[(Sig[Int], Range)] = arg match{
    case arg:Tap => Some(arg.input,arg.range)
    case _=> None
  }
}