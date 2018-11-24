package RTL

abstract sealed class HW[T] {
  val size: Int
  def constToString(value:T):String
  def TtoBigInt(value:T):BigInt
  def BigInttoT(value:BigInt):T
}

object HW{
  implicit val defaultInt:HW[Int]=Unsigned(16)
  implicit val defaultDouble: HW[Double] = FxP(32, 0)
 //good: implicit val defaultDoubleFP: HW[Double] = FP(8, 23)
  //implicit val defaultDoubleFP: HW[Double] = FP(8, 21)
}

case class Unsigned(size: Int) extends HW[Int] {
  override def constToString(value: Int): String = size + "'" + "d" + value.abs.toString()
  //override def constToString[B >: Int](value: B): String = size + "'" + "d" + value.abs.toString()
  override def TtoBigInt(value: Int): BigInt = {
    require(value>=0)
    value
  }

  override def BigInttoT(value: BigInt): Int = {
    require(value>=0)
    value.toInt
  }
}

case class FxP(magnitude: Int, fractional: Int) extends HW[Double] {
  override val size = magnitude + fractional
  override def constToString(value: Double): String = (if (value < 0) "-" else "") + size + "'s" + "d" + (value*(1<<fractional)).abs.toLong.toString()
  //override def constToString[B >: Double](value: B): String = (if (value < 0) "-" else "") + size + "'s" + "d" + (value*(1<<fractional)).abs.toLong.toString()
  override def TtoBigInt(value: Double): BigInt = {
    val res:BigInt=(value*(1<<fractional)).toLong
    if(res<0)
      ((-res)+1)^((BigInt(1)<<size)-1)
    else
      res
  }

  override def BigInttoT(value: BigInt): Double = {
    require(value>=0)
    val res=if(value.testBit(size-1))
      (-((value+1)^((BigInt(1)<<size)-1))).toDouble
    else
      value.toDouble
    res/(1<<fractional)
  }
}
case class FP(wE: Int, wF: Int) extends HW[Double] {
  override val size = wE + wF + 3
  override def constToString(value: Double): String ={
    def printBin(value:Long,size:Int)={
      val res=value.toBinaryString
      "0"*(size-res.size)+res
    }
    val bits = java.lang.Double.doubleToLongBits(value)
    val biasDouble=(1<<(11-1))-1
    val negative = (bits & 0x8000000000000000L) != 0
    val vexponent = ((bits & 0x7ff0000000000000L) >> 52)-biasDouble
    val vmantissa = bits & 0x000fffffffffffffL

    val bias=(1<<(wE-1))-1
    val exponent=vexponent+bias
    val mantissa=vmantissa>>(52-wF)
    if(exponent<0)
      size+"'b"+"0"*size
      else
    size+"'b01"+(if(negative)"1" else "0")+printBin(exponent,wE)+printBin(mantissa,wF)
  }
  //(if (value < 0) "-" else "") + size + "'s" + "d" + (value*(1<<fractional)).abs.toLong.toString()
  val biasDouble=(1<<(11-1))-1
  val bias=(1<<(wE-1))-1
  override def TtoBigInt(value: Double): BigInt = {
    val bits = java.lang.Double.doubleToLongBits(value)

    val negative = (bits & 0x8000000000000000L) != 0
    val vexponent = ((bits & 0x7ff0000000000000L) >> 52)-biasDouble
    val vmantissa = bits & 0x000fffffffffffffL


    val exponent=vexponent+bias
    val mantissa=vmantissa>>(52-wF)
    if(exponent<0)
      0
    else
      //size+"'b01"+(if(negative)"1" else "0")+printBin(exponent,wE)+printBin(mantissa,wF)
    mantissa+(exponent<<wF)+(if(negative)(1L<<(wE+wF)) else 0)+(1L<<(wE+wF+1))
  }

  override def BigInttoT(value: BigInt): Double = {
    val negative=value.testBit(wE+wF)
    val vexponent=(value&((BigInt(1)<<(wE+wF))-1))>>wF
    val vmantissa=(value&((BigInt(1)<<wF)-1))

    val mantissa=(vmantissa<<(52-wF)).toLong
    val exponent=(vexponent-bias+biasDouble).toLong
    val res=java.lang.Double.longBitsToDouble((exponent<<52)+mantissa)
    if(value.testBit(wE+wF+1))
      if(negative)
        -res
      else
        res
    else
      0
  }
}


case class Complex[T](re: T, im: T) {
  def abs2(implicit num: Numeric[T]) = num.plus(num.times(re, re), num.times(im, im))
}

