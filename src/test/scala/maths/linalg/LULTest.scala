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
package maths.linalg

import maths.fields.{F2, Q}
import org.scalatest.funsuite.AnyFunSuiteLike

class LULTest extends AnyFunSuiteLike:
  test("First example of the article:"):
    val P1 = Matrix[F2](7, 7, Vector(
      1, 1, 0, 0, 1, 0, 1,
      0, 0, 1, 0, 0, 1, 0,
      1, 1, 0, 1, 1, 1, 1,
      0, 0, 0, 0, 0, 1, 1,
      1, 0, 1, 1, 0, 0, 0,
      1, 1, 0, 0, 1, 1, 1,
      0, 1, 0, 0, 0, 0, 0
    ))
    val lul1 = new LUL(P1, 4, 3)
    val L1 = lul1.getSolution
    assert(lul1.isSolution(L1))

  test("Second example of the article:"):
    val P2 = Matrix[F2](7, 7, Vector(
      0, 1, 1, 1, 1, 0, 0,
      1, 0, 0, 1, 0, 1, 1,
      0, 1, 1, 1, 0, 1, 1,
      1, 1, 0, 1, 0, 1, 1,
      1, 0, 0, 1, 0, 1, 0,
      0, 0, 0, 1, 0, 1, 0,
      1, 0, 1, 1, 1, 1, 0
    ))
    val lul2 = new LUL(P2, 4, 3)
    val L2 = lul2.getSolution
    assert(lul2.isSolution(L2))

  test("Example using rational numbers:"):
    val P = Matrix[Q](7, 7, Vector(
      1, Q(5, 2), 0, 0, 1, 0, 1,
      0, 0, 7, 0, 0, 1, 0,
      1, 1, 0, 1, 11, 1, 1,
      0, 0, 6, 0, 0, 1, 1,
      1, 0, 1, 1, 0, 0, 0,
      1, 1, 0, 2, 1, 1, 1,
      0, 5, 10, 0, 0, 0, 0
    ))
    val lul = new LUL(P, 4, 3)
    val L = lul.getSolution
    assert(lul.isSolution(L))

