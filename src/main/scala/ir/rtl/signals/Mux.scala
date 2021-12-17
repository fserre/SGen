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
import ir.rtl.hardwaretype.{ComplexHW, HW, Unsigned}
import linalg.Fields.Complex

/** Class representing a multiplexer signal */
case class Mux[U] private(address: Sig[Int], inputs: Seq[Sig[U]]) extends Operator[U](address +: inputs: _*)(using inputs.head.hw):
  /** Returns whether the multiplexer is a ROM */
  def isRom: Boolean = inputs.forall(_.isInstanceOf[Const[?]])

  override def changeParent(parentId: Int, newParent: Sig[_]): Sig[U] = parentId match
    case 0 => Mux(newParent.asInstanceOf[Sig[Int]], inputs)
    case _ => Mux(address, inputs.updated(parentId-1, newParent.asInstanceOf[Sig[U]]))

  override def implement(implicit cp: Sig[?] => Component): Component = ir.rtl.Mux(cp(address), inputs.map(cp))

  override val pipeline = 1

/** Companion object of the class Mux */
object Mux:
  def apply[U](address: Sig[Int], inputs: Seq[Sig[U]]): Sig[U] =
    require(inputs.nonEmpty)
    val head=inputs.head
    val hw = head.hw
    require(inputs.forall(_.hw == hw))
    if address.isInstanceOf[Const[Int]] then
      inputs(address.asInstanceOf[Const[Int]].value)
    else if inputs.forall(_ == head) then
      head
    // Following case may induce supplementary hardware in front of the node to implement the negation.
    // In case of FFTs, it reduces the number of multipliers used (triggers common subexpression elimination), and as butterflies come next, negation will be handled with no cost.
    else if inputs.forall {
      case Opposite(_) => true
      case Zero() => true
      case _ => false
    } then
      Opposite(Mux(address, inputs.map(i => Opposite(i))))
    else
      (0 until address.hw.size).find(pos => inputs.indices.forall(i =>  // search for a useless bit in address
        val j = i | (1 << pos)
        j >= inputs.size || inputs(i) == inputs(j)
        )) match
        case Some(pos) =>
          val control = address(pos + 1 until address.hw.size) :: address(0 until pos)
          Mux(control, inputs.indices.filter(i => (i & (1 << pos)) == 0).map(inputs(_)))
        case _ => hw match
          case ComplexHW(_) => Cpx(Mux(address, inputs.map(_.asInstanceOf[Sig[Complex[AnyRef]]].re)), Mux(address, inputs.map(_.asInstanceOf[Sig[Complex[AnyRef]]].im))).asInstanceOf[Sig[U]]
          case Unsigned(_) => (0 until hw.size).find(i =>  // search for a bit that is always the same across values
            val ref = inputs.head.asInstanceOf[Sig[Int]](i)
            inputs.forall(_.asInstanceOf[Sig[Int]](i) == ref)
            ) match
            case Some(pos) =>
              val part1 = Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](pos + 1 until hw.size)))
              val part2 = inputs.head.asInstanceOf[Sig[Int]](pos)
              val part3 = Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](0 until pos)))
              val res1 = part1 :: part2
              val res= res1:: part3
              res.asInstanceOf[Sig[U]]
            case _ =>
              if address.hw == hw && inputs.zipWithIndex.forall(i => i._1 == Const(i._2)(using address.hw)) then
                address.asInstanceOf[Sig[U]]
              else if address.hw == hw && inputs.zipWithIndex.forall(i => i._1 == Not(Const(i._2)(address.hw))) then
                Not(address).asInstanceOf[Sig[U]]
              else
                new Mux(address, inputs)
          case _ => new Mux(address, inputs)

/** Object that allows to create a ROM */
object ROM:
  def apply[U: HW](values: Seq[U], addr: Sig[Int]): Sig[U] =  Mux(addr, values.map(v => Const(v)))
  def unapply[U](arg:Sig[U]):Option[(Seq[U],Sig[Int])]=arg match
    case arg: Mux[U] if arg.isRom => Some(arg.inputs.map{case Const(value) => value.asInstanceOf[U]},arg.address)
    case _ => None

