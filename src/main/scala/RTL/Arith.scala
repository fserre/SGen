package RTL

import RTL.Sig._

case class Plus[T: Numeric] private(lhs: Sig[T], rhs: Sig[T]) extends Sig()(lhs.dt) {
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt

  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + lhs.name + " + " + rhs.name + ";")
}

case class PlusFP private(lhs: Sig[Double], rhs: Sig[Double]) extends Sig()(lhs.dt) {
  require(lhs.dt == FP(8, 23))
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt.map(_ + 11)

  override def implement(implicit nl: Netlist) = nl.addComb("add fpadd" + name + "(.clk(clk), .rst(reset), .X(" + lhs.name + "), .Y(" + rhs.name + "), .R(" + name + "));")
}

object Plus {
  def apply[T: Numeric](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    require(lhs.dt == rhs.dt, lhs.dt + ":" + rhs.dt)
    implicit val rType = lhs.dt
    (lhs, rhs) match {
      case (_, Zero()) => lhs
      case (Zero(), _) => rhs
      case (_, Opposite(rhs)) => lhs - rhs
      case (lhs@Sig(FP(8, 23)), rhs@Sig(FP(8, 23))) =>
        val Vector(lhs2: Sig[Double]@unchecked, rhs2: Sig[Double]@unchecked) = Vector(lhs, rhs).synch
        PlusFP(lhs2.register, rhs2.register).register
      case _ =>
        val Vector(lhs2: Sig[T]@unchecked, rhs2: Sig[T]@unchecked) = Vector(lhs, rhs).synch
        //new Plus(lhs2, rhs2).register
        new Plus(lhs2, rhs2).register.register
    }
  }
}

case class Minus[T: Numeric] private(lhs: Sig[T], rhs: Sig[T]) extends Sig()(lhs.dt) {
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt

  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + lhs.name + " - " + rhs.name + ";")
}

case class MinusFP private(lhs: Sig[Double], rhs: Sig[Double]) extends Sig()(lhs.dt) {
  require(lhs.dt == FP(8, 23))
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt.map(_ + 11)

  override def implement(implicit nl: Netlist) = nl.addComb("diff fpsub" + name + "(.clk(clk), .rst(reset), .X(" + lhs.name + "), .Y(" + rhs.name + "), .R(" + name + "));")
}

object Minus {
  def apply[T: Numeric](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    require(lhs.dt == rhs.dt, lhs.dt + ":" + rhs.dt)
    implicit val rType = lhs.dt
    (lhs, rhs) match {
      case (_, Zero()) => lhs
      case (_, Opposite(negRhs)) => lhs + negRhs
      case (lhs@Sig(FP(8, 23)), rhs@Sig(FP(8, 23))) =>
        val Vector(lhs2: Sig[Double]@unchecked, rhs2: Sig[Double]@unchecked) = Vector(lhs, rhs).synch
        MinusFP(lhs2.register, rhs2.register).register
      case _ => {
        val Vector(lhs2: Sig[T]@unchecked, rhs2: Sig[T]@unchecked) = Vector(lhs, rhs).synch
        //new Minus(lhs2, rhs2).register
        new Minus(lhs2, rhs2).register.register
      }
    }
  }
}

object Opposite {
  def unapply[T: Numeric](arg: Sig[T]): Option[Sig[T]] = {
    val num = implicitly[Numeric[T]]
    implicit val rType = arg.dt
    arg match {
      case Const(value) if num.lteq(value, num.zero) => Some(Const(num.negate(value)))
      case ROM(values, addr, block) if values.forall(v => num.lteq(v, num.zero)) => Some(ROM(values, addr, block))
      case Mux(addr, values) if values.forall(v => Opposite.unapply(v).nonEmpty) => Some(Mux(addr, values.map(v => Opposite.unapply(v).get)))
      case Minus(Zero(), rhs) => Some(rhs)
      case MinusFP(Zero(), rhs) => Some(rhs)
      case Register(input) => Opposite.unapply(input)
      case _ => None
    }
  }
}

