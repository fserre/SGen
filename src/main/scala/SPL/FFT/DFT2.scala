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

package SPL.FFT

import SB.HardwareType.HW
import SB.{Butterfly, SB}
import _root_.SB.Signals.Sig
import SPL.{Repeatable, SPL}
import StreamingModule.StreamingModule
import linalg.Fields.Complex

class DFT2[T](implicit val num:Numeric[T]) extends SPL[T](1) with Repeatable[T]{
  override def eval(inputs: Seq[T], set: Int): Seq[T] = inputs.grouped(2).toSeq.flatMap(i => Seq(num.plus(i.head, i.last), num.minus(i.head, i.last)))

  override def stream(k: Int)(implicit hw: HW[T]): SB[T] = {
    require(k==1)
    /*new SB(0,1){
      override def toString: String = "F2"

      override def implement(inputs: Seq[Sig[T]])(implicit sb:SB[?]): Seq[Sig[T]] = inputs.grouped(2).toSeq.flatMap(i=>Seq(i.head+i.last,i.head-i.last))

      override def spl: SPL[T] =DFT2[T]()
    }*/
    Butterfly[T]
  }
}

object DFT2{
  def apply[T:Numeric]()=new DFT2[T]()
  def unapply[T](arg:SPL[T]): Boolean =arg match{
    case _:DFT2[T] => true
    case _ => false
  }
}