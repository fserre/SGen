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

package ir.rtl.hardwaretype

import org.scalatest.funsuite.AnyFunSuite

class FixedPointTest extends AnyFunSuite:
  test("bitsOf should work with a set of doubles"):
    val hw = FixedPoint(2, 1)
    assertThrows[IllegalArgumentException](hw.bitsOf(Double.NegativeInfinity))
    assertThrows[IllegalArgumentException](hw.bitsOf(Double.MinValue))
    assertThrows[IllegalArgumentException](hw.bitsOf(-2.5d))
    assert(hw.bitsOf(-2d) == 4)
    assert(hw.bitsOf(-1.5d) == 5)
    assert(hw.bitsOf(-1d) == 6)
    assert(hw.bitsOf(-0.5d) == 7)
    assert(hw.bitsOf(-Double.MinPositiveValue) == 0)
    assert(hw.bitsOf(-0d) == 0)
    assert(hw.bitsOf(0d) == 0)
    assert(hw.bitsOf(Double.MinPositiveValue) == 0)
    assert(hw.bitsOf(0.5d) == 1)
    assert(hw.bitsOf(1d) == 2)
    assert(hw.bitsOf(1.5d) == 3)
    assertThrows[IllegalArgumentException](hw.bitsOf(2d))
    assertThrows[IllegalArgumentException](hw.bitsOf(Double.MaxValue))
    assertThrows[IllegalArgumentException](hw.bitsOf(Double.PositiveInfinity))
    assertThrows[IllegalArgumentException](hw.bitsOf(Double.NaN))
    
  test("valueOf should work with a set of inputs"):
    val hw = FixedPoint(2, 1)
    assert(hw.valueOf(0) == 0d)
    assert(hw.valueOf(1) == 0.5d)
    assert(hw.valueOf(2) == 1d)
    assert(hw.valueOf(3) == 1.5d)
    assert(hw.valueOf(4) == -2d)
    assert(hw.valueOf(5) == -1.5d)
    assert(hw.valueOf(6) == -1d)
    assert(hw.valueOf(7) == -0.5d)
    assertThrows[IllegalArgumentException](hw.valueOf(8))
