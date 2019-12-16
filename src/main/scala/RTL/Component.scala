/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package RTL

/**
 * Class that represent a node on an RTL graph
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

  def input_=(comp: Component) = {
    assert(_input == None)
    assert(comp.size == size)
    _input = Some(comp)
  }

  def input = _input.get

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