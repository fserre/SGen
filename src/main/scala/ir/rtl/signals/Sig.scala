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

import ir.{AssociativeNode, AssociativeNodeCompanion, AssociativeNodeCompanionT}
import ir.rtl.{Component, AcyclicStreamingModule}
import ir.rtl.hardwaretype.{HW, Unsigned}
import ir.AssociativeNodeCompanion
import linalg.Fields.{Complex, F2}
import linalg._
import scala.reflect._

/**
 * Class that represent a node in an acyclic streaming module internal graph. These nodes are comparable to RTL components, but abstract the hardware numeric representation, and timing.
 * @tparam T Equivalent software datatype of the node
 */
abstract class Sig[T: HW]:
  val hash: Int
  /** Parent signals of the node (each given as a pair: Sig and number of cycles of advance this parent must have compared to this signal).*/
  def parents: Seq[(Sig[?], Int)]
  /** Number of registers that should be put after this signal.*/
  def pipeline = 0
  /** Implementation of this signal (using RTL components)*/
  def implement(cp: (Sig[?], Int) => Component): Component
  /** Adds two signals*/
  final def +(lhs: Sig[T]):Sig[T] = Plus(this, lhs)
  /** Multiplies two signals*/
  final def *(lhs: Sig[T]):Sig[T] = Times(this, lhs)
  /** Substract two signals*/
  final def -(lhs: Sig[T]):Sig[T] = Minus(this, lhs)
  /** Hardware datatype (given as an instance of HW[T])*/
  final val hw = HW[T]
  final override inline def hashCode() = hash

/** Companion object of Sig */
object Sig:
  /** Conversion from vectors of bits to unsigned constants */
  given Conversion[Vec[F2], Const[Int]] = (v: Vec[F2]) => Const(v.toInt)(Unsigned(v.m))
  /** Additionnal operations for unsigned signals */
  extension [T](lhs: Sig[Int])
    /** Concatenation  */
    def ::(rhs: Sig[Int]): Sig[Int] = Concat(lhs, rhs)
    /** Binary and */
    def &(rhs: Sig[Int]): Sig[Int] = And(lhs, rhs)
    /** Binary xor */
    def ^(rhs: Sig[Int]): Sig[Int] = Xor(Vector(lhs, rhs))
    /** Reduction xor */
    def unary_^ : Sig[Int] = RedXor(lhs)
    /** Binary not */
    def unary_~ : Sig[Int] = Not(lhs)
    /** Scalar product (in F2) */
    infix def scalar(rhs: Sig[Int]): Sig[Int] = (lhs & rhs).unary_^
    /** Ternary operator */
    def ?(inputs: (Sig[T],Sig[T])): Sig[T] = Mux(lhs, Vector(inputs._2, inputs._1))
    /** Access a bit of the signal (tap) */
    def apply(i: Int): Sig[Int] = apply(i to i)
    /** Access a range of the bits of the signal (tap) */
    def apply(r: Range): Sig[Int] = Tap(lhs, r)

  /** Additionnal operations for complex signals */
  extension [T](lhs: Sig[Complex[T]])
    /** Real part */
    def re:Sig[T] = Re(lhs)
    /** Imaginary part */
    def im:Sig[T] = Im(lhs)

/** Signals without parent node */
abstract class Source[T: HW] extends Sig[T]:
  /** RTL component that corresponds to this node. */
  def implement: Component
  final override val parents = Seq()
  final override def implement(cp: (Sig[?], Int) => Component): Component = implement

/** Signals that, when implemented in RTL, expect parents that arrive at the same time*/
abstract class Operator[T: HW](operands: Sig[?]*) extends Sig[T]:
  /** Latency of the signal in cycles */
  def latency = 0
  /** Implementation of this signal (using RTL components)*/
  def implement(implicit cp: Sig[?] => Component): Component
  final override def parents:Seq[(Sig[?],Int)] = operands.map((_, latency))
  final override def implement(cp: (Sig[?], Int) => Component): Component = implement(sr => cp(sr, latency))
  final override val hash = Seq(this.getClass().getSimpleName, parents).hashCode()

/** Signal that represent an associative operator */
abstract class AssociativeSig[T](override val list: Seq[Sig[T]], val op: String)(using hw: HW[T] = list.head.hw) extends Operator(list: _*) with AssociativeNode[Sig[T]]

