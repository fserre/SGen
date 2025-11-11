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

package ir.rtl

import ir.rtl.signals.Sig
import ir.rtl.hardwaretype.HW
import ir.rtl.{AcyclicStreamingModule, StreamingModule}
import ir.spl.SPL
import maths.fields.F2
import maths.linalg.Matrix
import transforms.perm.Steady

object Identity:
  def apply[T:HW](t: Int, k: Int) = Steady(Matrix.identity[F2](k), t)
  def unapply[T](arg: StreamingModule[T]):Boolean = arg match
    case Steady(p1, _) if p1.forall(_.isIdentity) => true   
    case _ => false
  
