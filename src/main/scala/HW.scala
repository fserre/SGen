

trait HW[T]:
  type U
  val inner: HW[U]
  val bitSize: Int
  def const(v:T):Seq[U]
  def renameIO(name:String):Seq[String]
  def abstractionLevel:Int = inner.abstractionLevel+1

object HW:
  def apply[T](using hw:HW[T])=hw


trait NumericHW[T] extends HW[T]:
  override val inner: NumericHW[U]
  def plus(lhs:Seq[Sig[U]], rhs:Seq[Sig[U]]): Seq[Sig[U]]

object NumericHW:
  def apply[T](using hw:NumericHW[T])=hw


case class Unsigned(bitSize: Int) extends HW[BigInt] with NumericHW[BigInt]:
  final type U = BigInt
  override val inner = this
  def const(v:BigInt) = Seq(v)
  override def renameIO(name:String) = Seq(name)
  override def plus(lhs:Seq[Sig[U]], rhs:Seq[Sig[U]])=Seq(Plus(lhs.head, rhs.head)(using this))

  override val abstractionLevel = 0

case class FixedPoint(bitSize:Int, exponent: Int) extends HW[Double] with NumericHW[Double]:
  override type U = BigInt
  override val inner = Unsigned(bitSize)
  override def const(v: Double): Seq[BigInt] = Seq(if v<0 then
    (const(-v).head ^ ((BigInt(1) << bitSize) - 1)) + 1
  else
    ((BigInt(1)<<exponent).toDouble*BigDecimal(v)).toBigInt)
  override def renameIO(name:String) = Seq(name)
  override def plus(lhs:Seq[Sig[U]], rhs:Seq[Sig[U]])=Seq(Plus(lhs.head, rhs.head)(using inner))

case class TimedDataset[T:HW](t: Int,k: Int) extends HW[Seq[T]]:
  val K=1<<k
  override type U = T
  override val inner = HW[U]
  override val bitSize = K * inner.bitSize
  override def const(v: Seq[U]): Seq[U] = v
  override def renameIO(name:String) = Seq.tabulate(K)(i => s"${name}_$i")

