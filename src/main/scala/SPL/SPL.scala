/*
 *     _____ ______          SGen - A Generator of Streaming Hardware
 *    / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *    \__ \/ / __/ _ \/ __ \
 *   ___/ / /_/ /  __/ / / /
 *  /____/\____/\___/_/ /_/  Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software Foundation,
 *  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 */

package SPL

import RTL._
import SB.HW.HW
import StreamingModule.StreamingModule

abstract class SPL[T](val n: Int) {
  val N: Int = 1 << n

  def eval(inputs: Seq[T], set: Int): Seq[T]

  def stream(k: Int)(implicit hw: HW[T]): StreamingModule[T]

  def *(rhs:SPL[T]): SPL[T] =Product(this,rhs)

  //def eval(inputs:Seq[Int]):Seq[Int]
}
