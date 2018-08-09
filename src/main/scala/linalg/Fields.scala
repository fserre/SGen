/**
  * LUL Factorisation - ETH Zurich
  * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
  */
package linalg

import scala.math.Fractional.Implicits._

/**
  * Class that represents a rational number
  * It is immutable
  *
  * @param num   Numerator
  * @param denom Denominator
  */
class Q private(val num: Int, val denom: Int) {
  /**
    * Returns a printable string representing the number
    *
    * @return A printable string representing the number
    */
  override def toString = num.toString + (if (denom != 1) "/" + denom.toString else "")

  /**
    * checks for equality with another object
    * It has to be redefined to handle the case where both numerators are zeros
    *
    * @param obj Object to be compared with
    * @return if obj equals this
    */
  override def equals(obj: Any) = obj match {
    case q: Q => (q.num == 0 && num == 0) || (q.num == num && q.denom == denom)
    case _ => false
  }

  /**
    * Redefines the hashCode to be compatible with the redefined equals
    *
    * @return a hashCode
    */
  override def hashCode = num.hashCode()
}

/**
  * Companion object of the class Q
  */
object Q {
  /**
    * Creates a new rational number
    *
    * @param num   numerator
    * @param denom denominator
    * @return a new rational number, with simplified numerator and denominator
    */
  def apply(num: Int, denom: Int): Q = {
    def gcd(x: Int, y: Int): Int = {
      if (x == 0) y
      else if (x < 0) gcd(-x, y)
      else if (y < 0) -gcd(x, -y)
      else gcd(y % x, x)
    }

    assert(denom != 0)
    val g = gcd(num, denom)
    new Q(num / g, denom / g)
  }

  /**
    * Creates a new rational number from an integer
    *
    * @param num value
    * @return a new rational number
    */
  implicit def apply(num: Int): Q = apply(num, 1)


  /**
    * Defines the operations on rational numbers
    * Extends Fractional[Q] such that numeric and division operations can be implicitly used
    */
  implicit object QIsFractional extends Fractional[Q] {
    def div(lhs: Q, rhs: Q) = Q(lhs.num * rhs.denom, lhs.denom * rhs.num)

    def toFloat(x: Q) = x.num.toFloat / x.denom

    def toInt(x: Q) = toDouble(x).toInt

    def toDouble(x: Q) = x.num.toDouble / x.denom

    def fromInt(x: Int) = Q(x, 1)

    def toLong(x: Q) = toDouble(x).toLong

    def times(lhs: Q, rhs: Q) = Q(lhs.num * rhs.num, lhs.denom * rhs.denom)

    def minus(x: Q, y: Q) = plus(x, negate(y))

    def plus(lhs: Q, rhs: Q) = Q(lhs.num * rhs.denom + rhs.num * lhs.denom, lhs.denom * rhs.denom)

    def negate(x: Q) = Q(-x.num, x.denom)

    def compare(x: Q, y: Q) = x.num * y.denom - y.num * x.denom
  }

  implicit def numericOps(lhs: Q): QIsFractional.FractionalOps = QIsFractional.mkNumericOps(lhs)
}

/**
  * Class that represents a Gaussian rational number
  *
  * @param real real part
  * @param im   imaginary part
  */
case class Qi(real: Q, im: Q) {
  /**
    * Returns a printable string representing the number
    *
    * @return A printable string representing the number
    */
  override def toString = real.toString() + (if (im != Q.QIsFractional.zero) "+" + im.toString + "i" else "")
}

/**
  * Companion object of the class Qi
  */
object Qi {
  /**
    * Creates a new gaussian rational from an integer
    *
    * @param x value
    * @return a new gaussian rational
    */
  implicit def apply(x: Int): Qi = QiIsFractional.fromInt(x)

  /**
    * Defines the operations on gaussian rational numbers
    * Extends Fractional[Qi] such that numeric and division operations can be implicitly used
    */
  implicit object QiIsFractional extends Fractional[Qi] {
    def div(x: Qi, y: Qi) = {
      val denom = (y.real * y.real) + (y.im * y.im)
      Qi((x.real * y.real + x.im * y.im) / denom, (x.im * y.real - x.real * y.im) / denom)
    }

    def fromInt(x: Int) = Qi(x, 0)

    def times(x: Qi, y: Qi) = Qi(x.real * y.real - x.im * y.im, x.real * y.im + x.im * y.real)

    def minus(x: Qi, y: Qi) = plus(x, negate(y))

    def plus(x: Qi, y: Qi) = Qi(x.real + y.real, x.im + y.im)

    def negate(x: Qi) = Qi(-x.real, -x.im)

    /*
    The following operations do not make sense in the case of rational numbers, but are needed to extend Fractional[Qi]
    Any use of them will trigger a non implemented exception
     */
    def compare(x: Qi, y: Qi) = ???

    def toDouble(x: Qi) = ???

    def toLong(x: Qi) = ???

    def toFloat(x: Qi) = ???

    def toInt(x: Qi) = ???
  }

