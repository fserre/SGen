import scala.reflect.ClassTag

trait HW[T:ClassTag]:
  val ct = summon[ClassTag[T]]
  def bitSize: Int

object HW:
  def apply[T](using hw:HW[T])=hw


trait Composite[T,U](using val inner: HW[U]) extends HW[T]:
  def arity:Int
  override val bitSize: Int = arity*inner.bitSize
  def const(v:T):Seq[U]
  def renameIO(name:String):Seq[String]


trait NumericHW[T,U] extends Composite[T,U]:
  def plus(lhs:Seq[Sig[U]], rhs:Seq[Sig[U]]): Seq[Sig[U]]

object NumericHW:
  def apply[T,U](using hw:NumericHW[T,U])=hw

case class Unsigned(bitSize: Int) extends HW[BigInt]

case class FixedPoint(mantissa:Int, exponent: Int) extends Composite[Double, BigInt](using Unsigned(mantissa)) with NumericHW[Double,BigInt]:
  override val arity = 1
  override def const(v: Double): Seq[BigInt] = Seq(if v<0 then
    (const(-v).head ^ ((BigInt(1) << bitSize) - 1)) + 1
  else
    ((BigInt(1)<<exponent).toDouble*BigDecimal(v)).toBigInt)
  override def renameIO(name:String) = Seq(name)
  override def plus(lhs:Seq[Sig[BigInt]], rhs:Seq[Sig[BigInt]])= Seq(Plus(lhs.head, rhs.head)(using inner))

case class TimedDataset[T:HW](t: Int,k: Int) extends Composite[Seq[T],T]:
  override val arity = 1 << k
  override def const(v: Seq[T]): Seq[T] = v
  override def renameIO(name:String) = Seq.tabulate(arity)(i => s"${name}_$i")

