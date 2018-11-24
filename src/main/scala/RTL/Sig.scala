package RTL

import linalg._

import scala.collection.generic.CanBuildFrom


abstract class Sig[T](implicit val dt: HW[T]) {
  val busSize = dt.size
  val availableAt: Option[Instant]

  def declaration(implicit nl: Netlist): Option[String] = Some("wire " + (if (dt.isInstanceOf[FxP]) "signed " else "") + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  def name(implicit nl: Netlist) = nl.getName(this)

  def implement(implicit nl: Netlist) = {}

  def register: Sig[T] = Register[T](this)

  def delay(addTime: Int, reset: Boolean = false): Sig[T] = {
    assert(addTime >= 0);
    if (addTime == 0) this else Register(delay(addTime - 1, reset), reset)
  }

  /*

    def synchWith(rhs: Sig[_]): Unit = rhs.availableAt.map(this synchWith _)

    def synchWith(rhs: Vector[Sig[_]]): Unit = this synchWith rhs.flatMap(_.availableAt).earliest

    def synchWith(rhs: Instant): Unit = availableAt.map(_ synchWith rhs)
  */

}

object Sig {
  def unapply[T](arg: Sig[T]): Option[HW[T]] = Some(arg.dt)

  implicit def vecToConst(v: Vec[F2]): Sig[Int] = Const(v.toInt())(Unsigned(v.m))

  implicit class SigVec(x: Seq[Sig[_]]) {//TODO: Change such that it supports other collections
    def synch: Seq[Sig[_]] = {
      val instants = x.flatMap(_.availableAt)
      if (instants.isEmpty)
        x
      else {
        val latest = instants.latest
        x.map(cur => cur.availableAt match {
          case None => cur
          case Some(Instant(tl, cycle)) if tl == latest.tl && latest.cycle >= cycle => cur.delay(latest.cycle - cycle) //Same timeline => we just delay the signal
          case Some(Instant(tl:FloatingTL,_)) if tl.parent==None || tl.parent==Some(latest.tl) => FloatingDelay(cur,latest) //Floating and already synch to target tl
          case Some(Instant(tl:FloatingTL,_)) if tl.parent==None => //Floating and not synch
            tl.parent=latest.tl
            FloatingDelay(cur,latest)
          case _ => throw new Exception("Synch error!")
        })
      }
    }
  }

  implicit class SigTrav(x:Traversable[Sig[_]]) {
    def availableAt = {
      val iv = x.flatMap(_.availableAt)

      if (iv.isEmpty)
        None
      else {
        val res = iv.head
        assert(iv.forall(_ == res))
        Some(res)
      }
    }
  }
  implicit class intOps(lhs: Sig[Int]) {
    def ::(_lhs: Sig[Int]) = Concat(_lhs, lhs)

    def ===(rhs: Sig[Int]) = Equals(lhs, rhs)

    def ^(rhs: Sig[Int]) = Xor(lhs, rhs)

    def &(rhs: Sig[Int]) = And(lhs, rhs)

    def unary_^() = RedXor(lhs)

    def scalar(rhs: Sig[Int]) = (lhs, rhs) match {
      case (_, Const(value)) if BigInt(value).bitCount == 1 => lhs(BigInt(value).bitLength - 1)
      case (Const(value), _) if BigInt(value).bitCount == 1 => rhs(BigInt(value).bitLength - 1)
      case _ => RedXor(And(lhs, rhs))
    }

    def ?[ST](inputTrue: Sig[ST], inputFalse: Sig[ST]) = Mux(lhs, Vector(inputFalse, inputTrue))

    def apply(i: Int): Sig[Int] = apply(i to i)

    def apply(r: Range): Sig[Int] = Tap(lhs, r)

  }

  implicit class IntSignalVec(sv: Vector[Sig[Int]]) {
    def combine = Concat(sv)
  }

  implicit class NumericSignal[T: Numeric](lhs: Sig[T]) {
    implicit val rType = lhs.dt

    def +(rhs: Sig[T]) = Plus(lhs, rhs)

    def -(rhs: Sig[T]) = Minus(lhs, rhs)

    def *(rhs: Sig[T]) = Mul(lhs, rhs)

    def unary_-() = Zero() - lhs
  }

  /*
    implicit def signalIsNumeric[T: Numeric] = new Numeric[Signal[T]] {
      override def plus(x: Signal[T], y: Signal[T]): Signal[T] = Plus(x, y)

      override def minus(x: Signal[T], y: Signal[T]): Signal[T] = Minus(x, y)

      override def times(x: Signal[T], y: Signal[T]): Signal[T] = Mul(x, y)

      override def negate(x: Signal[T]): Signal[T] = ???

      override def fromInt(x: Int): Signal[T] = ???

      override def toInt(x: Signal[T]): Int = ???

      override def toLong(x: Signal[T]): Long = ???

      override def toFloat(x: Signal[T]): Float = ???

      override def toDouble(x: Signal[T]): Double = ???

      override def compare(x: Signal[T], y: Signal[T]): Int = ???
    }

    implicit def numOps[T: Numeric](lhs: Signal[T]) = signalIsNumeric[T].mkNumericOps(lhs)*/

  implicit class SignalVecEx(sv: Vector[Sig[_]]) {
    /*def availableAt = {
      val iv = sv.flatMap(_.availableAt)
      if (iv.isEmpty)
        None
      else {
        assert(iv.forall(i => i - iv(0) == 0))
        Some(iv(0))
      }
    }
    def synch = {
      val iv = sv.flatMap(_.availableAt)
      if (iv.isEmpty)
        sv
      else {
        val last = iv.latest
        sv.map(y => y.availableAt match {
          case None => y
          case Some(inst) => y.delay(last - inst)
        })
      }
    }

    def synchWith(rhs: Sig[_]): Unit = {
      rhs.availableAt map (this synchWith _)
    }

    def synchWith(rhs: Instant): Unit = {
      val ins = sv.flatMap(_.availableAt)
      if (!ins.isEmpty)
        ins.latest synchWith rhs
    }

    def synchWith(rhs: Vector[Sig[_]]): Unit = {
      val ins = rhs.flatMap(_.availableAt)
      if (!ins.isEmpty)
        this synchWith ins.earliest
    }
*/
  }

  implicit class complexSignal[T: Numeric](lhs: Sig[Complex[T]]) {
    def +(rhs: Sig[Complex[T]]) = MkComplex(lhs.re + rhs.re, lhs.im + rhs.im)

    def -(rhs: Sig[Complex[T]]) = MkComplex(lhs.re - rhs.re, lhs.im - rhs.im)

    def *(rhs: Sig[Complex[T]]) = {
      val rhsR = rhs.re
      val rhsI = rhs.im
      val lhsR = lhs.re
      val lhsI = lhs.im
      MkComplex(lhsR * rhsR - rhsI * lhsI, lhsR * rhsI + rhsR * lhsI)
    }

    def re = Real(lhs)

    def im = Imaginary(lhs)
  }

  implicit class SignalVec[T](sv: Vector[Sig[T]]) {

  }

  //implicit def mkOps[DT <: HW](lhs: Signal[DT])(implicit num: Numeric[Signal[DT]]) = num.mkNumericOps(lhs)
}

