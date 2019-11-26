/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package RTL

abstract sealed class Component(val size: Int) {
  var description: String = ""

  //def +(rhs: Component) = Plus(this, rhs)

 // def +(rhs: Int) = Plus(this, Const(size, rhs))

//  def ?(choice: (Component, Component)) = Mux(this, Vector(choice._2, choice._1))

 // def ::(lhs: Component) = Concat(lhs, this)

 // def ===(rhs: Component) = Equals(this, rhs)

//  def ===(rhs: Int) = Equals(this, Const(size, rhs))

  def register = new Register(this)
}

class Const(override val size: Int, val value: BigInt) extends Component(size)
class Register(val input: Component) extends Component(input.size)
class Wire(override val size: Int) extends Component(size) {
  var _input: Option[Component] = None

  def input_=(comp: Component) = {
    assert(_input == None)
    assert(comp.size == size)
    _input = Some(comp)
  }

  def input = _input.get
}

object Wire {
  def apply(size: Int): Wire = new Wire(size)

  def unapply(arg: Wire): Option[Component] = Some(arg.input)
}

class Input(override val size: Int, val name: String) extends Component(size)
class Output(val input: Component, val name: String) extends Component(input.size)
class Plus(val terms: Seq[Component]) extends Component(terms.head.size)
class Minus(val lhs:Component,val rhs:Component) extends Component(lhs.size)

class Times(val lhs: Component, val rhs: Component) extends Component(lhs.size + rhs.size)
class And(val terms: Seq[Component]) extends Component(terms.head.size)
class Xor(val inputs: Seq[Component]) extends Component(inputs.head.size)
class Not(val input: Component) extends Component(1)
class Equals(val lhs: Component, val rhs: Component) extends Component(1)
class Mux(val address: Component, val inputs: Seq[Component]) extends Component(inputs.head.size)
class Concat(val inputs: Seq[Component]) extends Component(inputs.map(_.size).sum)
class Tap(val input: Component, val range: Range) extends Component(range.size)
class RAMWr(val wrAddress: Component, val input: Component) extends Component(input.size)
class RAMRd(val mem: RAMWr, val rdAddress: Component) extends Component(mem.size)