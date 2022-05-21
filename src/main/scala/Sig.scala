import rtl.{Const, Plus}

trait Sig[T:HW]:
  val hw = HW[T]


trait Expandable[T] extends Sig[T]:
  type U = hw.U
  def expand(inputs: Sig[T] => Seq[Sig[U]]):Seq[Sig[U]]


trait Implementable[T] extends Sig[T]:
  def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt): rtl.Component

object Sig:
  extension[T:NumericHW](lhs:Sig[T])
    def +(rhs:Sig[T]):Sig[T]=Plus(lhs, rhs)

case class Const[T:HW](value: T) extends Sig[T] with Expandable[T] with Implementable[T]:
  override def expand (inputs: Sig[T] => Seq[Sig[U]])=hw.const(value).map(Const(_)(hw.inner))

  override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Const(hw.bitSize, value)

case class Input[T:HW](name: String) extends Sig[T] with Expandable[T] with Implementable[T]:
  override def expand (inputs: Sig[T] => Seq[Sig[U]])=hw.renameIO(name).map(Input(_)(hw.inner))

  override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Input(hw.bitSize, name)

case class Plus[T] private (lhs: Sig[T], rhs:Sig[T])(using override val hw: NumericHW[T]) extends Sig[T] with Expandable[T] with Implementable[T]:
  override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Plus(Seq(inputs(lhs), inputs(rhs)))
  override def expand (inputs: Sig[T] => Seq[Sig[U]])=hw.plus(inputs(lhs), inputs(rhs))

object Plus:
  def apply[T:NumericHW](lhs: Sig[T], rhs:Sig[T]): Sig[T] = new Plus(lhs, rhs)

trait SPL[T](using HW[Seq[T]]) extends Sig[Seq[T]]


trait AcyclicSPL[T](using HW[Seq[T]]) extends SPL[T] with Expandable[Seq[T]]