  implicit def ops(lhs: Qi): QiIsFractional.FractionalOps = QiIsFractional.mkNumericOps(lhs)
}

/**
  * Class that represent an element of F2, i.e. the Galois field with two elements
  *
  * @param value a boolean set to true for 1, and false for 0
  */
case class F2(value: Boolean) {
  /**
    * Returns a printable string representing the number
    *
    * @return A printable string representing the number
    */
  override def toString = if (value) "1" else "."
}

object F2 {
  /**
    * Creates a new element of F2 from an integer
    *
    * @param x value
    * @return a new element of F2
    */
  implicit def fromInt(x: Int): F2 = F2IsFractional.fromInt(x)

  /**
    * Defines the operations on F2
    * Extends Fractional[F2] such that numeric and division operations can be implicitly used
    */
  implicit object F2IsFractional extends Fractional[F2] {
    def div(x: F2, y: F2) = {
      assert(y.value)
      x
    }

    def toDouble(x: F2) = if (x.value) 1.0 else 0.0

    def toFloat(x: F2) = if (x.value) 1.0f else 0.0f

    def negate(x: F2) = x

    def fromInt(x: Int) = if (x % 2 == 0) F2(false) else F2(true)

    def toLong(x: F2) = if (x.value) 1L else 0L

    def times(x: F2, y: F2) = F2(x.value && y.value)

    def minus(x: F2, y: F2) = plus(x, y)

    def plus(x: F2, y: F2) = F2(x.value ^ y.value)

    def compare(x: F2, y: F2) = toInt(x) - toInt(y)

    def toInt(x: F2) = if (x.value) 1 else 0
  }

  implicit def ops(lhs: F2): F2IsFractional.FractionalOps = F2.F2IsFractional.mkNumericOps(lhs)
}

object Polynomial {
  def apply[T: Fractional](name: String): Polynomial[T] = Polynomial[T](Vector((implicitly[Fractional[T]].one, Vector(name))), implicitly[Fractional[T]].zero)

  def apply[T: Fractional](constant: T): Polynomial[T] = Polynomial[T](Vector[(T, Vector[String])](), constant)

  implicit def PolynomialIsFractional[T: Fractional] = new Fractional[Polynomial[T]] {
    override def div(x: Polynomial[T], y: Polynomial[T]): Polynomial[T] = ???

    override def toDouble(x: Polynomial[T]): Double = ???

    override def plus(x: Polynomial[T], y: Polynomial[T]): Polynomial[T] = {
      val terms = x.terms.foldLeft(y.terms)((res, cur) => {
        res.find(_._2 == cur._2) match {
          case Some(old) => {
            val newMonom = (cur._1 + old._1, old._2)
            res.filterNot(_ == old) :+ newMonom
          }
          case _ => res :+ cur
        }
      })
      Polynomial(terms.filterNot(_._1 == implicitly[Fractional[T]].zero), x.constant + y.constant)

    }

    override def toFloat(x: Polynomial[T]): Float = ???

    override def toInt(x: Polynomial[T]): Int = ???

    override def negate(x: Polynomial[T]): Polynomial[T] = Polynomial(x.terms.map(t => (-t._1, t._2)), -x.constant)

    override def fromInt(x: Int): Polynomial[T] = Polynomial[T](implicitly[Fractional[T]].fromInt(x))

    override def toLong(x: Polynomial[T]): Long = ???

    override def times(x: Polynomial[T], y: Polynomial[T]): Polynomial[T] = {
      val prod1 = x.terms.flatMap(t1 => y.terms.map(t2 => (t1._1 * t2._1, (t1._2 ++ t2._2).sorted)))
      val prod2 = x.terms.map(t => (t._1 * y.constant, t._2))
      val prod3 = y.terms.map(t => (t._1 * x.constant, t._2))
      Polynomial((prod1 ++ prod2 ++ prod3).filterNot(_._1 == implicitly[Fractional[T]].zero), x.constant * y.constant)
    }

    override def minus(x: Polynomial[T], y: Polynomial[T]): Polynomial[T] = plus(x, negate(y))

    override def compare(x: Polynomial[T], y: Polynomial[T]): Int = ???
  }

  implicit def numericOps[T: Fractional](lhs: Polynomial[T]) = PolynomialIsFractional.mkNumericOps(lhs)

  implicit def fromInt[T: Fractional](x: Int) = PolynomialIsFractional[T].fromInt(x)
}

case class Polynomial[T: Fractional](terms: Vector[(T, Vector[String])], constant: T) {
  override def toString() = terms.map(t => (
    if (t._1 == implicitly[Fractional[T]].one) "" else if (t._1 == implicitly[Fractional[T]].negate(implicitly[Fractional[T]].one)) "-" else t._1.toString) + t._2.toVector.sorted.mkString("*")
  ).mkString(" + ") + (if (constant == implicitly[Fractional[T]].zero) "" else (if (terms.isEmpty) "" else " + ") + constant.toString)
}