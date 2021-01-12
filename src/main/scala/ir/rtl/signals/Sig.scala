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
import ir.rtl.{Component, SB}
import ir.rtl.hardwaretype.{HW, Unsigned}
import ir.AssociativeNodeCompanion
import linalg.Fields.{Complex, F2}
import linalg._


/**
 * Class that represent a node in a streaming block internal graph. These nodes are comparable to RTL components, but abstract the hardware representation, and timing.
 * @tparam T Equivalent software datatype of the node
 */
abstract class Sig[T] { that =>
  val hash:Int
  
  final override inline def hashCode() = hash
  
  /// Parent signals of the node (each given as a pair: Sig and number of cycles of advance this parent must have compared to this signal).  
  def parents: Seq[(Sig[?], Int)]

  /// Hardware datatype (given as an instance of HW[T])
  val hw: HW[T]

  /// Number of registers that should be put after this signal.
  def pipeline = 0

  // def precedence =0

  /// Implementation of this signal (using RTL components)
  def implement(cp: (Sig[?], Int) => Component): Component

  /*def toString(s: Sig[_] => String):String = that.getClass.getSimpleName + parents.map(_._1).map(s).mkString("(", ", ", ")")

  final def toString(depth:Int):String=if(depth==0)
    this.ref.toString
  else
    toString((s:Sig[_])=>s.ref.toString(depth-1))

  override def toString: String = toString(4)*/

  /// Adds two signals
  final def +(lhs: Sig[T]):Sig[T] = Plus(this, lhs)

  /// Multiplies two signals
  final def *(lhs: Sig[T]):Sig[T] = Times(this, lhs)

  /// Substract two signals
  final def -(lhs: Sig[T]):Sig[T] = Minus(this, lhs)

  // TODO: Move these to DOT backend
  def graphNode:Seq[String] = parents.map(p => p._1.graphName + " -> " + graphName + ";")

  // TODO: Move these to DOT backend
  def graphDeclaration:String = graphName + "[label=\"" + this.getClass.getSimpleName + "\"];"

  // TODO: Move these to DOT backend
  lazy val graphName:String = 
    Sig.dotNumber+=1
    "s" + Sig.dotNumber
}

object Sig {
  import scala.language.implicitConversions

  implicit def vecToConst(v: Vec[F2]): Sig[Int] = Const(v.toInt)(Unsigned(v.m))

  var dotNumber = 0
  
  extension [T](lhs: Sig[Int]) {
    def ::(rhs: Sig[Int]):Sig[Int] = Concat(lhs, rhs)

    def &(rhs: Sig[Int]):Sig[Int] = And(lhs, rhs)

    def ^(rhs: Sig[Int]):Sig[Int] = Xor(Vector(lhs, rhs))

    def unary_^ : Sig[Int] = RedXor(lhs)

    def unary_~ : Sig[Int] = Not(lhs)

    infix def scalar(rhs: Sig[Int]):Sig[Int] = (lhs & rhs).unary_^

    def ?(inputs: (Sig[T],Sig[T])):Sig[T] = Mux(lhs, Vector(inputs._2, inputs._1))

    def apply(i: Int): Sig[Int] = apply(i to i)

    def apply(r: Range): Sig[Int] = Tap(lhs, r)
  }

  extension [T](lhs: Sig[Complex[T]]) {
    def re:Sig[T] = Re(lhs)
    def im:Sig[T] = Im(lhs)
  }

  
}

abstract class AssociativeSig[T](override val list: Seq[Sig[T]], op: String)(implicit hw: HW[T] = list.head.hw) extends Operator(list: _*)(hw) with AssociativeNode[Sig[T]] { that =>
  //override val list:Seq[Sig[T]]=terms

  override def graphDeclaration:String = graphName + "[label=\"" + op + "\"];"

  //override def toString(s: Sig[_] => String): String = terms.map(t=>if(t.precedence>=precedence)"("+s(t)+")" else s(t)).mkString(op)


}

abstract class AssociativeSigCompanionT[U[T]<:Sig[T] & AssociativeSig[T]] extends AssociativeNodeCompanionT[Sig,U]

abstract class AssociativeSigCompanion[T,U<:Sig[T]  & AssociativeSig[T]](create:Seq[Sig[T]]=>Sig[T], simplify:(Sig[T],Sig[T])=>Either[Sig[T],(Sig[T],Sig[T])]= (lhs:Sig[T], rhs:Sig[T])=>Right(lhs,rhs)) extends AssociativeNodeCompanion[Sig[T],U](create,simplify)

abstract class Source[T](override val hw: HW[T]) extends Sig[T] {
  def implement: Component

  final override val parents = Seq()

  final override def implement(cp: (Sig[?], Int) => Component): Component = implement
}

abstract class Operator[T](operands: Sig[?]*)(implicit override val hw: HW[T]) extends Sig[T] {
  def latency = 0

  def implement(implicit cp: Sig[?] => Component): Component

  final override def parents:Seq[(Sig[?],Int)] = operands.map((_, latency))

  final override def implement(cp: (Sig[?], Int) => Component): Component = implement(sr => cp(sr, latency))

  final override val hash = Seq(this.getClass().getSimpleName, parents).hashCode()
}