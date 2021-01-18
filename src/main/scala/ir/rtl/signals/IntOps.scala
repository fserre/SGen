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

import ir.rtl.{Component, AcyclicStreamingModule}
import ir.rtl.hardwaretype
import ir.rtl.hardwaretype.{HW, Unsigned}
import ir.AssociativeNodeCompanion

import scala.annotation.tailrec

/** Signal that represents binary and of several signals */
final class And private (terms: Seq[Sig[Int]]) extends AssociativeSig[Int](terms," & "):
  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.And(terms.map(cp))
  override def equals(other:Any) = other match
    case other:And => other.list == list
    case _ => false
  override val pipeline = 1

/** Companion object of class And */
object And extends AssociativeSigCompanion[Int, And](arg => new And(arg), (lhs: Sig[Int], rhs: Sig[Int]) => 
  require(lhs.hw == rhs.hw)
  given HW[Int] = lhs.hw
  def withConst(const:Int, input:Sig[Int]) =
    val bits = lhs.hw.bitsOf(const)
    Concat((0 until lhs.hw.size).reverse.map(i => if bits.testBit(i) then input(i) else Const(0)(Unsigned(1))))
  (lhs, rhs) match
    case (Const(lhs), Const(rhs)) => Left(Const(lhs & rhs))
    case (_, Const(value)) => Left(withConst(value, lhs))
    case (Const(value), _) => Left(withConst(value, rhs))
    case (lhs, rhs) => Right(lhs, rhs)
)

/** Binary not of a signal */
case class Not private (input: Sig[Int]) extends Operator[Int](input)(input.hw):
  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.Not(cp(input))

/** Companion object of class Not */
object Not:
  def apply(input: Sig[Int]): Sig[Int] =
    given HW[Int] = input.hw
    input match
      case Const(value) => Const(((1 << input.hw.size) - 1) ^ value)
      case Not(input) => input
      case _ => new Not(input)

/** Binary xor of several signals */
final class Xor private (terms: Seq[Sig[Int]]) extends AssociativeSig[Int](terms, " ^ "):
  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.Xor(terms.map(cp))
  override val pipeline = 1
  override def equals(other: Any) = other match
    case other:Xor => other.list == list
    case _ => false

/** Companion object of class Xor */
object Xor extends AssociativeSigCompanion[Int, Xor](arg => new Xor(arg), (lhs: Sig[Int], rhs: Sig[Int]) => 
  require(lhs.hw == rhs.hw)
  given HW[Int] = lhs.hw
  def withConst(const:Int,input:Sig[Int]) =
    val bits = lhs.hw.bitsOf(const)
    Concat((0 until lhs.hw.size).reverse.map(i => if bits.testBit(i) then Not(input(i)) else input(i)))
  (lhs, rhs) match
    case (Const(lhs), Const(rhs)) => Left(Const(lhs ^ rhs))
    case (_, Const(value)) => Left(withConst(value, lhs))
    case (Const(value), _)=>Left(withConst(value, rhs))
    case (lhs, rhs) => Right(lhs, rhs)
)

/** Computes a xor reduction of a signal */
object RedXor:
  def apply(input: Sig[Int]): Sig[Int] = 
    if input.hw.size == 0 then
      Const(0)(using Unsigned(1))
    else
      Xor((0 until input.hw.size).map(input(_)))

/** Concatenation of several unsigned signals */
final class Concat private(terms: Seq[Sig[Int]]) extends AssociativeSig[Int](terms," :: ")(using Unsigned(terms.map(_.hw.size).sum)):
  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.Concat(terms.map(cp))
  override def equals(other:Any) = other match
    case other:Concat => other.list == list
    case _ => false
  
/** Companion object of class Concat */
object Concat extends AssociativeSigCompanion[Int, Concat]({ (list: Seq[Sig[Int]]) => new Concat(list) }, (lhs: Sig[Int], rhs: Sig[Int]) => 
  (lhs,rhs) match
    case (lhs:Const[Int], rhs:Const[Int]) => Left(Const((lhs.value << rhs.hw.size) + rhs.value)(Unsigned(lhs.hw.size + rhs.hw.size)))
    case (_, Null()) => Left(lhs)
    case (Null(),_) => Left(rhs)
    case (Tap(lhs, lr), Tap(rhs, rr)) if lhs == rhs && rr.last + 1 == lr.start => Left(lhs(rr.start to lr.last))
    case (lhs,rhs) => Right(lhs,rhs)
)

/** Selection of a range of bits in an unsigned signal */
case class Tap private (input: Sig[Int], range: Range) extends Operator[Int](input)(Unsigned(range.size)):
  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.Tap(cp(input), range)

/** Companion object of class Tap */
object Tap:
  def apply(input: Sig[Int], range: Range): Sig[Int] = 
    input match 
      case _ if range.isEmpty => Null()
      case _ if range.length == input.hw.size => input
      case Const(value) => Const(((((1 << range.length) - 1) << range.start) & value) >> range.start)(Unsigned(range.length))
      case Tap(input2, r2) => Tap(input2, (r2.start + range.start) to (r2.start + range.last))
      case Concat(signals: Seq[Sig[Int]]) =>
        @tailrec
        def trimLeft(in: Seq[Sig[Int]], start: Int): Seq[Sig[Int]] = 
          if (in.head.hw.size <= start)
            trimLeft(in.tail, start - in.head.hw.size)
          else
            Tap(in.head, 0 until (in.head.hw.size - start)) +: in.tail
        @tailrec
        def trimRight(in: Seq[Sig[Int]], end: Int): Seq[Sig[Int]] =
          if (in.last.hw.size <= end)
            trimRight(in.take(in.size - 1), end - in.last.hw.size)
          else
            in.take(in.size - 1) :+ Tap(in.last, end until in.last.hw.size)
        Concat(trimRight(trimLeft(signals, input.hw.size - range.last - 1), range.start))
      case _ => new Tap(input, range)
