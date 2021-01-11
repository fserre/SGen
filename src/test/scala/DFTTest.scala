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

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint}
import ir.rtl.{SB, StreamingModule,RAMControl}
import transforms.fft.{DFT, StreamDiagC}
import linalg.Fields.Complex
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Properties, Shrink}
import org.scalacheck.Prop.forAll
import backends.xilinx.Xsim._

object DFTTest extends Properties("DFT") {
  import TestTools.shrinkSB
  implicit val cphw: ComplexHW[Double] = ComplexHW(FixedPoint(8, 8))
  property("CTDFT conforms to the definition")=forAll(for {
    n <- Gen.choose(2,10)
    r <- Gen.choose(1, n-1)
    if n % r == 0
  } yield (n,r)) { case (n,r) =>
    val sb = DFT.CTDFT(n, r) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Complex[Double]]](_ :: _)
      val wht:Matrix[Complex[Double]] = Matrix.tabulate[Complex[Double]](1 << n, 1 << n)((i, j) => DFT.omega(n, i * j))

      (res - wht).norm < 0.0001
    }



  val genSteady: Gen[StreamingModule[Complex[Double]]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield DFT.CTDFT(n, r).stream(k,dp)(ComplexHW(FixedPoint(8, 8)))
  property("CTDFT") = forAll(genSteady) { (sb: StreamingModule[Complex[Double]]) =>
      sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)


  val genPease: Gen[StreamingModule[Complex[Double]]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
    dp <- Gen.oneOf(RAMControl.Dual,RAMControl.Single)
  } yield DFT.Pease(n, r).stream(k,dp)(ComplexHW(FixedPoint(8, 8)))
  property("Pease") =

    forAll(genPease) { (sb: StreamingModule[Complex[Double]]) =>
      sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)

  val genDiagC: Gen[SB[Complex[Double]]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n - 1)
    if n % r == 0
  } yield StreamDiagC(n, r).stream(k,RAMControl.Single)(ComplexHW(FixedPoint(16, 16)))
  property("DiagC") = forAll(genDiagC) { (sb: StreamingModule[Complex[Double]]) =>
    sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
  } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)



  property("ItPeaseDFT conforms to the definition") =forAll(for {
    n <- Gen.choose(2,10)
    r <- Gen.choose(1, n-1)
    if n % r == 0
  } yield (n,r)) { case (n,r) =>
      val sb = DFT.ItPease(n, r) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Complex[Double]]](_ :: _)
      val wht = Matrix.tabulate[Complex[Double]](1 << n, 1 << n)((i, j) => DFT.omega(n, i * j))
      (res - wht).norm < 0.0001
    }


  val genItPease: Gen[StreamingModule[Complex[Double]]] = for {
    t <- Gen.choose(1, 3)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n - 1)
    if n % r == 0
    if k >= r
  } yield DFT.ItPease(n, r).stream(k,RAMControl.Dual)(ComplexHW(FixedPoint(8, 8)))
  property("ItPease")= forAll(genItPease) { (sb: StreamingModule[Complex[Double]]) =>
    sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)


  property("ItPeaseFused conforms to the definition")=forAll(for {
    n <- Gen.choose(2,10)
    r <- Gen.choose(1, n-1)
    if n % r == 0
  } yield (n,r)) { case (n,r) =>
      val sb = DFT.ItPeaseFused(n, r) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Complex[Double]]](_ :: _)
      val wht = Matrix.tabulate[Complex[Double]](1 << n, 1 << n)((i, j) => DFT.omega(n, i * j))
      (res - wht).norm < 0.0001
    }


  val genItPeaseFused: Gen[StreamingModule[Complex[Double]]] = for {
    t <- Gen.choose(1, 3)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n - 1)
    if n % r == 0
    if k >= r
  } yield DFT.ItPeaseFused(n, r).stream(k,RAMControl.Dual)(ComplexHW(FixedPoint(8, 8)))
  property("ItPeaseFused") = forAll(genItPeaseFused) { (sb: StreamingModule[Complex[Double]]) =>
    sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)

}