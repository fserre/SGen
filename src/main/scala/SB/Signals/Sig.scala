/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
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

package SB.Signals

import RTL.Component
import SB.HW.{HW, Unsigned}
import SB.SB
import Utils.{AssociativeNode, AssociativeNodeCompanion, AssociativeNodeCompanionT}
import linalg.Fields.F2
import linalg._


/**
 * Class that represent a node in a streaming block internal graph. These nodes are comparable to RTL nodes, but abstract the hardware representation, and timing.
 * @param T Equivalent software datatype of the node
 */
abstract class Sig[T] {
  that =>
  def parents: Seq[(SigRef[_], Int)]

  val hw: HW[T]
  val sb: SB[_]
  //require(parents.forall(_.sb==sb))


  def pipeline = 0

  def precedence =0

  def implement(cp: (SigRef[_], Int) => Component): Component

  def toString(s: SigRef[_] => String):String = that.getClass.getSimpleName + parents.map(_._1).map(s).mkString("(", ", ", ")")


  final def toString(depth:Int):String=if(depth==0)
    this.ref.toString
  else
    toString(_.toString(depth-1))

  override def toString: String = toString(4)
  final def +(lhs: Sig[T]):Sig[T] = Plus(this, lhs)

  final def *(lhs: Sig[T]):Sig[T] = Times(this, lhs)

  final def -(lhs: Sig[T]):Sig[T] = Minus(this, lhs)

  final lazy val ref=SigRef[T](sb.ref(this),sb)

  def graphNode:Seq[String] = parents.map(p => p._1.graphName + " -> " + graphName + ";")

  def graphDeclaration:String = graphName + "[label=\"" + this.getClass.getSimpleName + "\"];"

  def graphName:String = "s" + ref.i
 // override val hashCode=Seq(that.getClass.getSimpleName,parents).hashCode()
}

object Sig {
  import scala.language.implicitConversions

  implicit def vecToConst(v: Vec[F2])(implicit sb:SB[_]): Sig[Int] = Const(v.toInt)(Unsigned(v.m),sb)

  implicit class SigIntOps(lhs: Sig[Int]) {
    def ::(rhs: Sig[Int]):Sig[Int] = Concat(rhs, lhs)

    def &(rhs: Sig[Int]):Sig[Int] = And(lhs, rhs)

    def ^(rhs: Sig[Int]):Sig[Int] = Xor(Vector(lhs, rhs))

    def unary_^():Sig[Int] = RedXor(lhs)

    def unary_~():Sig[Int] = Not(lhs)

    def scalar(rhs: Sig[Int]):Sig[Int] = (lhs & rhs).unary_^()

    //def ?[T](inputTrue: Sig[T], inputFalse: Sig[T]) = Mux(lhs, Vector(inputFalse, inputTrue))
    def ?[T](inputs: (Sig[T],Sig[T])):Sig[T] = Mux(lhs, Vector(inputs._2, inputs._1))

    def apply(i: Int): Sig[Int] = apply(i to i)

    def apply(r: Range): Sig[Int] = Tap(lhs, r)

  }
  implicit def sigToRef[T](sig:Sig[T]):SigRef[T]=sig.ref
  //implicit def sigToRef(sig:Sig[_]):SigRef[_]=sig.ref
}

case class SigRef[T](i:Int, sb:SB[_]){
  val sig:Sig[T]=sb.signal(i).asInstanceOf[Sig[T]]

  override def toString: String = "S"+i
}
object SigRef{
  import scala.language.implicitConversions

  implicit def refToSig[T](ref:SigRef[T]):Sig[T]=ref.sig
  //implicit def refToSig(ref:SigRef[_]):Sig[_]=ref.sig
}

abstract class AssociativeSig[T](val terms: Seq[SigRef[T]], op: String, override val precedence: Int)(implicit hw: HW[T] = terms.head.hw) extends Operator(terms: _*)(hw) with AssociativeNode[Sig[T]] {
  that =>
  override val list:Seq[Sig[T]]=terms.map(_.sig)
  override def equals(obj: Any): Boolean = obj match{
    case other:that.type => other.canEqual(that) && other.terms==terms
    case _ => false
  }

  override def graphDeclaration:String = graphName + "[label=\"" + op + "\"];"
  override def toString(s: SigRef[_] => String): String = terms.map(t=>if(t.precedence>=precedence)"("+s(t)+")" else s(t)).mkString(op)

  //override def toString: String = super[Sig].toString
  override val hashCode: Int = Seq(that.getClass.getSimpleName,terms).hashCode()
}

abstract class AssociativeSigCompanionT[U[T]<:Sig[T] with AssociativeSig[T]] extends AssociativeNodeCompanionT[Sig,U]
abstract class AssociativeSigCompanion[T,U<:Sig[T]  with AssociativeSig[T]](create:Seq[Sig[T]]=>Sig[T], simplify:(Sig[T],Sig[T])=>Either[Sig[T],(Sig[T],Sig[T])]= (lhs:Sig[T], rhs:Sig[T])=>Right(lhs,rhs)) extends AssociativeNodeCompanion[Sig[T],U](create,simplify)

abstract class Source[T](override val hw: HW[T], override val sb: SB[_]) extends Sig[T] {
  def implement: Component

  final override val parents = Seq()

  final override def implement(cp: (SigRef[_], Int) => Component): Component = implement
}

abstract class Operator[T](operands: SigRef[_]*)(implicit override val hw: HW[T]) extends Sig[T] {
  def latency = 0

  def implement(implicit cp: SigRef[_] => Component): Component

  final override def parents:Seq[(SigRef[_],Int)] = operands.map((_, latency))

  final override val sb: SB[_] = operands.head.sb

  final override def implement(cp: (SigRef[_], Int) => Component): Component = implement(sr => cp(sr, latency))
}