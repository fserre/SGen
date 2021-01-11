/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
 * /____/\____/\___/_/ /_/  https://github.com/fserre/sgen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *   
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *   
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *   
 */

import transforms.perm.{Steady, SwitchArray, Temporal}
import linalg.Fields.F2
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Properties, Shrink}
import org.scalacheck.Prop._
import TestTools._
import ir.rtl.{RAMControl, SB, StreamingModule}
import ir.rtl.hardwaretype.Unsigned
import transforms.perm.LinearPerm
import backends.xilinx.Xsim._

object SLPTest extends Properties("SLP") {






  val genTemporal: Gen[SB[Int]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    r <- Gen.choose(0, 2)
    innerP4 <- genInvertible(t)
    p4=Matrix.identity[F2](r) oplus innerP4
    innerP3 <- genMatrix(t, k)
    p3=Matrix.zeros[F2](r,k)/innerP3
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield Temporal(Vector(p3), Vector(p4),dp)(Unsigned(16))
  property("Temporal") = forAll(genTemporal, Gen.choose(0, 10)) { (sb:SB[Int], gap) =>
    val gap2=if(sb.hasSinglePortedMem && gap>0) gap+sb.T else gap
    sb.test(2, gap2).contains(0)
  }

  val genTemporal2: Gen[SB[Int]] = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    r <- Gen.choose(0, 2)
    innerP4 <- Gen.containerOfN[Vector, Matrix[F2]](2, genInvertible(t))
    p4=innerP4.map(Matrix.identity[F2](r) oplus _)
    innerP3 <- Gen.containerOfN[Vector, Matrix[F2]](2, genMatrix(t, k))
    p3=innerP3.map(Matrix.zeros[F2](r,k)/_)
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield Temporal(p3, p4,dp)(Unsigned(16))
  property("Temporal2") =  forAll(genTemporal2, Gen.choose(0, 10)) { (sb:SB[Int], gap) =>
    val gap2=if(sb.hasSinglePortedMem && gap>0) gap+sb.T else gap
    sb.test(5,gap2).contains(0)
  }















  val genSteady: Gen[SB[Int]] = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    p1 <- genInvertible(k)
  } yield Steady(Vector(p1), t)(Unsigned(16))
  property("Steady") = forAll(genSteady, Gen.choose(0, 10)) { (sb:SB[Int], gap:Int) =>  sb.test(2, gap).contains(0)    }

  val genSteady2: Gen[SB[Int]] = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    p1 <- Gen.containerOfN[Vector, Matrix[F2]](2, genInvertible(k))
  } yield Steady(p1, t)(Unsigned(16))
  property("Steady2") = forAll(genSteady2, Gen.choose(0, 10)) { (sb, gap) =>  sb.test(2, gap).contains(0)   }

  property("SwitchArray") = forAll(genVec, Gen.choose(1, 5), Gen.choose(0, 10)) { (v: Vec[F2], k, gap) =>
      val sb = SwitchArray(Vector(v), k)(Unsigned(4))
      sb.test(2, gap).contains(0)
    }

  val genSwitch2: Gen[SB[Int]] = for {
    t <- Gen.choose(1, 5)
    k <- Gen.choose(1, 5)
    v <- Gen.containerOfN[Vector, Vec[F2]](2, genVec(t))
  } yield SwitchArray(v, k)(Unsigned(16))
  property("SwitchArray 2") = forAll(genSwitch2, Gen.choose(0, 10)) { (sb, gap) =>
      sb.test(2, gap).contains(0)
    }



  val genLinPerm: Gen[StreamingModule[Int]] = for {
    t <- Gen.choose(5, 5)
    k <- Gen.choose(5, 5)
    n = t + k
    p <- genInvertible(n)
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield LinearPerm[Int](Seq(p)).stream(k,dp)(Unsigned(16)) //(LinearPerm[Int](Seq(p)), k)


  property("LinearPerm") = forAll(genLinPerm) { sb =>
      sb.test(3).contains(0)
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