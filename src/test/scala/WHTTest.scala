/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
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

import DSL.RTL.HardwareType.FixedPoint
import DSL.RTL.{StreamingModule,RAMControl}
import transforms.WHT.WHT
import linalg.{Matrix, Vec}
import org.scalacheck.Prop.forAll
import org.scalacheck.{Gen, Properties, Shrink}
import backends.Xsim._

object WHTTest extends Properties("WHT")  {
  property("WHT conforms to the definition")=
    forAll (Gen.choose(1,10)){n=>
      val sb = WHT[Double](n, 1)
      val res=(0 until (1<<n)).map (j=> Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Double]](_ :: _)
      val wht=Matrix.tabulate[Double](1<<n,1<<n)((i,j)=>if((Vec.fromInt(n,i) scalar Vec.fromInt(n,j)).value) -1 else 1)
      (res-wht).norm==0
    }

  val genSteady: Gen[StreamingModule[Double]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield WHT[Double](t + k, 1).stream(k,dp)(FixedPoint(16, 0))

  property("CTWHT")=
    forAll(genSteady) {( sb:StreamingModule[Double]) => sb.test() match{
        case Some(value) if value<0.01 => true
        case _ => false
      }}

  property("PeaseWHT conforms to the definition")=
    forAll(for {
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


  val peaseWHT: Gen[StreamingModule[Double]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield WHT.Pease[Double](n, r).stream(k,dp)(FixedPoint(16, 0))

  property("PeaseWHT") =
    forAll(peaseWHT) { (sb: StreamingModule[Double]) =>
      sb.test() match {
        case Some(value) if value < 0.01 => true
        case _ => false
      }
    }

  val itpeaseWHT: Gen[StreamingModule[Double]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
  } yield WHT.ItPease[Double](n, r).stream(k,RAMControl.Dual)(FixedPoint(16, 0))

  property("ItPeaseWHT") =
    forAll(itpeaseWHT) { (sb: StreamingModule[Double]) =>
      sb.test() match {
        case Some(value) if value < 0.01 => true
        case _ => false
      }
    }
}