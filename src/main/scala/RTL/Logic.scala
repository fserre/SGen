package RTL


case class Xor private(lhs: Sig[Int], rhs: Sig[Int]) extends Sig()(lhs.dt) {
  override val availableAt: Option[Instant] = Vector(lhs,rhs).availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + lhs.name+" ^ "+rhs.name + ";")
}

object Xor {
  def apply(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = {
    require(lhs.dt==rhs.dt)
    implicit val rType=lhs.dt
    (lhs, rhs) match {
      case (Const(value1), Const(value2)) => Const(value1 ^ value2)
      case (_, Zero()) => lhs
      case (Zero(), _) => rhs
      case (Const(_), _) => new Xor(lhs, rhs)
      case (_, Const(_)) => new Xor(lhs, rhs)
      case _ =>
        val Vector(lhs2: Sig[Int] @unchecked, rhs2: Sig[Int] @unchecked) = Vector(lhs, rhs).synch
        new Xor(lhs2, rhs2).delay(1)
    }
  }
}

case class And private(lhs: Sig[Int], rhs: Sig[Int]) extends Sig()(lhs.dt) {
  override val availableAt: Option[Instant] = Vector(lhs,rhs).availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + lhs.name+" & "+rhs.name + ";")
}

object And{
  def apply(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = {
    require(lhs.dt==rhs.dt)
    require(lhs.dt.isInstanceOf[Unsigned])
    implicit val rType=lhs.dt
    (lhs, rhs) match {
      case (Const(value1), Const(value2)) => Const(value1 & value2)
      case (_, Zero()) => Zero()
      case (Zero(), _) => Zero()
      case (Const(value), _) if value == (1 << lhs.dt.size) - 1 => rhs
      case (_, Const(value)) if value == (1 << lhs.dt.size) - 1 => lhs
      case (_, Const(_)) => new And(lhs, rhs)
      case (Const(_), _) => new And(lhs, rhs)
      case _ =>
        val Vector(lhs2:Sig[Int] @unchecked,rhs2:Sig[Int] @unchecked)=Vector(lhs,rhs).synch
        new And(lhs2,rhs2).delay(1)
    }
  }
}

class Equals[T] private(lhs: Sig[T], rhs: Sig[T]) extends Sig()(Unsigned(1)) {
  override val availableAt: Option[Instant] = Vector(lhs,rhs).availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + lhs.name+" == "+rhs.name + ";")
}

object Equals{
  def apply[T](lhs: Sig[T], rhs: Sig[T]): Sig[Int] = {
    require(lhs.dt==rhs.dt)
    implicit val rType=Unsigned(1)
    (lhs, rhs) match {
      case (Const(value1), Const(value2)) => Const(if (value1 == value2) 1 else 0)
      case _ =>
        val Vector(lhs2:Sig[T] @unchecked,rhs2:Sig[T] @unchecked)=Vector(lhs,rhs).synch
        new Equals(lhs2,rhs2).delay(1)
    }
  }
}

case class RedXor private(input: Sig[Int]) extends Sig()(Unsigned(1)) {
  override val availableAt: Option[Instant] = input.availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = ^" + input.name+";")
}

object RedXor{
  def apply(input: Sig[Int]): Sig[Int] = {
    require(input.dt.isInstanceOf[Unsigned])
    implicit val rType=Unsigned(1)
    input match {
      case Const(value) => Const(BigInt(value).bitCount & 1)
      case _ if input.busSize == 1 => input
      case _=> new RedXor(input).register
    }
  }
}