/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
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

package ir.rtl.signals

import ir.rtl.hardwaretype.HW
import ir.rtl.SB
import Utils._

import scala.annotation.tailrec


/*abstract class Plus[T] (override val terms: Seq[Sig[T]]) extends AssociativeSig[T](terms," + ",4)

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
abstract class Plus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw) {
  override def graphDeclaration: String = graphName + "[label=\"+\"];"
}
object Plus{
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    require(lhs.hw == rhs.hw)
    implicit val hw: HW[T] = lhs.hw
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

abstract class Minus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw) {
  override def graphDeclaration: String = graphName + "[label=\"-\"];"
}

abstract class Times[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw) {
  override def graphDeclaration: String = graphName + "[label=\"*\"];"
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
    implicit val hw: HW[T] = lhs.hw
    import hw.num._
    (lhs, rhs) match {
      case (Const(vl), Const(vr)) => Const(vl - vr)
      case (_, Zero()) => lhs
      case (_, Opposite(rhs)) => Plus(lhs, rhs)
      case _ => hw.minus(lhs, rhs)
    }
  }

  def unapply[T](arg: Minus[T]): Option[(Sig[T], Sig[T])] = Some(arg.lhs, arg.rhs)
}

object Times {
  @tailrec
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    implicit val hw: HW[T] = lhs.hw
    import hw.num._
    (lhs, rhs) match {
      case (Const(vl), Const(vr)) => Const(vl * vr)
      case (_, Zero()) => Zero[T]()
      case (_, One()) => lhs
      case (_, Opposite(One())) => Opposite(lhs)
      case (_, Mux(address, inputs)) if inputs.forall(_ match {
        case Zero() | One() | Opposite(One()) => true
        case _ => false
      }) => Mux(address, inputs.map {
        case Zero() => Zero()
        case One() => lhs
        case Opposite(One()) => Opposite(lhs)
        case _ => throw new Exception("Error")
      })
      case (lhs: Const[T], _) if rhs.hw == lhs.hw => Times(rhs, lhs)
      case _ => hw.times(lhs, rhs)
    }
  }
}

object Zero{
  def unapply[T:HW](arg:Sig[T]): Boolean ={
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
  def apply[T]()(implicit hw:HW[T]): Sig[T] =Const(implicitly[HW[T]].num.zero)
}

object One{
  def unapply[T:HW](arg:Sig[T]): Boolean ={
    val hw=implicitly[HW[T]]
    arg match{
      case Const(value) if hw.valueOf(hw.bitsOf(value))==hw.num.one => true
      case _ => false
    }
  }
  def apply[T]()(implicit hw:HW[T]): Sig[T] =Const(implicitly[HW[T]].num.one)
}

object Opposite {
  def unapply[T: HW](arg: Sig[T]): Option[Sig[T]] = {
    val hw = implicitly[HW[T]]
    arg match {
      case Const(value) if hw.num.lt(value, hw.num.zero) => Some(Const(hw.num.negate(value)))
      case Minus(Zero(), arg) => Some(arg)
      case _ => None
    }
  }

  def apply[T](arg: Sig[T]): Sig[T] = {
    implicit val hw: HW[T] = arg.hw
    arg match {
      case Opposite(arg) => arg
      case _ => Zero[T]() - arg
    }
  }
}