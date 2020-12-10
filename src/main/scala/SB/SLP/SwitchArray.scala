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

package SB.SLP

import SB.HardwareType.HW
import SB.{Identity, SB}
import _root_.SB.Signals._
import linalg.Fields.F2
import linalg.{Matrix, Vec}

case class SwitchArray[U: HW] private(v: Seq[Vec[F2]], override val k: Int) extends SLP(v.head.m, k, v.size) {
  override def implement(inputs: Seq[Sig[U]])(implicit sb:SB[?]): Seq[Sig[U]] = {
    val timer = Timer(T)
    val vec = Vector.tabulate(v.size)(j => timer scalar v(j))
    val set = Counter(size)
    val control = Mux(set, vec)

    inputs.indices.toVector.map(i => if (i % 2 == 0) control ? (inputs(i + 1), inputs(i)) else control ? (inputs(i - 1), inputs(i)))

  }

  override val P2: Seq[Matrix[F2]] = v.map(v => Matrix.zeros[F2](k - 1, t) / v.transpose)
}

object SwitchArray {
  def apply[U: HW](v: Seq[Vec[F2]], k: Int): SB[U] = if (v.forall(_.isZero))
    Identity(v.head.m, k)
  else
    new SwitchArray(v, k)

  def apply[U: HW](v: Vec[F2], k: Int): SB[U] = apply(Seq(v), k)
}