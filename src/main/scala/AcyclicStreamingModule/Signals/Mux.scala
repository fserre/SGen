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

package AcyclicStreamingModule.Signals

import RTL.Component
import AcyclicStreamingModule.HardwareType.{ComplexHW, HW, Unsigned}
import AcyclicStreamingModule.SB
import linalg.Fields.Complex

case class Mux[U] private(address: SigRef[Int], inputs: Seq[SigRef[U]]) extends Operator[U](address +: inputs: _*)(using inputs.head.hw) {
  def isRom: Boolean = inputs.forall(_.sig.isInstanceOf[Const[?]])
  override def implement(implicit cp: SigRef[?] => Component): Component = new RTL.Mux(cp(address), inputs.map(cp))

  override def graphDeclaration: String = if (isRom)
    graphName + "[label=\"<title>ROM (" + inputs.size + " × " + hw.size + " bits) |" + inputs.map(_.sig.asInstanceOf[Const[U]].value.toString).mkString("|") + "\",shape=record];"
  else
    super.graphDeclaration

  override def graphNode: Seq[String] = if (isRom) List(address.graphName + " -> " + graphName + ":title;") else super.graphNode
  override val pipeline = 1
}

object Mux {
  def apply[U](address: Sig[Int], inputs: Seq[Sig[U]]): Sig[U] = {
    require(inputs.nonEmpty)
    val head=inputs.head
    val hw = head.hw
    implicit val sb: SB[?] = address.sb
    require(inputs.forall(_.hw == hw))

    address match {
      case Const(value) => inputs(value)
      case _ => inputs match {
        case _ if inputs.forall(_==head) => head
        case Seq(Mux(adrl, Seq(ll, lr)), Mux(adrr, Seq(rl, rr))) if adrl.hw.size == 1 && address.hw.size == 1 && adrr == adrl => Mux(address :: adrr, Seq(ll, lr, rl, rr))

        case _ => (0 until address.hw.size).find(pos => inputs.indices.forall(i => { // search for a useless bit in address
          val j = i | (1 << pos)
          j >= inputs.size || inputs(i) == inputs(j)
        })) match {
          case Some(pos) =>
            val control = address(pos + 1 until address.hw.size) :: address(0 until pos)
            Mux(control, inputs.indices.filter(i => (i & (1 << pos)) == 0).map(inputs(_)))
          case _ => hw match {
            case ComplexHW(_) => Cpx(Mux(address, inputs.map(_.asInstanceOf[Sig[Complex[AnyRef]]].re)), Mux(address, inputs.map(_.asInstanceOf[Sig[Complex[AnyRef]]].im))).asInstanceOf[Sig[U]]
            case Unsigned(_) => (0 until hw.size).find(i => { // search for a bit that is always the same across values
              val ref = inputs.head.asInstanceOf[Sig[Int]](i)
              inputs.forall(_.asInstanceOf[Sig[Int]](i) == ref)
            }) match {
              case Some(pos) =>
                val part1 = Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](pos + 1 until hw.size)))
                val part2 = inputs.head.asInstanceOf[Sig[Int]](pos)
                val part3 = Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](0 until pos)))
                val res1 = part1 :: part2
                val res= res1:: part3
                res.asInstanceOf[Sig[U]]
              case _ => if (address.hw == hw && inputs.zipWithIndex.forall(i => i._1 == Const(i._2)(address.hw, sb)))
                address.asInstanceOf[Sig[U]]
              else if (address.hw == hw && inputs.zipWithIndex.forall(i => i._1 == Not(Const(i._2)(address.hw, sb))))
                Not(address).asInstanceOf[Sig[U]]
              else
                new Mux(address, inputs.map(_.ref))
            }
            case _ => new Mux(address, inputs.map(_.ref))
          }

        }
      }
    }
  }

  def unapply[U](arg: Sig[U]): Option[(Sig[Int], Seq[Sig[U]])] = arg match {
    case arg: Mux[U] => Some((arg.address.sig, arg.inputs.map(_.sig)))
    case _ => None
  }
}

object ROM {
  def apply[U](values: Seq[U], addr: Sig[Int])(implicit hw: HW[U], sb: SB[?]): Sig[U] =  Mux(addr, values.map(v => Const(v)))
}