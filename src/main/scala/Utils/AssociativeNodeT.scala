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

package Utils
import scala.reflect._

/*trait AssociativeNodeT[T,S[_]]  {that=>
  val list: Seq[S[T]]

  override def toString: String = that.getClass.getSimpleName+"("+list.map(_.toString()).mkString(", ")+")"

  def canEqual(other:Any)=other.isInstanceOf[that.type]

  override def equals(obj: Any): Boolean = obj match{
    case other:that.type => other.canEqual(that) && other.list==list
    case _ => false
  }

  override val hashCode: Int = Seq(that.getClass.getSimpleName,list).hashCode()
}*/

abstract class AssociativeNodeCompanionT[S[_],U[T] <: S[T] with AssociativeNode[S[T]]] {
  def create[T](inputs: Seq[S[T]]): S[T]

  def simplify[T](lhs: S[T], rhs: S[T]): Either[S[T], (S[T], S[T])] = Right((lhs,rhs))

  def apply[T](lhs: S[T], rhs: S[T])(implicit ev:ClassTag[U[T]]): S[T] = simplify(lhs, rhs) match {
    case Left(simple) => simple
    case Right((lhs, rhs)) => (lhs, rhs) match {
      case (ev(lhs), ev(rhs)) => apply(lhs.list ++ rhs.list)
      case (lhs, ev(rhs)) => apply(lhs +: rhs.list)
      case (ev(lhs), rhs) =>
        val lhsl :+ lhsr = lhs.list
        simplify(lhsr, rhs) match {
          case Left(rhs) => apply(apply(lhsl), rhs)
          case Right((rhs1, rhs2)) => create(lhsl :+ rhs1 :+ rhs2)
        }
      case _ => create(Seq(lhs, rhs))
    }
  }
  def apply[T](inputs: Seq[S[T]])(implicit ev:ClassTag[U[T]]): S[T] = {
    require(inputs.nonEmpty)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))
  }

  def unapply[T](arg: U[T])(implicit ev:ClassTag[U[T]]): Option[Seq[S[T]]] = arg match {
    case ev(arg) => Some(arg.list)
    case _ => None
  }

}


trait AssociativeNode[S]  {that=>
  val list: Seq[S]

  override def toString: String = that.getClass.getSimpleName+"("+list.map(_.toString()).mkString(", ")+")"

  def canEqual(other:Any): Boolean =other.isInstanceOf[that.type]

  override def equals(obj: Any): Boolean = obj match{
    case other:that.type => other.canEqual(that) && other.list==list
    case _ => false
  }

  override val hashCode: Int = Seq(that.getClass.getSimpleName,list).hashCode()
}

abstract class AssociativeNodeCompanion[S,U <: S with AssociativeNode[S]](create:Seq[S]=>S,simplify:(S,S)=>Either[S,(S,S)]=(lhs:S,rhs:S)=>Right(lhs,rhs)) {
  def apply(lhs: S, rhs: S)(implicit ev:ClassTag[U]): S = simplify(lhs, rhs) match {
    case Left(simple) => simple
    case Right((lhs, rhs)) => (lhs, rhs) match {
      case (ev(lhs), ev(rhs)) => apply(lhs.list ++ rhs.list)
      case (lhs, ev(rhs)) => apply(lhs +: rhs.list)
      case (ev(lhs), rhs) =>
        val lhsl :+ lhsr = lhs.list
        simplify(lhsr, rhs) match {
          case Left(rhs) => apply(apply(lhsl), rhs)
          case Right((rhs1, rhs2)) => create(lhsl :+ rhs1 :+ rhs2)
        }
      case _ => create(Seq(lhs, rhs))
    }
  }
  def apply(inputs: Seq[S])(implicit ev:ClassTag[U]): S = {
    require(inputs.nonEmpty)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))
  }

  def unapply(arg: U)(implicit ev:ClassTag[U]): Option[Seq[S]] = arg match {
    case ev(arg) => Some(arg.list)
    case _ => None
  }

}
