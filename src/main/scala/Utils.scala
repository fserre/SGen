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

import scala.annotation.tailrec

/** Helper functions and classes. */
package object Utils:
  @tailrec
  def gcd(a: Int, b: Int): Int = if (b == 0) a.abs else gcd(b, a % b)

  def lcm(a: Int, b: Int): Int = (a * b).abs / gcd(a, b)
  
  def lcm(x: Vector[Int]): Int = x.reduce(lcm)

  def sqrt[T: Numeric](x: T): T = x match 
    case x: Double => Math.sqrt(x).asInstanceOf[T] // todo: see what to do for something that inherits from Double
    case x: Float => Math.sqrt(x).toFloat.asInstanceOf[T]
    case _ =>
      val num = Numeric[T]
      num.fromInt(Math.sqrt(num.toDouble(x)).toInt)
