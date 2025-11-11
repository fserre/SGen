/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
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
import ir.rtl.{AcyclicStreamingModule, Component}
import ir.rtl.hardwaretype.{HW, Unsigned}
import ir.AssociativeNodeCompanion
import maths.fields.{Complex, F2}
import maths.*
import maths.linalg.Vec

import scala.reflect.*

/**
 * Class that represent a node in an acyclic streaming module internal graph. These nodes are comparable to RTL components, but abstract the hardware numeric representation, and timing.
 * Signals should be immutable.
 * 
 * @tparam T Equivalent software datatype of the node. A context bound HW indicating how to translate a T to hardware must be provided.
 */
abstract class Sig[T: HW]:
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

  /** value for hashCode (hashCode cannot be simply overriden as a val). As signals are immutable, it is better to not have a recursive def for performance. */
  val hash: Int
  final override inline def hashCode() = hash
  
  

/** Companion object of Sig */
object Sig:
  /** Conversion from vectors of bits to unsigned constants */
  given Conversion[Vec[F2], Const[Int]] = (v: Vec[F2]) => Const(v.toInt)(using Unsigned(v.m))
  /** Additionnal operations for unsigned signals */
  extension [T](lhs: Sig[Int])
    /** Concatenation  */
    def ::(rhs: Sig[Int]): Sig[Int] = Concat(lhs, rhs)
    /** Binary and */
    def &(rhs: Sig[Int]): Sig[Int] = And(lhs, rhs)
    /** Binary xor */
    def ^(rhs: Sig[Int]): Sig[Int] = Xor(Vector(lhs, rhs))
    /** Reduction xor */
    private def unary_^ : Sig[Int] = RedXor(lhs)
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
    /** Swap real and imaginary parts */
    def swap:Sig[Complex[T]] = Cpx(lhs.im, lhs.re) 

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
  final override def implement(cp: (Sig[?], Int) => Component): Component = implement(using sr => cp(sr, latency))
  final override val hash = Seq(this.getClass().getSimpleName, parents).hashCode()

/** Signal that represent an associative operator */
abstract class AssociativeSig[T](override val list: Seq[Sig[T]], val op: String)(using hw: HW[T] = list.head.hw) extends Operator(list*) with AssociativeNode[Sig[T]]

