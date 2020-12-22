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

package SPL

import RTL.HardwareType.HW
import RTL.{RAMControl, SB, StreamingModule}
import linalg.Fields.F2
import linalg.Matrix
import transforms.SLP.LinearPerm


case class ITensor[T] private (r:Int, factor:Repeatable[T]) extends SPL[T](factor.n+r) {
  override def eval(inputs: Seq[T], set: Int): Seq[T] = //inputs.grouped(1<<n).toSeq.map(_.grouped(1<<factor.n).toVector).transpose.flatten.map(factor.eval).map(_.grouped(1<<factor.n).toVector).transpose.flatten.flatten
    inputs.grouped(factor.N).toSeq.flatMap(factor.eval(_, set))

  override def stream(k: Int, control:RAMControl)(implicit hw: HW[T]): StreamingModule[T] = RTL.ITensor(r,factor.stream(Math.min(factor.n,k),control),k)
}

object ITensor{
  def apply[T](r:Int, factor:Repeatable[T]):SPL[T]=apply(r,factor:SPL[T])
  def apply[T](r:Int, factor:SPL[T]):SPL[T]=if(r==0)
    factor
  else
    factor match{
      case Product(factors) => Product(factors.map(ITensor(r, _)))
      case ITensor(r2, factor) => ITensor(r + r2, factor)
      case LinearPerm(matrices) => LinearPerm(matrices.map(m => Matrix.identity[F2](r) oplus m))
    case factor:Repeatable[T] => new ITensor(r,factor)
      case _ => throw new Exception("Non repeatable SPL used in ITensor: " + factor)
  }
}

trait Repeatable[T] extends SPL[T]{
  override def stream(k: Int,control:RAMControl)(implicit hw: HW[T]): SB[T]
}