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

package ir

import scala.reflect._

/**
 * Trait that represents a node in a graph that is associative on its parents.
 * 
 * @tparam S Node type
 */
trait AssociativeNode[S]: 
  /** parent nodes */
  val list: Seq[S]

  override def toString: String = getClass.getSimpleName+"("+list.map(_.toString()).mkString(", ")+")"

/**
 * Class that companion objects of associative nodes should extend.
 * 
 * @param create Function that creates a node U from a seq of S 
 * @tparam S type of the nodes
 * @tparam U type of this node
 */
abstract class AssociativeNodeCompanion[S,U <: S & AssociativeNode[S]: ClassTag](create:Seq[S]=>U):
  /**
   * Simplify, if possible a pair of parents 
   */
  def simplify(lhs: S, rhs: S): Option[S] = None

  /**
   * Constructs a new simplified node 
   */
  final def apply(lhs: S, rhs: S): S = (lhs, rhs) match
    case (_, rhs: U) => apply(lhs +: rhs.list)
    case (lhs: U, _) =>
      val lhsl :+ lhsr = lhs.list
      simplify(lhsr, rhs) match
        case Some(rhs) => apply(if lhsl.size == 1 then lhsl.head else create(lhsl), rhs)
        case None => create(lhs.list :+ rhs)
        case _ => simplify(lhs, rhs) match
          case Some(res) => res
          case None => create(Seq(lhs, rhs))

  /**
   * Constructs a new simplified node 
   */
  final def apply(inputs: Seq[S]): S =
    require(inputs.nonEmpty)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))

  final def unapply(arg: U): Option[Seq[S]] = Some(arg.list)



/**
 * Class that companion objects of associative nodes with dependent type should extend.
 *
 * @param create Function that creates a node U from a seq of S 
 * @tparam S type of the nodes
 * @tparam U type of this node
 *           
 */
abstract class AssociativeNodeCompanionT[S[_],U[T] <: S[T] & AssociativeNode[S[T]]] (create:[T]=>Seq[S[T]]=>U[T]):
  /**
   * Simplify, if possible a pair of parents 
   */
  def simplify[T](lhs: S[T], rhs: S[T]): Option[S[T]] = None

  /**
   * Constructs a new simplified node 
   */
  final def apply[T](lhs: S[T], rhs: S[T])(using ev:ClassTag[U[T]]): S[T] = (lhs, rhs) match
    case (_, ev(rhs)) => apply(lhs +: rhs.list)
    case (ev(lhs), _) =>
      val lhsl :+ lhsr = lhs.list
      simplify(lhsr, rhs) match
        case Some(rhs) => apply(if lhsl.size == 1 then lhsl.head else create(lhsl), rhs)
        case None => create(lhs.list :+ rhs) 
    case _ => simplify(lhs, rhs) match
      case Some(res) => res
      case None => create(Seq(lhs, rhs))

  /**
   * Constructs a new simplified node 
   */
  def apply[T](inputs: Seq[S[T]])(using ClassTag[U[T]]): S[T] =
    require(inputs.nonEmpty)
    inputs.reduceLeft((lhs, rhs) => apply(lhs, rhs))

  def unapply[T](arg: U[T]): Option[Seq[S[T]]] = Some(arg.list)

