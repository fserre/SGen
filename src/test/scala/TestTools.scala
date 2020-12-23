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

import scala.language.implicitConversions
import java.io.PrintWriter
import ir.rtl.{AcyclicProduct, ITensor, ItProduct, StreamingModule,Product,RAMControl}
import linalg.Fields.F2
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Shrink}
import backends.Verilog._
import java.nio.file.{Files, Paths}
import scala.sys.process._


object TestTools {



  implicit val genF2: Gen[F2] = Gen.oneOf(F2(true), F2(false))
  implicit val genVec: Gen[Vec[F2]] = for {
    size <- Gen.choose(1, 10)
    value <- Gen.choose(0, (1 << size) - 1)
  } yield Vec.fromInt(size, value)

  implicit def genVec(size: Int): Gen[Vec[F2]] = Gen.choose(0, (1 << size) - 1).map(value => Vec.fromInt(size, value))

  implicit def shrinkVec(implicit s: Shrink[Int]): Shrink[Vec[F2]] = Shrink { (v: Vec[F2]) =>
    for {
      size <- s.shrink(v.m)
      if size > 0
      value <- s.shrink(v.toInt)
      if value < (1 << size)
    } yield Vec.fromInt(size, value)
  }

  def genInvLower(n: Int): Gen[Matrix[F2]] = {
    Gen.listOfN(n * (n - 1) / 2, genF2).map(v => Matrix.tabulate(n, n)((i, j) =>
      if (i > j)
        v(i * (i - 1) / 2 + j)
      else
        F2(i == j)
    ))
  }

  def genMatrix(m: Int, n: Int): Gen[Matrix[F2]] = Gen.listOfN(m * n, genF2).map(v => Matrix(m, n, v.toVector))

  def genInvertible(n: Int): Gen[Matrix[F2]] = for {
    u1 <- genInvLower(n)
    u2 <- genInvLower(n)
    u3 <- genInvLower(n)
  } yield u1 * u2.transpose * u3

  implicit def shrinkSB[T]: Shrink[StreamingModule[T]] = Shrink.withLazyList {
    case Product(factors) => factors.indices.to(LazyList).map(i => Product[T](factors.take(i) ++ factors.drop(i + 1)))
    case AcyclicProduct(factors) => factors.indices.to(LazyList).map(i => AcyclicProduct[T](factors.take(i) ++ factors.drop(i + 1)))
    case ITensor(r, factor, k) if k > factor.n => (1 to k - factor.n).to(LazyList).map(i => ir.rtl.ITensor(r - i, factor, k - i))
    case ItProduct(r, factor: AcyclicProduct[T], endLoop) => shrinkSB[T].shrink(factor).to(LazyList).map(f => ir.rtl.ItProduct(r, f, endLoop))
    case ItProduct(r, factor, endLoop) => (1 until r).reverse.to(LazyList).map(i => ir.rtl.ItProduct(i, factor, endLoop))
    case input => (1 until input.k).reverse.to(LazyList).map(k => input.spl.stream(k,if(input.hasSinglePortedMem) RAMControl.Single else RAMControl.Dual)(input.hw))
  }

}