object ForceOpposite {
  def unapply[T: Numeric](arg: Sig[T]): Option[Sig[T]] = {
    val num = implicitly[Numeric[T]]
    implicit val rType = arg.dt
    arg match {
      case Const(value) => Some(Const(num.negate(value)))
      case ROM(values, addr, block) => Some(ROM(values, addr, block))
      case Mux(addr, values) => Some(Mux(addr, values.map(v => Opposite.unapply(v).get)))
      case Minus(lhs, rhs) => Some(rhs - lhs)
      case MinusFP(lhs, rhs) => Some(rhs - lhs)
      case Register(input) => Opposite.unapply(input)
      case _ => None
    }
  }
}

case class Mul private(lhs: Sig[Double], rhs: Sig[Double], _dt: FxP) extends Sig()(_dt) {
  require(lhs.dt.isInstanceOf[FxP])
  require(rhs.dt.isInstanceOf[FxP])

  //(FxP(lhs.dt.magnitude + rhs.dt.magnitude, lhs.dt.fractional + rhs.dt.fractional)) {
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt

  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = $signed(" + lhs.name + ") * $signed(" + rhs.name + ");")
}

case class MulFP private(lhs: Sig[Double], rhs: Sig[Double]) extends Sig()(lhs.dt) {
  require(lhs.dt == FP(8, 23))
  override val availableAt: Option[Instant] = Vector(lhs, rhs).availableAt.map(_ + 5)

  override def implement(implicit nl: Netlist) = nl.addComb("mult fpmul_" + name + "(.clk(clk), .rst(reset), .X(" + lhs.name + "), .Y(" + rhs.name + "), .R(" + name + "));")
}

object Mul {
  private def apply(lhs: Sig[Double], rhs: Sig[Double], dt: FxP) = new Mul(lhs, rhs, dt)

  def apply[T: Numeric](lhs: Sig[T], rhs: Sig[T]): Sig[T] = {
    implicit val rType = lhs.dt
    //implicit def ops(lhs: T) = implicitly[Numeric[T]].mkNumericOps(lhs)
    val num = implicitly[Numeric[T]]
    (lhs, rhs) match {
      case (Const(value1), Const(value2)) => Const(num.times(value1, value2))
      case (_, Zero()) => Zero()
      case (Zero(), _) => Zero()
      case (_, One()) => lhs
      case (One(), _) if lhs.dt == rhs.dt => rhs
      case (_, MinusOne()) => -lhs
      case (MinusOne(), _) if lhs.dt == rhs.dt => -rhs
      case (_, ROM(values, addr, _)) if values.forall(v => v == num.zero || v == num.one || v == num.fromInt(-1)) => Mux(addr, values.map(v => lhs * Const(v)(lhs.dt)))
      case (Opposite(lhs), Opposite(rhs)) => lhs * rhs
      case (lhs@Sig(FP(8, 23)), rhs@Sig(FP(8, 23))) => {
        val Vector(lhs2: Sig[Double]@unchecked, rhs2: Sig[Double]@unchecked) = Vector(lhs, rhs).synch
        MulFP(lhs2.register, rhs2.register).register
      }
      case (lhs@Sig(FxP(ml, fl)), rhs@Sig(FxP(mr, fr))) => {
        val synch = Vector(lhs, rhs).synch.asInstanceOf[Vector[Sig[Double]]]
        val dt = FxP(ml + mr, fl + fr)
        //Tap(Mul(synch(0), synch(1), dt), lhs.dt.asInstanceOf[FxP]).delay(3)
        Tap(Mul(synch(0), synch(1), dt), lhs.dt.asInstanceOf[FxP]).delay(5)
      }
      case _ => {
        println(lhs.dt)
        println(rhs.dt)
        ???
      }
    }
  }
}
