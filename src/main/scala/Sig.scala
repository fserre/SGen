import rtl.{Component, Const, Plus}

import scala.collection.mutable
import scala.concurrent.{ExecutionContext, Future}
import scala.reflect.ClassTag
import scala.runtime.ScalaRunTime

trait Sig[T: HW] extends Product:
  val hw = HW[T]

  def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using ExecutionContext): Future[Seq[Component]]

  final override val hashCode: Int = scala.util.hashing.MurmurHash3.productHash(this)

trait Expandable[T] extends Sig[T] :
  protected def expand[U](inputs: Sig[T] => Seq[Sig[U]])(using Composite[T, U]): Seq[Sig[U]]
  protected def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using Unsigned, T =:= BigInt, ExecutionContext): Future[Seq[Component]]

  override final def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using ExecutionContext) = hw match
    case hw: Composite[T, u] =>
      type U = u
      val cache=mutable.HashMap[Sig[T], Seq[Sig[U]]]()
      def f(x: Sig[T]): Seq[Sig[U]] = cache.getOrElseUpdate(x, x.hw match
        case chw: Composite[T, U@unchecked] if chw.inner.ct == hw.inner.ct => x match
          case x: Expandable[T] => x.expand(f)(using chw)
          case _ =>
            case class PlaceHolder(pos: Int) extends Sig[U](using chw.inner):
              override def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using ExecutionContext) =
                x.implement(comp).map(res=>
                  val size = res.size / chw.arity
                  res.slice(pos * size, (pos + 1) * size)
                )
            Seq.tabulate(chw.arity)(i => PlaceHolder(i))
        case _ => throw Exception(s"$hw is not a composite leading to a ${hw.inner.ct}"))

      Future.sequence(expand(f)(using hw).map(_.implement(comp))).map(_.flatten)
    case hw: Unsigned => implement(comp)(using hw, summon, summon)


object Sig:
  /*extension (list: Seq[Sig[?]])
    def implement(using ExecutionContext) =
      val promises=mutable.HashMap[Sig[?],mutable.HashMap[Int,]]()*/



  extension[T, U] (lhs: Expandable[T])(using NumericHW[T, U])
    def +(rhs: Expandable[T]): Expandable[T] = ??? //Plus(lhs, rhs)

case class Const[T: HW](value: T) extends Expandable[T] :
  override protected def expand[U](inputs: Sig[T] => Seq[Sig[U]])(using hw: Composite[T, U]) = hw.const(value).map(Const(_)(hw.inner))
  override protected def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using Unsigned, T =:= BigInt, ExecutionContext) = Future.successful(Seq(rtl.Const(hw.bitSize, value)))

/*
case class Const[T:HW](value: T) extends Sig[T]:
  override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Const(hw.bitSize, value)

case class Input[T:HW](name: String) extends Sig[T] with Expandable[T] with Implementable[T]:
  override def expand (inputs: Sig[T] => Seq[Sig[U]])=hw.renameIO(name).map(Input(_)(hw.inner))

  override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Input(hw.bitSize, name)
*/
case class Plus[T: HW](lhs: Sig[T], rhs: Sig[T]) extends Sig[T] with Expandable[T] :
  override protected def expand[U](inputs: Sig[T] => Seq[Sig[U]])(using hw: Composite[T, U]) = hw.asInstanceOf[NumericHW[T, U]].plus(inputs(lhs), inputs(rhs))
  override protected def implement(comp: (Sig[?], Int) => Future[Seq[rtl.Component]])(using Unsigned, T =:= BigInt, ExecutionContext) =
      for
        lhs <- comp(lhs, 0)
        rhs <- comp(rhs, 0)
      yield
        for
          (lhs, rhs) <- lhs zip rhs
        yield
          rtl.Plus(Seq(lhs,rhs))
//override def implement(inputs: Sig[T] => rtl.Component)(using T =:= BigInt) = rtl.Plus(Seq(inputs(lhs), inputs(rhs)))
//override def expand (inputs: Sig[T] => Seq[Sig[U]])=hw.plus(inputs(lhs), inputs(rhs))
/*
object Plus:
  def apply[T:NumericHW](lhs: Sig[T], rhs:Sig[T]): Sig[T] = new Plus(lhs, rhs)

trait SPL[T](using HW[Seq[T]]) extends Sig[Seq[T]]


trait AcyclicSPL[T](using HW[Seq[T]]) extends SPL[T] with Expandable[Seq[T]]
*/
