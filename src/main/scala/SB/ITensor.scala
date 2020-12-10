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

package SB
import SB.Signals.Sig
import SPL.{Repeatable, SPL}

case class ITensor[T](r: Int, factor: SB[T], override val k: Int) extends SB[T](r + factor.n - k, k)(factor.hw) {
//println("r:"+r+" k:"+k+" factor:"+factor)
  require((k>factor.n && factor.n==factor.k) || factor.k==k)
  override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[?]): Seq[Sig[T]] = if(k>factor.n)
    inputs.grouped(1<<factor.n).toSeq.flatMap(factor.implement(_))
  else
    factor.implement(inputs)

  override def spl: SPL[T] = SPL.ITensor(r,factor.spl)

  override def hasSinglePortedMem: Boolean = factor.hasSinglePortedMem
}
