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

package ir.rtl

import ir.rtl.signals.Sig
import ir.spl.SPL

/**
 * Streaming block that represents the SPL expression I_{2^r} \otimes factor, streamed with 2^k ports.
 * Either factor is streamed with the same streaming width (k==factor.k, so we repeat in time), or factor is not streaming (factor.n==factor.k, so we repeat in space).
 *
 * @param r Log of the total number of times factor has to be repeated.
 * @param factor Streaming block to be repeated
 * @param k Log of the streaming width.
 * @tparam T Software datatype of the inputs/outputs
 */
case class ITensor[T](r: Int, factor: SB[T], override val k: Int) extends SB[T](r + factor.n - k, k)(factor.hw) {
//println("r:"+r+" k:"+k+" factor:"+factor)
  require((k>factor.n && factor.n==factor.k) || factor.k==k)
  override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[?]): Seq[Sig[T]] = if(k>factor.n)
    inputs.grouped(1<<factor.n).toSeq.flatMap(factor.implement(_))
  else
    factor.implement(inputs)

  override def spl: SPL[T] = ir.spl.ITensor(r,factor.spl)

  override def hasSinglePortedMem: Boolean = factor.hasSinglePortedMem
}
