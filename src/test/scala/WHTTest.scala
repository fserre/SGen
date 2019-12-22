/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

import Generators.genInvertible
import SB.HW.{ComplexHW, FixedPoint, Unsigned}
import SB.Product
import SB.SLP.Steady
import SPL.ItProduct
import SPL.WHT.WHT
import StreamingModule.{Product, StreamingModule}
import linalg.Fields._
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Shrink}
import org.scalatest._
import org.scalatest.prop.GeneratorDrivenPropertyChecks
import org.scalatestplus.scalacheck.ScalaCheckDrivenPropertyChecks

class WHTTest extends PropSpec with  ScalaCheckDrivenPropertyChecks with Matchers {


  /*property("test") {
    forAll(gen) { v: Vec[F2] =>
      println(v)
      assert(v.values(0) == 1)
    }
*/
  implicit def shrinkSB[T]:Shrink[StreamingModule[T]] = Shrink { input: StreamingModule[T] =>

    input match {
      case StreamingModule.Product(factors) =>

        (0 until factors.size).toStream.map(i => StreamingModule.Product[T]((factors.take(i)) ++ (factors.drop(i + 1))))
      case SB.Product(factors) =>

        (0 until factors.size).toStream.map(i => SB.Product[T]( (factors.take(i)) ++ (factors.drop(i + 1))))
      case SB.ITensor(r,factor,k) if k>factor.n => (1 to k-factor.n).toStream.map(i=>SB.ITensor(r-i,factor,k-i))
      case StreamingModule.ItProduct(r, factor, endLoop) => (1 until r).reverse.toStream.map(i => StreamingModule.ItProduct(i, factor, endLoop))
      //case slp:SLP[Int] if slp.size>1 =>
      case _ => (1 until input.k).reverse.toStream.map(k => input.spl.stream(k)(input.hw))
    }
  }


  property("WHT conforms to the definition") {

    for(n<-1 until 11) {
      val sb = WHT[Double](n, 1) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res=(0 until (1<<n)).map (j=> Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Double]](_ :: _)
      val wht=Matrix.tabulate[Double](1<<n,1<<n)((i,j)=>if((Vec.fromInt(n,i) scalar Vec.fromInt(n,j)).value) -1 else 1)
      assert((res-wht).norm==0)
    }
  }


  val genSteady = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
  } yield WHT[Double](t + k, 1).stream(k)(FixedPoint(16, 0))
  property("CTWHT") {

    forAll(genSteady, minSuccessful(20)) { sb:StreamingModule[Double] =>
      println(sb)
      //sb.name should equal ("bla")
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i)) match{
        case Some(value) if value<0.01 => true
        case _ => false
      })
    }//(implicitly,shrinkSB,implicitly,implicitly,implicitly)
  }


  property("PeaseWHT conforms to the definition") {

    for {
      n <- 1 until 11
      r <- 1 until n
      if n % r == 0
    } {
      println(n + " " + r)
      val sb = WHT.Pease[Double](n, r) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Double]](_ :: _)
      val wht = Matrix.tabulate[Double](1 << n, 1 << n)((i, j) => if ((Vec.fromInt(n, i) scalar Vec.fromInt(n, j)).value) -1 else 1)
      assert((res - wht).norm == 0)
    }
  }

  val peaseWHT = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
  } yield WHT.Pease[Double](n, r).stream(k)(FixedPoint(16, 0))
  property("PeaseWHT") {

    forAll(peaseWHT, minSuccessful(20)) { sb: StreamingModule[Double] =>
      println(sb)
      //sb.name should equal ("bla")
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i)) match {
        case Some(value) if value < 0.01 => true
        case _ => false
      })
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)
  }
  val itpeaseWHT = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
  } yield WHT.ItPease[Double](n, r).stream(k)(FixedPoint(16, 0))
  property("ItPeaseWHT") {

    forAll(itpeaseWHT, minSuccessful(20)) { sb: StreamingModule[Double] =>
      println(sb)
      //sb.name should equal ("bla")
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i)) match {
        case Some(value) if value < 0.01 => true
        case _ => false
      })
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)
  }
}