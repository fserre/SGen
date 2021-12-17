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

/**
  * Parent class of nodes that represent a sum of two nodes
  *
  * @param lhs First term
  * @param rhs Second term
  * @tparam T Software datatype
  */
abstract class Plus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw):
  final override def changeParent(parentId: Int, newParent: Sig[?]) = parentId match
    case 0 => Plus(newParent.asInstanceOf[Sig[T]], rhs)
    case 1 => Plus(lhs, newParent.asInstanceOf[Sig[T]])

/** Companion object for Plus*/
object Plus:
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[T] =
    require(lhs.hw == rhs.hw)
    given HW[T] = lhs.hw
    import lhs.hw.num._
    (lhs, rhs) match
      case (Const(vl), Const(vr)) => Const(vl + vr)
      case (_, Zero()) => lhs
      case (Zero(), _) => rhs
      case (_, Opposite(rhs)) => lhs - rhs
      case (Opposite(lhs), _) => rhs - lhs
      case _ => lhs.hw.plus(lhs, rhs)

/**
 * Parent class of nodes that represent a difference of two nodes
 *
 * @param lhs First term
 * @param rhs Second term
 * @tparam T Software datatype
 */
abstract class Minus[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw):
  final override def changeParent(parentId: Int, newParent: Sig[?]) = parentId match
    case 0 => Minus(newParent.asInstanceOf[Sig[T]], rhs)
    case 1 => Minus(lhs, newParent.asInstanceOf[Sig[T]])

/** Companion object for Minus*/
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

/**
 * Parent class of nodes that represent a product of two nodes
 *
 * @param lhs First term
 * @param rhs Second term
 * @tparam T Software datatype
 */
abstract class Times[T](val lhs: Sig[T], val rhs: Sig[T]) extends Operator[T](lhs, rhs)(lhs.hw):
  final override def changeParent(parentId: Int, newParent: Sig[?]) = parentId match
    case 0 => Times(newParent.asInstanceOf[Sig[T]], rhs)
    case 1 => Times(lhs, newParent.asInstanceOf[Sig[T]])

/** Companion object for Times*/
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
      case (_, Mux(address, inputs)) if inputs.filter {
          case Zero() | One() | Opposite(One()) => false
          case _ => true
        }.distinct.size <= 1 => Mux(address,inputs.map(lhs * _))
      case (Times(llhs, lrhs@Const(vl)), Const(vr)) if lrhs.hw == rhs.hw => llhs * Const(vl*vr)(using lrhs.hw)
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

  def unapply[T](arg: Times[T]): Option[(Sig[T], Sig[T])] = Some(arg.lhs, arg.rhs)

/** Sugar to create/identify zero-valued signals*/
object Zero:
  /**
    * Check if a node is the constant 0
    */
  def unapply[T](arg: Sig[T]): Boolean =
    val hw=arg.hw
    arg match
      case Const(v) if hw.bitsOf(v) == hw.bitsOf(hw.num.zero) => true
      case _ => false
  /**
   * Creates constant signal 0
   */
  inline def apply[T:HW]: Sig[T] = Const(HW[T].num.zero)

/** Sugar to create/identify one-valued signals*/
object One:
  /**
    * Check if a node is the constant 1
     */
  def unapply[T](arg: Sig[T]): Boolean =
    val hw=arg.hw
    arg match
      case Const(value) if hw.bitsOf(value) == hw.bitsOf(hw.num.one) => true
      case _ => false
  /**
    * Creates constant signal 1
    */
  inline def apply[T: HW]: Sig[T] = Const(HW[T].num.one)

/** Sugar to create/identify opposites.*/
object Opposite:
  /**
    * Check if arg can be seen as the opposite of a node v. v doesn't require additional hardware to be used.
    */
  def unapply[T](arg: Sig[T]): Option[Sig[T]] =
    val hw = arg.hw
    arg match
      case Const(value) if hw.num.lt(value, hw.num.zero) => Some(Const(hw.num.negate(value))(using hw))
      case Minus(Zero(), arg) => Some(arg)
      case _ => None
  /**
    * Get the opposite of arg. This new node may require additional hardware to be used.
    */
  def apply[T](arg: Sig[T]): Sig[T] =
    given HW[T] = arg.hw
    arg match
      case Opposite(v) => v
      case _ => Zero[T] - arg
