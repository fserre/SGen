package RTL

import RTL.Sig._
import scala.reflect._

class Const[T:HW] private (val value: BigInt) extends Sig()(implicitly[HW[T]]) {
  override val availableAt = None
  override def declaration(implicit nl: Netlist) = None

  override def name(implicit nl: Netlist) = dt.size + "'d" + value

  override def equals(obj: scala.Any): Boolean = obj match{
    case x:Const[_] => x.value==value && x.dt==dt
    case _ => false
  }

  override def hashCode(): Int = value.hashCode()

  override def toString: String = dt.BigInttoT(value).toString
}


object Const {
  def apply[T:HW](value: BigInt):Const[T]=new Const(value)
  def apply[T:HW](value:T):Const[T]=Const(implicitly[HW[T]].TtoBigInt(value))

//  private def unapply[T](arg: Const[T]): Option[BigInt] = Some(arg.value)
  def unapply[T](arg: Const[T]): Option[T] = Some(arg.dt.BigInttoT(arg.value))
  //def apply[K <: DataType](value: BigInt, size: Int): Const[K] = Const[K](value, implicitly[Simple[K]].withSize(size))

}

object Empty{
  //def apply[DT <: DataType ](implicit num: Numeric[Signal[DT]]): Signal[DT] = num.zero

  def unapply(arg: Sig[_]) = arg.dt.size==0
}

object Zero{
  def apply[T:Numeric:HW]()=Const(implicitly[Numeric[T]].zero)
  def unapply[T:Numeric](arg: Sig[T]): Boolean = {
    arg match{
      case Const(x) => implicitly[Numeric[T]].zero==x
      case _=> false
    }
  }
}
object One{
  def apply[T:Numeric:HW]()=Const(implicitly[Numeric[T]].one)
  def unapply[T:Numeric](arg: Sig[T]): Boolean = {
    arg match{
      case Const(x) => implicitly[Numeric[T]].one==x
      case _=> false
    }
  }
}
object MinusOne{
  def apply[T:Numeric:HW]()=Const(implicitly[Numeric[T]].one)
  def unapply[T:Numeric](arg: Sig[T]): Boolean = {
    val num=implicitly[Numeric[T]]
    arg match{
      case Const(x) => num.fromInt(-1)==x
      case _=> false
    }
  }
}

case class Input[T:HW](value: String, tl:Timeline) extends Sig()(implicitly[HW[T]]) {
  override val availableAt = Some(Instant(tl, 0))

  override def declaration(implicit nl: Netlist) = None

  override def name(implicit nl: Netlist) = value
}

case class Output[T](value: String, input: Sig[T]) extends Sig()(input.dt) {
  override val availableAt = input.availableAt

  override def declaration(implicit nl: Netlist) = None

  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + input.name + ";")

  override def name(implicit nl: Netlist) = value
}

class Register[T] private(val input: Sig[T], val reset: Boolean) extends Sig()(input.dt) {
  override val availableAt = input.availableAt.map(_+1)

  override def declaration(implicit nl: Netlist) = Some("reg " + (if (dt.isInstanceOf[FxP]) "signed " else "") + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
    //println(availableAt)
    if (reset) {
      nl.addSeq("if(reset)")
      nl.addSeq("  " + name + " <= 0;")
      nl.addSeq("else")
      nl.addSeq("  " + name + " <= " + input.name + ";")
    }
    else
      nl.addSeq(name + " <= " + input.name + ";")
  }

  override def equals(obj: scala.Any): Boolean = obj match{
    case x:Register[T] => x.input==input && x.reset==reset
    case _ => false
  }

  override def toString: String = "R("+input+")"
  override def hashCode(): Int = input.hashCode()
}

object Register{
  def apply[T](input: Sig[T], reset: Boolean = false) = input match {
    case _: Const[T] => input
    case _ => new Register(input, reset)
  }

  def unapply[T](arg: Register[T]): Option[Sig[T]] = arg match {
    case x: Register[T] => if(x.reset) None else Some(x.input)
    case _ => None
  }
}

case class ReSynch[T](input: Sig[T], instant: Instant) extends Sig()(input.dt) {
  override val availableAt = Some(instant)

  override def declaration(implicit nl: Netlist): Option[String] = None

  override def name(implicit nl: Netlist): String =input.name
}

case class Cast[T:HW] private (input: Sig[_]) extends Sig()(implicitly[HW[T]]) {
  override val availableAt = input.availableAt

  override def declaration(implicit nl: Netlist): Option[String] = None

  override def name(implicit nl: Netlist): String =input.name
}
object Cast{
  def apply[T:HW](input: Sig[_]): Sig[T] = {
    require(input.dt.size==implicitly[HW[T]].size)
    input match {
      case v:Const[_] => Const[T](v.value)
      case Cast(input) => Cast[T](input)
      case _ if input.dt==implicitly[HW[T]] => input.asInstanceOf[Sig[T]]
      case _ => new Cast[T](input)
    }
  }
}
class LoopSig[T](model: Sig[T]) extends Sig()(model.dt) {
  private var input: Option[Sig[T]] = None

  def setInput(input: Sig[T]) = {
    assert(this.input == None)
    this.input = Some(input)
  }
  override val availableAt = model.availableAt

  override def declaration(implicit nl: Netlist): Option[String] = None

  override def name(implicit nl: Netlist): String = input.get.name
}
case class FloatingDelay[T](input: Sig[T], instant: Instant) extends Sig()(input.dt) {
  override val availableAt = Some(instant)
  override def implement(implicit nl: Netlist) = nl.addFloatindDelay(this)
}
/*
case class Probe(val input: Signal[HW], duration: Int, probeName: String = "Probe") extends Signal(input.dt) {
  override def implement(implicit nl: Netlist) = {
    nl.addComb("assign " + name + " = " + input.name + ";")
    nl.addComb("always @(posedge " + availableAt.get.name + ")")
    nl.addComb("  begin")
    (0 until duration).foreach(i => {
      nl.addComb("    #1;$display(\"" + probeName + " @" + i + ": %d\"," + name + ");")
      nl.addComb("    @(posedge clk);")
    })
    nl.addComb("  end")

  }
  override val availableAt = input.availableAt
}
*/