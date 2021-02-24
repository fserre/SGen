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
package ir.rtl

/**
 * Class that represent a node on an RTL graph
 *
 * @param size Size of the node in bits
 * @param _parents Parent nodes
 */
abstract sealed class Component(val size: Int, _parents: Component*):
  /**
   * Parent nodes
   */
  def parents: Seq[Component] = _parents.toSeq

  /**
   * Returns a register node of the current node
   */
  final def register = Register(this)

  final def delay(cycles:Int) =
    require(cycles>=0)
    if cycles == 0 then
      this
    else
      Register(this, cycles)

abstract sealed class ImmutableComponent(size: Int, _parents: Component*) extends Component(size, _parents:_*):
  override val hashCode = (parents +: this.getClass.getSimpleName).hashCode()

final class Wire(override val size: Int) extends Component(size):
  var _input: Option[Component] = None

  def input_=(comp: Component): Unit = {
    assert(_input.isEmpty)
    assert(comp.size == size)
    _input = Some(comp)
  }

  def input: Component = _input.get

  override def parents = Seq(input)

  override val hashCode = Seq("Wire", size).hashCode()

  /**
   * Checks for equality. We only check for reference equality of the input to prevent endless loop in case of cycles within the graph.  
   */
  override def equals(that: Any) = that match
    case that:AnyRef => (this eq that) || (that match
      case that: Wire => that.input eq input
      case _ => false)
    case _ => false


object Wire :
  def apply(size: Int): Wire = new Wire(size)

  def unapply(arg: Wire): Option[Component] = Some(arg.input)



case class Const(override val size: Int, value: BigInt) extends ImmutableComponent(size):
  override val hashCode = value.hashCode()

case class Register(input: Component, cycles: Int = 1) extends Component(input.size, input):
  require(cycles>0, s"Wrong delay:$cycles")

case class Input(override val size: Int, name: String) extends ImmutableComponent(size):
  override val hashCode = name.hashCode()

case class Output(input: Component, name: String) extends ImmutableComponent(input.size, input)

case class Plus(terms: Seq[Component]) extends ImmutableComponent(terms.head.size, terms: _*)

case class Minus(lhs: Component, rhs: Component) extends ImmutableComponent(lhs.size, lhs, rhs)

case class Times(lhs: Component, rhs: Component) extends ImmutableComponent(lhs.size + rhs.size, lhs, rhs)

case class And(terms: Seq[Component]) extends ImmutableComponent(terms.head.size, terms: _*)

case class Xor(inputs: Seq[Component]) extends ImmutableComponent(inputs.head.size, inputs: _*)

case class Or(inputs: Seq[Component]) extends ImmutableComponent(inputs.head.size, inputs: _*)

case class Not(input: Component) extends ImmutableComponent(input.size, input)

case class Equals(lhs: Component, rhs: Component) extends ImmutableComponent(1, lhs, rhs)

case class Mux(address: Component, inputs: Seq[Component]) extends ImmutableComponent(inputs.head.size, address +: inputs: _*)

case class Concat(inputs: Seq[Component]) extends ImmutableComponent(inputs.map(_.size).sum, inputs: _*)

case class Tap(input: Component, range: Range) extends ImmutableComponent(range.size, input)

case class RAM(data: Component, wr: Component, rd: Component) extends ImmutableComponent(data.size, data, wr, rd)

case class Extern(override val size:Int, filename:String, module:String, outputName:String, inputs:(String,Component)*) extends ImmutableComponent(size,inputs.map(_._2):_*)

object ROM:
  def unapply(arg:Mux) =
    if arg.inputs.forall(_.isInstanceOf[Const]) then
      Some(arg.address,arg.inputs.map(_.asInstanceOf[Const].value))
    else
      None
