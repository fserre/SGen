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

import SB.HW.{ComplexHW, FixedPoint}
import SB.SB
import SPL.FFT.{DFT, StreamDiagC}
import StreamingModule.StreamingModule
import linalg.Fields.Complex
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Properties, Shrink}
import org.scalacheck.Prop.forAll

object DFTTest extends Properties("DFT") {
  implicit def shrinkSB[T]: Shrink[StreamingModule[T]] = Shrink.withLazyList {
    case StreamingModule.Product(factors) => factors.indices.to(LazyList).map(i => StreamingModule.Product[T](factors.take(i) ++ factors.drop(i + 1)))
    case SB.Product(factors) => factors.indices.to(LazyList).map(i => SB.Product[T](factors.take(i) ++ factors.drop(i + 1)))
    case SB.ITensor(r, factor, k) if k > factor.n => (1 to k - factor.n).to(LazyList).map(i => SB.ITensor(r - i, factor, k - i))
    case StreamingModule.ItProduct(r, factor: SB.Product[T], endLoop) => shrinkSB[T].shrink(factor).to(LazyList).map(f => StreamingModule.ItProduct(r, f, endLoop))
    case StreamingModule.ItProduct(r, factor, endLoop) => (1 until r).reverse.to(LazyList).map(i => StreamingModule.ItProduct(i, factor, endLoop))
    case input => (1 until input.k).reverse.to(LazyList).map(k => input.spl.stream(k)(input.hw))
  }

  implicit val cphw: ComplexHW[Double] = ComplexHW(FixedPoint(8, 8))
  property("CTDFT conforms to the definition")=forAll(for {
    n <- Gen.choose(2,10)
    r <- Gen.choose(1, n-1)
    dp <- Gen.oneOf(true,false)
    if n % r == 0
  } yield (n,r,dp)) { case (n,r,dp) =>
    val sb = DFT.CTDFT(n, r,dp) // Temporal(Vector(Vec.fromInt(2, 3)), Vector(Matrix[F2](2, 2, Vector(1, 1, 1, 0))))(Unsigned(16))
      val res = (0 until (1 << n)).map(j => Vec(sb.eval(
        Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0
      ).toVector)).reduce[Matrix[Complex[Double]]](_ :: _)
      val wht = Matrix.tabulate[Complex[Double]](1 << n, 1 << n)((i, j) => DFT.omega(n, i * j))
      (res - wht).norm < 0.0001
    }



  val genSteady: Gen[StreamingModule[Complex[Double]]] = for {
    t <- Gen.choose(1, 2)
    k <- Gen.choose(1, 2)
    n = t + k
    r <- Gen.choose(1, n)
    if n % r == 0
    dp <- Gen.oneOf(true,false)
  } yield DFT.CTDFT(n, r,dp).stream(k)(ComplexHW(FixedPoint(8, 8)))
  property("CTDFT") = forAll(genSteady) { sb: StreamingModule[Complex[Double]] =>
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
    dp <- Gen.oneOf(true,false)
  } yield DFT.Pease(n, r,dp).stream(k)(ComplexHW(FixedPoint(8, 8)))
  property("Pease") =

    forAll(genPease) { sb: StreamingModule[Complex[Double]] =>
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
  } yield StreamDiagC(n, r).stream(k)(ComplexHW(FixedPoint(16, 16)))
  property("DiagC") = forAll(genDiagC) { sb: StreamingModule[Complex[Double]] =>
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
  } yield DFT.ItPease(n, r).stream(k)(ComplexHW(FixedPoint(8, 8)))
  property("ItPease")= forAll(genItPease) { sb: StreamingModule[Complex[Double]] =>
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
  } yield DFT.ItPeaseFused(n, r).stream(k)(ComplexHW(FixedPoint(8, 8)))
  property("ItPeaseFused") = forAll(genItPeaseFused) { sb: StreamingModule[Complex[Double]] =>
      sb.test() match {
        case Some(value) if value.re < 0.01 => true
        case _ => false
      }
    } //(implicitly,shrinkSB,implicitly,implicitly,implicitly)

}