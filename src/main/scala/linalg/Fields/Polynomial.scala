/**
 * LUL Factorisation - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */
package linalg.Fields

import scala.math.Fractional.Implicits._

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

    override def parseString(str: String): Option[Polynomial[T]] = ???
  }

  implicit def numericOps[T: Fractional](lhs: Polynomial[T]) = PolynomialIsFractional.mkNumericOps(lhs)

  implicit def fromInt[T: Fractional](x: Int) = PolynomialIsFractional[T].fromInt(x)
}

case class Polynomial[T: Fractional](terms: Vector[(T, Vector[String])], constant: T) {
  override def toString() = terms.map(t => (
    if (t._1 == implicitly[Fractional[T]].one) "" else if (t._1 == implicitly[Fractional[T]].negate(implicitly[Fractional[T]].one)) "-" else t._1.toString) + t._2.toVector.sorted.mkString("*")
  ).mkString(" + ") + (if (constant == implicitly[Fractional[T]].zero) "" else (if (terms.isEmpty) "" else " + ") + constant.toString)
}