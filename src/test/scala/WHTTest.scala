/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

import SB.HW.{ComplexHW, FixedPoint, Unsigned}
import SB.Product
import SB.SLP.Steady
import SPL.ItProduct
import SPL.WHT.WHT
import StreamingModule.{Product, StreamingModule}
import linalg.Fields._
import linalg.{Matrix, Vec}
import org.scalacheck.Prop.forAll
import org.scalacheck.{Gen, Properties, Shrink}

object WHTTest extends Properties("WHT")  {
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


  property("WHT conforms to the definition")=forAll (Gen.choose(1,10)){n=>
      val sb = WHT[Double](n, 1) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res=(0 until (1<<n)).map (j=> Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Double]](_ :: _)
      val wht=Matrix.tabulate[Double](1<<n,1<<n)((i,j)=>if((Vec.fromInt(n,i) scalar Vec.fromInt(n,j)).value) -1 else 1)
      (res-wht).norm==0
    }


  val genSteady = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
  } yield WHT[Double](t + k, 1).stream(k)(FixedPoint(16, 0))
  property("CTWHT")=  forAll(genSteady) { sb:StreamingModule[Double] => sb.test(Vector.tabulate(2 << sb.n)(i => i)) match{
        case Some(value) if value<0.01 => true
        case _ => false
      }}

  property("PeaseWHT conforms to the definition")=forAll(for {
    n <- Gen.choose(2,10)
    r <- Gen.choose(1, n-1)
    if n % r == 0
  } yield (n,r)) { case (n,r) =>
      val sb = WHT.Pease[Double](n, r) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Double]](_ :: _)
      val wht = Matrix.tabulate[Double](1 << n, 1 << n)((i, j) => if ((Vec.fromInt(n, i) scalar Vec.fromInt(n, j)).value) -1 else 1)
      (res - wht).norm == 0
    }


  val peaseWHT = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
  } yield WHT.Pease[Double](n, r).stream(k)(FixedPoint(16, 0))
  property("PeaseWHT") =    forAll(peaseWHT) { sb: StreamingModule[Double] =>
      sb.test(Vector.tabulate(2 << sb.n)(i => i)) match {
        case Some(value) if value < 0.01 => true
        case _ => false
      }
    }

  val itpeaseWHT = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
  } yield WHT.ItPease[Double](n, r).stream(k)(FixedPoint(16, 0))
  property("ItPeaseWHT") =

    forAll(itpeaseWHT) { sb: StreamingModule[Double] =>
      sb.test(Vector.tabulate(2 << sb.n)(i => i)) match {
        case Some(value) if value < 0.01 => true
        case _ => false
      }
    }
}