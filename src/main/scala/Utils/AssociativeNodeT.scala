/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
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
      case (lhs@ev(_:U[T]), rhs@ev(_: U[T])) => apply(lhs.asInstanceOf[U[T]].list ++ rhs.asInstanceOf[U[T]].list)
      case (lhs, rhs@ev(_: U[T])) => apply(lhs +: rhs.asInstanceOf[U[T]].list)
      case (lhs@ev(_: U[T]), rhs) => {
        val (lhsl :+ lhsr) = lhs.asInstanceOf[U[T]].list
        simplify(lhsr, rhs) match {
          case Left(rhs) => apply(apply(lhsl), rhs)
          case Right((rhs1, rhs2)) => create(lhsl :+ rhs1 :+ rhs2)
        }
      }
      case _ => create(Seq(lhs, rhs))
    }
  }
  def apply[T](inputs: Seq[S[T]])(implicit ev:ClassTag[U[T]]): S[T] = {
    require(inputs.size>0)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))
  }

  def unapply[T](arg: U[T])(implicit ev:ClassTag[U[T]]): Option[Seq[S[T]]] = arg match {
    case arg@ev(_:U[T]) => Some(arg.asInstanceOf[U[T]].list)
    case _ => None
  }

}


trait AssociativeNode[S]  {that=>
  val list: Seq[S]

  override def toString: String = that.getClass.getSimpleName+"("+list.map(_.toString()).mkString(", ")+")"

  def canEqual(other:Any)=other.isInstanceOf[that.type]

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
      case (lhs@ev(_:U), rhs@ev(_: U)) => apply(lhs.asInstanceOf[U].list ++ rhs.asInstanceOf[U].list)
      case (lhs, rhs@ev(_: U)) => apply(lhs +: rhs.asInstanceOf[U].list)
      case (lhs@ev(_: U), rhs) => {
        val (lhsl :+ lhsr) = lhs.asInstanceOf[U].list
        simplify(lhsr, rhs) match {
          case Left(rhs) => apply(apply(lhsl), rhs)
          case Right((rhs1, rhs2)) => create(lhsl :+ rhs1 :+ rhs2)
        }
      }
      case _ => create(Seq(lhs, rhs))
    }
  }
  def apply(inputs: Seq[S])(implicit ev:ClassTag[U]): S = {
    require(inputs.size>0)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))
  }

  def unapply(arg: U)(implicit ev:ClassTag[U]): Option[Seq[S]] = arg match {
    case arg@ev(_:U) => Some(arg.asInstanceOf[U].list)
    case _ => None
  }

}
