/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import SB.HW.HW
import SB.SB
import Utils._


/*abstract class Plus[T] (override val terms: Seq[SigRef[T]]) extends AssociativeSig[T](terms," + ",4)

object Plus extends AssociativeSigCompanionT[Plus] {
  override def create[T](inputs: Seq[Sig[T]]): Sig[T] = {
    require(inputs.size>1)
    inputs.head.hw.plus(inputs)
  }

  override def simplify[T](lhs: Sig[T], rhs: Sig[T]): Either[Sig[T], (Sig[T], Sig[T])] = {
    implicit val hw=lhs.hw
    implicit val sb=lhs.sb
    require(rhs.hw==hw)
    (lhs,rhs) match {
      case(Const(lhs),Const(rhs))=>Left(Const(hw.num.plus(lhs,rhs)))
      case(Zero(),rhs)=>Left(rhs)
      case(lhs,Zero()) => Left(lhs)
      case (Const(_),_)=>Right((rhs,lhs))

      case _ =>Right((lhs,rhs))
    }
  }
}*/
abstract class Plus[T](val lhs: SigRef[T], val rhs: SigRef[T]) extends Sig[T](lhs, rhs)(lhs.hw,lhs.sb){

}
object Plus{
  def apply[T: HW](lhs: Sig[T], rhs: Sig[T]) = implicitly[HW[T]].plus(lhs, rhs)

}
abstract class Minus[T](val lhs: SigRef[T], val rhs: SigRef[T]) extends Sig[T](lhs, rhs)(lhs.hw,lhs.sb){

}

abstract class Times[T](lhs: Sig[T], rhs: Sig[T]) extends Sig[T](lhs, rhs)(lhs.hw,lhs.sb)

/*object Plus {
  def apply[T: HW](lhs: Sig[T], rhs: Sig[T]):Sig[T] = {
    val hw=implicitly[HW[T]]
    require(lhs.hw==hw)
    require(rhs.hw==hw)
    (lhs,rhs) match {
      case(Const(lhs),Const(rhs))=>Const(hw.num.plus(lhs,rhs))
      case(Zero(),rhs)=>rhs
      case(lhs,Zero()) => lhs
      case (Const(_),_)=>Plus(rhs,lhs)

      case (Plus(lhs), Plus(rhs)) => Plus(lhs ++ rhs)
      case (lhs, Plus(_)) => Plus(rhs,lhs)
      case (Plus(lhsl :+ lhsr), rhs) => Plus(lhsr, rhs) match {
        case Plus(rhs) =>hw.plus(lhsl ++ rhs)
        case rhs => Plus(Plus(lhsl), rhs)
      }
      case _ => hw.plus(Vector(lhs, rhs))
    }
  }
  def apply[T:HW](terms: Vector[Sig[T]]):Sig[T]=terms.reduceLeft((lhs, rhs) => Plus(lhs, rhs))
  def unapply[T](arg:Sig[T]):Option[Vector[Sig[T]]]=arg match{
    case arg:Plus[T] => Some(arg.terms)
    case _ => None
  }
}*/

object Minus {
  def apply[T: HW](lhs: Sig[T], rhs: Sig[T]) = implicitly[HW[T]].minus(lhs, rhs)
}

object Times {
  def apply[T: HW](lhs: Sig[T], rhs: Sig[T]) = implicitly[HW[T]].times(lhs, rhs)
}

object Zero{
  def unapply[T:HW](arg:Sig[T])={
    val hw=implicitly[HW[T]]

    arg match{
      case Const(value) if hw.valueOf(hw.bitsOf(value))==hw.num.zero => true
      case _ => false
    }
  }
  def apply[T]()(implicit hw:HW[T],sb:SB[_])=Const(implicitly[HW[T]].num.zero)
}

object One{
  def unapply[T:HW](arg:Sig[T])={
    val hw=implicitly[HW[T]]
    arg match{
      case Const(value) if hw.valueOf(hw.bitsOf(value))==hw.num.one => true
      case _ => false
    }
  }
  def apply[T]()(implicit hw:HW[T],sb:SB[_])=Const(implicitly[HW[T]].num.one)
}
