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

import ir.rtl.hardwaretype.HW
import ir.rtl.{AcyclicStreamingModule, RAMControl, StreamingModule}
import ir.rtl.signals.{Const, Sig}
import ir.spl.{Repeatable, SPL}
import maths.fields.Complex
import math.Numeric.Implicits.infixNumericOps

case class DFT2[T: Numeric](scalingFactor: T) extends SPL[T](1) with Repeatable[T]:
  override def eval(inputs: Seq[T], set: Int): Seq[T] = inputs.grouped(2).toSeq.flatMap(i => Seq((i.head + i.last) * scalingFactor, (i.head - i.last) * scalingFactor))

  override def stream(k: Int, control: RAMControl)(using HW[T]): AcyclicStreamingModule[T] =
    require(k == 1)
    Butterfly[T](scalingFactor)

case class Butterfly[T: HW](scalingFactor: T) extends AcyclicStreamingModule[T](0, 1):
  override def toString: String = "F2"

  override def implement(inputs: Seq[Sig[T]]): Seq[Sig[T]] = inputs.grouped(2).toSeq.flatMap(i => Seq((i.head + i.last) * Const(scalingFactor), (i.head - i.last) * Const(scalingFactor)))

  override def spl: SPL[T] = DFT2[T](scalingFactor)(using HW[T].num)
