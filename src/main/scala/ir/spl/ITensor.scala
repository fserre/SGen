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
package ir
package spl

import ir.rtl.hardwaretype.HW
import ir.rtl.{RAMControl, AcyclicStreamingModule, StreamingModule}
import maths.fields.F2
import maths.linalg.Matrix
import transforms.perm.LinearPerm


/**
 * SPL block that repeats another SPL block. Formally I_{2^r} tensor factor.
 * 
 * @param r log of the number of repetitions
 * @param factor SPL that can be repeated
 * @tparam T software datatype of the data
 */
case class ITensor[T] private (r: Int, factor: Repeatable[T]) extends SPL[T](factor.n + r):
  override def eval(inputs: Seq[T], set: Int): Seq[T] = inputs.grouped(factor.N).toSeq.flatMap(factor.eval(_, set))

  override def stream(k: Int, control:RAMControl)(using HW[T]): StreamingModule[T] = ir.rtl.ITensor(r, factor.stream(Math.min(factor.n, k), control), k)


/**
 * Companion object of ITensor
 */
object ITensor:
  def apply[T](r:Int, factor:SPL[T]): SPL[T] = 
    if r == 0 then
      factor
    else
      factor match
        case Product(factors) => Product(factors.map(ITensor(r, _)))
        case ITensor(r2, factor) => ITensor(r + r2, factor)
        case LinearPerm(matrices) => LinearPerm(matrices.map(m => Matrix.identity[F2](r) oplus m))
        case factor:Repeatable[T] => new ITensor(r,factor)
        case _ => throw new Exception("Non repeatable SPL used in ITensor: " + factor)


trait Repeatable[T] extends SPL[T]:
  override def stream(k: Int, control: RAMControl)(using HW[T]): AcyclicStreamingModule[T]
