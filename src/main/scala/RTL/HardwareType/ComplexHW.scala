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

package RTL.HardwareType
import RTL.Signals._
import linalg.Fields._


case class ComplexHW[T](hw:HW[T]) extends HW[Complex[T]](hw.size*2)(using Complex.complexIsFractional[T](using hw.num):Numeric[Complex[T]]) {
  implicit val componentHW: HW[T] =hw

  override def plus(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)+Re(rhs),Im(lhs)+Im(rhs))

  override def minus(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)-Re(rhs),Im(lhs)-Im(rhs))

  override def times(lhs: Sig[Complex[T]], rhs: Sig[Complex[T]]): Sig[Complex[T]] = Cpx(Re(lhs)*Re(rhs)-Im(lhs)*Im(rhs),Re(lhs)*Im(rhs)+Im(lhs)*Re(rhs))

  override def bitsOf(const: Complex[T]): BigInt = (hw.bitsOf(const.im) << hw.size) + hw.bitsOf(const.re)

  override def valueOf(const: BigInt): Complex[T] = Complex(hw.valueOf(((BigInt(1)<<hw.size)-1) & const),hw.valueOf(const>>hw.size))(using hw.num)

  override def description: String = "complex number in cartesian form (real and imaginary part are concatenated, each being a "+hw.description+")"
}
