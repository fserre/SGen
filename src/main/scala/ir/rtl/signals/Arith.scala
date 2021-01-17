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
import ir.rtl.AcyclicStreamingModule
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

abstract class Plus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw)

object Plus:
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = 
    require(lhs.hw == rhs.hw)
    given HW[T] = lhs.hw
    import lhs.hw.num._
    (lhs, rhs) match 
      case (Const(vl), Const(vr)) => Const(vl + vr)
      case (_, Zero()) => lhs
      case (lhs: Const[T], _) => Times(rhs, lhs)
      case (_, Opposite(rhs)) => lhs - rhs
      case (Opposite(lhs), _) => rhs - lhs
      case _ => lhs.hw.plus(lhs, rhs)

abstract class Minus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw)

object Minus:
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = 
    require(lhs.hw == rhs.hw)
    given HW[T] = lhs.hw
    import lhs.hw.num._
    (lhs, rhs) match 
      case (Const(vl), Const(vr)) => Const(vl - vr)
      case (_, Zero()) => lhs
      case (_, Opposite(rhs)) => Plus(lhs, rhs)
      case (Opposite(lhs), _) => Opposite(Plus(lhs, rhs))
      case _ => lhs.hw.minus(lhs, rhs)

  def unapply[T](arg: Minus[T]): Option[(Sig[T], Sig[T])] = Some(arg.lhs, arg.rhs)


abstract class Times[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw)

object Times:
  //@tailrec
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] = 
    given HW[T] = lhs.hw
    import lhs.hw.num._
    (lhs, rhs) match
      case (Const(vl), Const(vr)) => Const(vl * vr)
      case (_, Zero()) => Zero[T]
      case (Zero(), _) => Zero[T]
      case (_, One()) => lhs
      case (One(), _) if lhs.hw == rhs.hw => rhs
      case (_, Mux(address, inputs)) if inputs.filter{
          case Zero() | One() | Opposite(One()) => false
          case _ => true
        }.distinct.size <= 1 => Mux(address,inputs.map(lhs * _))

      // Following cases may induce supplementary hardware in front of the node to implement the negation. 
      // In case of FFTs, these reduce the number of multipliers used (triggers common subexpression elimination), and as butterflies come next, negation will be handled with no cost. 
      case (_, Opposite(x)) => Opposite(lhs * x)
      case (Opposite(x),_) => Opposite(x * lhs)
      case (_, ROM(values, address)) if values.flatMap{
          case x if rhs.hw.bitsOf(x) == rhs.hw.bitsOf(rhs.hw.num.zero) => None
          case x if rhs.hw.bitsOf(x) == rhs.hw.bitsOf(rhs.hw.num.one) => None
          case x if rhs.hw.num.lt(x, rhs.hw.num.zero) => Some(rhs.hw.bitsOf(-x))
          case x => Some(rhs.hw.bitsOf(x))
        }.distinct.size == 1 => Mux(address, values.map(lhs * Const(_)(using rhs.hw))) 
      case _ => lhs.hw.times(lhs, rhs)
    
  


object Zero:
  inline def unapply[T](arg:Sig[T]): Boolean =
    val hw=arg.hw
    arg match
      case Const(v) if hw.bitsOf(v) == hw.bitsOf(hw.num.zero) => true
      case _ => false
  inline def apply[T:HW]: Sig[T] = Const(HW[T].num.zero)


object One:
  inline def unapply[T](arg:Sig[T]): Boolean =
    val hw=arg.hw
    arg match
      case Const(value) if hw.bitsOf(value) == hw.bitsOf(hw.num.one) => true
      case _ => false
  inline def apply[T: HW]: Sig[T] = Const(HW[T].num.one)

object Opposite:
  def unapply[T](arg: Sig[T]): Option[Sig[T]] = 
    val hw = arg.hw
    arg match 
      case Const(value) if hw.num.lt(value, hw.num.zero) => Some(Const(hw.num.negate(value))(using hw))
      case Minus(Zero(), arg) => Some(arg)
      case _ => None
  def apply[T](arg: Sig[T]): Sig[T] = 
    implicit val hw: HW[T] = arg.hw
    arg match 
      case Opposite(v) => v
      case _ => Zero[T] - arg