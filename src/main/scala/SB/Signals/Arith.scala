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
  override def graphDeclaration = graphName + "[label=\"+\"];"
}
object Plus{
  def apply[T](lhs: Sig[T], rhs: Sig[T]) = {
    require(lhs.hw == rhs.hw)
    implicit val hw = lhs.hw
    implicit val sb = lhs.sb
    import hw.num._
    (lhs, rhs) match {
      case (Const(vl), Const(vr)) => Const(vl + vr)
      case (_, Zero()) => lhs
      case (lhs: Const[T], _) => Times(rhs, lhs)
      case (_, Opposite(rhs)) => lhs - rhs
      case (Opposite(lhs), _) => rhs - lhs
      case _ => hw.plus(lhs, rhs)
    }
  }

}
abstract class Minus[T](val lhs: SigRef[T], val rhs: SigRef[T]) extends Sig[T](lhs, rhs)(lhs.hw,lhs.sb){
  override def graphDeclaration = graphName + "[label=\"-\"];"
}

abstract class Times[T](val lhs: SigRef[T], val rhs: SigRef[T]) extends Sig[T](lhs, rhs)(lhs.hw, lhs.sb) {
  override def graphDeclaration = graphName + "[label=\"*\"];"
}

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
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    require(lhs.hw == rhs.hw)
    implicit val hw = lhs.hw
    implicit val sb = lhs.sb
    import hw.num._
    (lhs, rhs) match {
      case (Const(vl), Const(vr)) => Const(vl - vr)
      case (_, Zero()) => lhs
      case (_, Opposite(rhs)) => Plus(lhs, rhs)
      case _ => hw.minus(lhs, rhs)
    }
  }

  def unapply[T](arg: Minus[T]): Option[(Sig[T], Sig[T])] = arg match {
    case arg: Minus[T] => Some(arg.lhs, arg.rhs)
    case _ => None
  }
}

object Times {
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    implicit val hw = lhs.hw
    implicit val sb = lhs.sb
    import hw.num._
    (lhs, rhs) match {
      case (Const(vl), Const(vr)) => Const(vl * vr)
      case (_, Zero()) => Zero[T]()
      case (_, One()) => lhs
      case (_, Opposite(One())) => Opposite(lhs)
      case (_, Mux(address, inputs)) if inputs.forall(_ match {
        case Zero() | One() | Opposite(One()) => true
        case _ => false
      }) => Mux(address, inputs.map(_ match {
        case Zero() => Zero()
        case One() => lhs
        case Opposite(One()) => Opposite(lhs)
        case _ => throw new Exception("Error")
      }))
      case (lhs: Const[T], _) if rhs.hw == lhs.hw => Times(rhs, lhs)
      case _ => hw.times(lhs, rhs)
    }
  }
}

object Zero{
  def unapply[T:HW](arg:Sig[T])={
    val hw=implicitly[HW[T]]

    arg match{
      case Const(value) if hw.bitsOf(value) == hw.bitsOf(hw.num.zero) => true
      /* case Const(value) =>
         println(value)
         println(hw.bitsOf(value))
         false*/
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

object Opposite {
  def unapply[T: HW](arg: Sig[T]): Option[Sig[T]] = {
    val hw = implicitly[HW[T]]
    implicit val sb = arg.sb
    arg match {
      case Const(value) if hw.num.lt(value, hw.num.zero) => Some(Const(hw.num.negate(value)))
      case Minus(Zero(), arg) => Some(arg)
      case _ => None
    }
  }

  def apply[T](arg: Sig[T]): Sig[T] = {
    implicit val hw = arg.hw
    implicit val sb = arg.sb
    arg match {
      case Opposite(arg) => arg
      case _ => Zero[T]() - arg
    }
  }
}