object Complex {

  implicit def ComplexIsFractional[T: Fractional]: Fractional[Complex[T]] = new Fractional[Complex[T]] {
    val num = implicitly[Fractional[T]]

    implicit def numT(lhs: T) = num.mkNumericOps(lhs)

    override def plus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re + y.re, x.im + y.im)

    override def toDouble(x: Complex[T]): Double = {
      assert(x.im == 0)
      x.re.toDouble()
    }

    override def toFloat(x: Complex[T]): Float = ???

    override def toInt(x: Complex[T]): Int = toDouble(x).toInt

    override def negate(x: Complex[T]): Complex[T] = Complex(-x.re, -x.im)

    override def fromInt(x: Int): Complex[T] = Complex[T](num.fromInt(x), num.zero)

    override def toLong(x: Complex[T]): Long = ???

    override def times(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re * y.re - x.im * y.im, x.re * y.im + x.im * y.re)

    override def minus(x: Complex[T], y: Complex[T]): Complex[T] = Complex(x.re - y.re, x.im - y.im)

    override def compare(x: Complex[T], y: Complex[T]): Int = ???

    override def div(x: Complex[T], y: Complex[T]): Complex[T] = Complex((x.re * y.re + x.im * y.im) / y.abs2, (x.im * y.re - x.re * y.im) / y.abs2)

    //override def abs(x: Complex[T]) = Complex[T](math.sqrt(x.re * x.re + x.im * x.im), 0)
  }

  //implicit def fromInt[T:Numeric](x: Int) = ComplexIsFractional[T].fromInt(x)

  implicit def numericOps[T: Fractional](lhs: Complex[T]) = ComplexIsFractional[T].mkNumericOps(lhs)
}


case class Cpx[T](elementType: HW[T]) extends HW[Complex[T]] {
  override val size = 2 * elementType.size

  override def constToString(value: Complex[T]): String = "{"+elementType.constToString(value.re)+","+elementType.constToString(value.im)+"}"

  override def TtoBigInt(value: Complex[T]): BigInt = (elementType.TtoBigInt(value.re)<<elementType.size)+elementType.TtoBigInt(value.im)

  override def BigInttoT(value: BigInt): Complex[T] = Complex(elementType.BigInttoT(value>>elementType.size),elementType.BigInttoT(value&((BigInt(1)<<elementType.size)-1)))
}

case class MkComplex[DT] private(re: Sig[DT], im: Sig[DT]) extends Sig()(Cpx(re.dt)) {
  assert(im.dt == re.dt)
  override val availableAt: Option[Instant] = Vector(re, im).availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = {" + re.name + "," + im.name + "};")
}

object MkComplex {
  def apply[DT](re: Sig[DT], im: Sig[DT]): Sig[Complex[DT]] = (re, im) match {
    case (Real(c1:Sig[Complex[DT]] @unchecked), Imaginary(c2)) if c1 == c2 => c1//.asInstanceOf[Signal[Complex[DT]]] //TODO: Fix!
    case (Const(value1), Const(value2)) if re.dt == im.dt => Const(Complex(value1, value2))(Cpx(re.dt))
    case _ => {
      val Vector(re2:Sig[DT] @unchecked, im2:Sig[DT] @unchecked) = Vector(re, im).synch
      new MkComplex(re2, im2)
    }
  }
}

case class Real[DT] private(input: Sig[Complex[DT]]) extends Sig()(input.dt.asInstanceOf[Cpx[DT]].elementType) {
  override val availableAt: Option[Instant] = input.availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + input.name + "[" + (input.busSize - 1) + ":" + busSize + "];")
}

object Real {
  def apply[DT](input: Sig[Complex[DT]]): Sig[DT] = input match {
    case MkComplex(re, _) => re
    case Const(value) => Const[DT](value.re)(input.dt.asInstanceOf[Cpx[DT]].elementType)
    case _ => new Real(input)
  }
}

case class Imaginary[DT] private(input: Sig[Complex[DT]]) extends  Sig()(input.dt.asInstanceOf[Cpx[DT]].elementType)  {
  override val availableAt: Option[Instant] = input.availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + input.name + "[" + (busSize - 1) + ":0];")
}

object Imaginary {
  def apply[DT](input: Sig[Complex[DT]]): Sig[DT] = input match {
      case MkComplex(_, im) => im
      case Const(value) => Const[DT](value.im)(input.dt.asInstanceOf[Cpx[DT]].elementType)
      case _ => new Imaginary(input)
    }
}



