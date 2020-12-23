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
package ir.rtl

/**
 * Class that represent a node on an ir.rtl graph
 *
 * @param size Size of the node in bits
 * @param _parents Parent nodes
 */
abstract sealed class Component(val size: Int, _parents: Component*) {
  /**
   * Parent nodes
   */
  def parents: Seq[Component] = _parents.toSeq
  /**
   * Node description
   */
  var description: String = ""
  /**
   * Returns a register node of the current node
   */
  def register = new Register(this)
}

class Const(override val size: Int, val value: BigInt) extends Component(size)
class Register(val input: Component) extends Component(input.size, input)
class Wire(override val size: Int) extends Component(size) {
  var _input: Option[Component] = None

  def input_=(comp: Component): Unit = {
    assert(_input.isEmpty)
    assert(comp.size == size)
    _input = Some(comp)
  }

  def input: Component = _input.get

  override def parents = Seq(input)
}

object Wire {
  def apply(size: Int): Wire = new Wire(size)

  def unapply(arg: Wire): Option[Component] = Some(arg.input)
}

class Input(override val size: Int, val name: String) extends Component(size)

class Output(val input: Component, val name: String) extends Component(input.size, input)

class Plus(val terms: Seq[Component]) extends Component(terms.head.size, terms: _*)

class Minus(val lhs: Component, val rhs: Component) extends Component(lhs.size, lhs, rhs)

class Times(val lhs: Component, val rhs: Component) extends Component(lhs.size + rhs.size, lhs, rhs)

class And(val terms: Seq[Component]) extends Component(terms.head.size, terms: _*)

class Xor(val inputs: Seq[Component]) extends Component(inputs.head.size, inputs: _*)

class Or(val inputs: Seq[Component]) extends Component(inputs.head.size, inputs: _*)

class Not(val input: Component) extends Component(input.size, input)

class Equals(val lhs: Component, val rhs: Component) extends Component(1, lhs, rhs)

class Mux(val address: Component, val inputs: Seq[Component]) extends Component(inputs.head.size, address +: inputs: _*)

class Concat(val inputs: Seq[Component]) extends Component(inputs.map(_.size).sum, inputs: _*)

class Tap(val input: Component, val range: Range) extends Component(range.size, input)

class RAMWr(val wrAddress: Component, val input: Component) extends Component(input.size, wrAddress, input)

class RAMRd(val mem: RAMWr, val rdAddress: Component) extends Component(mem.size, mem, rdAddress)

class Extern(size:Int, val filename:String, val module:String, val outputName:String, val inputs:(String,Component)*) extends Component(size,inputs.map(_._2):_*)