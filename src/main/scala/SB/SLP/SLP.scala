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

import SB.SB
import _root_.SB.HardwareType.HW
import SPL.{LinearPerm, SPL}
import _root_.SB.Signals.Sig
import StreamingModule.StreamingModule
import linalg.Fields.F2
import linalg.Matrix

abstract class SLP[U: HW](t: Int, k: Int, val size: Int) extends SB(t, k) {
  def P4: Seq[Matrix[F2]] = Vector.fill(size)(Matrix.identity[F2](t))

  def P3: Seq[Matrix[F2]] = Vector.fill(size)(Matrix.zeros[F2](t, k))

  def P2: Seq[Matrix[F2]] = Vector.fill(size)(Matrix.zeros[F2](k, t))

  def P1: Seq[Matrix[F2]] = Vector.fill(size)(Matrix.identity[F2](k))

  lazy val P: Seq[Matrix[F2]] = Vector.tabulate(size)(j => (P4(j) :: P3(j)) / (P2(j) :: P1(j)))
  override lazy val spl: SPL[U] = LinearPerm(P,!hasSinglePortedMem)
  /*def isTemporal=P2.forall(_.isZero()) && P1.forall(_.isIdentity())
  def isSpatial=P3.forall(_.isZero()) && P4.forall(_.isIdentity())
  def isSimple=isTemporal || isSpatial*/
}

object Spatial {
  def apply[U: HW](P1: Matrix[F2], P2: Matrix[F2]): StreamingModule[U] = Spatial(Vector(P1), Vector(P2))

  def apply[U: HW](P1: Seq[Matrix[F2]], P2: Seq[Matrix[F2]]): StreamingModule[U] = {

    assert(P2.size == P1.size)
    val P2p = P2.zip(P1).map(x => x._2.inverse * x._1)

    //Steady(P1, P2(0).n)*Spatial(P2p)  //TODO: CHECKKKKKKKK


    Spatial(P2) * Steady(P1, P2.head.n)
  }

  def apply[U: HW](P2: Seq[Matrix[F2]]): StreamingModule[U] = {
    val t = P2.head.n
    val k = P2.head.m
    val P2concat = P2.reduce(_ :: _)
    val L = (P2concat.range :: P2concat.range.complement).inverse
    val LP2 = P2.map(L * _)
    val Cinv = Steady(LinearPerm.Cmat(k), t)
    val step2 = (0 until P2concat.rk).map(i => SwitchArray[U](LP2.map(_.row(i)), k)).foldLeft[StreamingModule[U]](Steady(L, t))((res, cur) => cur * Cinv * res)
    val step3 = Steady(L.inverse * (LinearPerm.Cmat(k) ^ (k - P2concat.rk)), t)
    step3 * step2
  }
}