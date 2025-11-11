/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
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

package transforms.fft

import helpers.Xsim.test
import helpers.Vivado.synthetize
import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Flopoco, HW, IEEE754}
import maths.fields.Complex
import Complex.*
import ir.rtl.RAMControl
import ir.rtl.RAMControl.{Single, SinglePorted}
import ir.spl.SPL
import org.scalatest.*
import org.scalatest.funsuite.AnyFunSuite
import scala.collection.parallel.CollectionConverters.*
import scala.math.Fractional.Implicits.*


class DFTTest extends AnyFunSuite:
  val standardHWs = Vector(
    FixedPoint(8, 0),
    FixedPoint(16, 0),
    FixedPoint(32, 0),
    FixedPoint(64, 0),
    Flopoco(5, 10),
    Flopoco(8, 7),
    Flopoco(8, 23),
    Flopoco(11, 52),
    IEEE754(5, 10),
    IEEE754(8, 7),
    IEEE754(8, 23),
    IEEE754(11, 52)
  )

  val designs = Vector(
    ("CT", CTDFT(_, _, 1), false, false),
    ("ICT", ICTDFT(_, _, 1), false, true),
    ("Pease", Pease(_, _, 1), false, false),
    ("ItPease", ItPease(_, _, 1), true, false),
    ("ItPeaseFused", ItPeaseFused(_, _, 1), true, false),
    ("IItPeaseFused", IItPeaseFused(_, _, 1), true, true)
  )

  for
    (name, uut, _, inverse) <- designs
    n <- 1 to 10
    r <- 1 until n if n % r == 0
  do
    test(s"Checking $name FFT (size ${1 << n} radix ${1 << r})"):
      val sb = uut(n, r)
      for
        j <- (0 until 1 << n).par
        res = sb.eval(Seq.tabulate(1 << n)(i => if (i == j) 1.0 else 0.0), 0).toVector
        i <- 0 until 1 << n
      do
        val v = res(i) - (if inverse then DFT.omega(n, -i * j) else DFT.omega(n, i * j))
        assert(v.norm2 < 0.00001)

  for
    (name, uut) <- Vector(("ICT", ICTDFT(_, _, _)),("IItPeaseFused", IItPeaseFused(_, _, _)))
    n <- 1 to 10
    r <- 1 until n if n % r == 0
  do
    test(s"Checking that $name (size ${1 << n} radix ${1 << r}) is correctly scaled"):
      val sb = uut(n, r, 0.5)
      for
        j <- (0 until 1 << n).par
        res = sb.eval(Seq.tabulate(1 << n)(i => DFT.omega(n, i * j)), 0).toVector
        i <- 0 until 1 << n
      do
        val expected = if (i == j) 1.0 else 0.0
        val v = res(i) - expected
        assert(v.norm2 < 0.00001, s"${res(i)} is different than expected ($expected).")

  for
    (name, uut, iterative, _) <- designs
    t <- 1 to 3
    k <- 1 to 3
    n = t + k
    r <- 1 until n if n % r == 0 && (!iterative || k >= r)
    dft = uut(n, r)
    inner <- standardHWs
    hw = ComplexHW(inner) if dft.testParams.isDefinedAt(hw)
    dp <- RAMControl.values if dp == RAMControl.Dual || !iterative
  do
    val description = s"$name FFT (size 2^$n, 2^$k ports, radix 2^$r, $dp RAM banks, $hw)"
    test(s"Generating $description", Tag("simulation")):
      val (testInputs, epsilon) = dft.testParams(hw)
      dft.test(k, dp, hw, s"$name-$n-$r-$k-$dp-$inner")

  for
    (name, uut, iterative, _) <- designs
    t <- 1 to 5
    k <- 1 to 3
    n = t + k if n < 6
    r <- 1 until n if n % r == 0 && (!iterative || k >= r)
    inner <- standardHWs
    hw = ComplexHW(inner)
    dp <- RAMControl.values if dp == RAMControl.Dual || !iterative
  do
    val description = s"$name FFT (size 2^$n, 2^$k ports, radix 2^$r, $dp RAM banks, $hw)"
    test(s"Generating testbench for $description", Tag("synthesis")):
      uut(n, r).stream(k, dp)(using hw).synthetize(s"$name-$n-$r-$k-$dp-$inner")
