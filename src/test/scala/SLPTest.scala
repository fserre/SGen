/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

import SB.SLP.{SLP, Steady, SwitchArray, Temporal, TemporalNG}
import SB.Signals.Null
import linalg.Fields.F2
import linalg.{Matrix, Vec}

import collection.mutable.Stack
import org.scalatest._
import org.scalatest.prop.{Checkers, GeneratorDrivenPropertyChecks}
import org.scalacheck.Arbitrary._
import org.scalacheck.{Arbitrary, Gen, Shrink}
import org.scalacheck.Prop._
import org.scalatestplus.scalacheck.ScalaCheckDrivenPropertyChecks
import Generators._
import SB.{Product, SB}
import _root_.SB.HW.Unsigned
import SPL.LinearPerm
import StreamingModule.StreamingModule

class SLPTest extends PropSpec with ScalaCheckDrivenPropertyChecks {


  /*property("test") {
    forAll(gen) { v: Vec[F2] =>
      println(v)
      assert(v.values(0) == 1)
    }
*/
  val genSteady = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    p1 <- genInvertible(k)
  } yield Steady(Vector(p1), t)(Unsigned(16))
  property("Steady") {

    forAll(genSteady, Gen.choose(0, 10), minSuccessful(20)) { (sb, gap) =>
      println(sb)
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i), gap) == Some(0))
    }
  }
  val genSteady2 = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    p1 <- Gen.containerOfN[Vector, Matrix[F2]](2, genInvertible(k))
  } yield Steady(p1, t)(Unsigned(16))
  property("Steady2") {

    forAll(genSteady2, Gen.choose(0, 10), minSuccessful(20)) { (sb, gap) =>
      println(sb)
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i), gap) == Some(0))
    }
  }

  property("SwitchArray") {
    forAll(genVec, Gen.choose(1, 5), Gen.choose(0, 10), minSuccessful(20)) { (v: Vec[F2], k, gap) =>
      whenever(k > 0) {
        println(v + " " + k)
        val sb = SwitchArray(Vector(v), k)(Unsigned(4))
        val n = v.m + k
        assert(sb.test(Vector.tabulate(2 << sb.n)(i => i), gap) == Some(0))
      }
    }
  }
  val genSwitch2 = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    v <- Gen.containerOfN[Vector, Vec[F2]](2, genVec(t))
  } yield SwitchArray(v, k)(Unsigned(16))
  property("SwitchArray 2") {
    forAll(genSwitch2, Gen.choose(0, 10), minSuccessful(20)) { (sb, gap) =>
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i), gap) == Some(0))
    }
  }
  val genTemporal = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    p4 <- genInvertible(t)
    p3 <- genMatrix(t, k)
  } yield TemporalNG(Vector(p3), Vector(p4))(Unsigned(16))
  property("Temporal") {
    forAll(genTemporal, Gen.choose(0, 10), minSuccessful(20)) { (sb, gap) =>
      println(sb)
      assert(sb.test(Vector.tabulate(2 << sb.n)(i => i), gap) == Some(0))
    }
  }

  val genTemporal2 = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    p4 <- Gen.containerOfN[Vector, Matrix[F2]](2, genInvertible(t))
    p3 <- Gen.containerOfN[Vector, Matrix[F2]](2, genMatrix(t, k))
  } yield TemporalNG(p3, p4)(Unsigned(16))
  property("Temporal2") {
    forAll(genTemporal2, minSuccessful(100)) { sb =>
      //println(sb)
      assert(sb.test(Vector.tabulate(5 << sb.n)(i => i)) == Some(0))
    }
  }

  //implicit val hw:HW[Int]=Unsigned(16)
  implicit def shrinkSB = Shrink { input: StreamingModule[Int] =>
    input match {
      case Product(factors) => (0 until factors.size).toStream.map(i => Product[Int]((factors.take(i)) ++ (factors.drop(i + 1))))
      //case slp:SLP[Int] if slp.size>1 =>
      case _ => (1 until input.k).reverse.toStream.map(k => input.spl.stream(k)(Unsigned(16)))
    }
  }

  val genLinPerm = for {
    t <- Gen.choose(5, 5)
    k <- Gen.choose(5, 5)
    n = t + k
    p <- genInvertible(n)
  } yield LinearPerm[Int](Seq(p)).stream(k)(Unsigned(16)) //(LinearPerm[Int](Seq(p)), k)


  property("LinearPerm") {
    forAll(genLinPerm, minSuccessful(200)) { sb =>
      //println(sb)
      println(sb)
      assert(sb.test(Vector.tabulate(3 << sb.n)(i => i)) == Some(0))

    }
  }


  /*if (sb.P.size > 1)
    (0 until sb.P.size).toStream.map(i => (LinearPerm[Int]((sb.P.take(i)) ++ (sb.P.drop(i + 1))), k))
  else
    Stream()*/
  /*

      val genMulLinPerm = for {
        t <- Gen.choose(1, 2)
        k <- Gen.choose(1, 2)
        n = t + k
        p <- Gen.containerOfN[Vector, Matrix[F2]](2, genInvertible(n))
        //if p.size>0
      } yield(LinearPerm[Int](p).stream(k)(Unsigned(16)))
      property("MulLinearPermDecomp") {
        forAll(genMulLinPerm, minSuccessful(200)) { case (sb, k) =>
          println(sb)
          whenever(k > 0) {
            val inputs = Vector.tabulate(2 << sb.n)(i => i)
            assert(sb.eval(inputs) == sb.stream(k)(Unsigned(16)).spl.eval(inputs))
          }
        }
      }

      property("MulLinearPerm") {
        forAll(genMulLinPerm, minSuccessful(20)) { case (sb, k) =>
          println(sb)
          if (k > 0) {
            val inputs = Vector.tabulate(2 << sb.n)(i => i)
            assert(sb.eval(inputs) == sb.stream(k)(Unsigned(16)).spl.eval(inputs))
            assert(sb.stream(k)(Unsigned(16)).test(Vector.tabulate(2 << sb.n)(i => i)) == Some(0))
          }
        }
      }*/
}