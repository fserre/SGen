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

package ir.rtl.signals

import ir.rtl.Component
import ir.rtl.hardwaretype.{ComplexHW, HW}
import linalg.Fields.Complex

case class Re[T] private(input: Sig[Complex[T]]) extends Operator[T](input)(using input.hw.innerHW) {
  override def implement(implicit cp: Sig[?] => Component): Component = new ir.rtl.Tap(cp(input),0 until hw.size)
  }
object Re{
  def apply[T](input:Sig[Complex[T]]): Sig[T] =input match{
    case Const(value) => Const(value.re)(input.hw.innerHW, input.sb)
    case Cpx(real,_)=>real
    case _ => new Re(input)
  }

  def unapply[T](arg: Sig[T]): Option[Sig[Complex[T]]] = arg match{
    case arg:Re[T]=>Some(arg.input)
    case _ => None
  }
}

case class Im[T] private(input: Sig[Complex[T]]) extends Operator[T](input)(using input.hw.innerHW) {
  override def implement(implicit cp: Sig[?] => Component): Component =new ir.rtl.Tap(cp(input),hw.size until (hw.size*2))

}

object Im{
  def apply[T](input:Sig[Complex[T]]): Sig[T] =input match{
    case Const(value) => Const(value.im)(input.hw.innerHW, input.sb)
    case Cpx(_,im)=>im
    case _ => new Im(input)
  }

  def unapply[T](arg: Sig[T]): Option[Sig[Complex[T]]] = arg match{
    case arg:Im[T]=>Some(arg.input)
    case _ => None
  }
}


case class Cpx[T] private(real: Sig[T], im: Sig[T]) extends Operator[Complex[T]](real, im)(using ComplexHW(real.hw)) {
  override def implement(implicit cp: Sig[?] => Component): Component = new ir.rtl.Concat(Vector(cp(im),cp(real)))

}
object Cpx{
  def apply[T](real: Sig[T], im: Sig[T]): Sig[Complex[T]] = (real, im) match {
    case (Const(re), Const(im)) => Const(Complex(re, im)(using real.hw.num))(using ComplexHW(real.hw), real.sb)
    case (Re(cpxReal),Im(cpxIm)) if cpxReal==cpxIm => cpxReal
    case _ => new Cpx(real,im)
  }

  def unapply[T](arg: Sig[Complex[T]]): Option[(Sig[T], Sig[T])] = arg match{
    case arg:Cpx[T] => Some((arg.real,arg.im))
    case _ => None
  }
}