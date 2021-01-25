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

package transforms.perm

import ir.rtl.{Identity, AcyclicStreamingModule, StreamingModule}
import ir.rtl.hardwaretype.HW
import ir.rtl.signals._
import linalg.Fields.F2
import linalg.Matrix
import transforms.perm.LinearPerm

case class Steady[U: HW] private(override val P1: Seq[Matrix[F2]], override val t: Int) extends SLP(t, P1.head.m, P1.size) {
  override def implement(inputs: Seq[Sig[U]]): Seq[Sig[U]] = {
    val set = Counter(size)
    Vector.tabulate(K)(i => Mux(set, Vector.tabulate(P.size)(j => inputs(LinearPerm.permute(P(j).inverse, i)))))
  }
}

object Steady {
  def apply[U: HW](P1: Seq[Matrix[F2]], t: Int): AcyclicStreamingModule[U] = if (P1.forall(_.isIdentity)) Identity(t, P1.head.m) else new Steady(P1, t)

  def apply[U: HW](P1: Matrix[F2], t: Int): AcyclicStreamingModule[U] = Steady(Seq(P1), t)
}
