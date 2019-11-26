/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW.{ComplexHW, HW}
import linalg.Fields.Complex

case class Re[T:HW] private(input:SigRef[Complex[T]]) extends Sig[T](input){
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Tap(input,0 until hw.size)
  }
object Re{
  def apply[T:HW](input:Sig[Complex[T]])=input match{
    case Const(value) => Const(value.re)(input.hw.innerHW, input.sb)
    case Cpx(real,_)=>real
    case _ => new Re(input)
  }

  def unapply[T](arg: Sig[T]): Option[Sig[Complex[T]]] = arg match{
    case arg:Re[T]=>Some(arg.input)
    case _ => None
  }
}

case class Im[T:HW] private(input:SigRef[Complex[T]]) extends Sig[T](input){
  override def implement(implicit cp: SigRef[_] => Component): Component =new RTL.Tap(input,hw.size until (hw.size*2))

}

object Im{
  def apply[T:HW](input:Sig[Complex[T]])=input match{
    case Const(value) => Const(value.im)(input.hw.innerHW, input.sb)
    case Cpx(_,im)=>im
    case _ => new Im(input)
  }

  def unapply[T](arg: Sig[T]): Option[Sig[Complex[T]]] = arg match{
    case arg:Im[T]=>Some(arg.input)
    case _ => None
  }
}


case class Cpx[T] private (real:SigRef[T], im:SigRef[T])(implicit hw:HW[Complex[T]]) extends Sig[Complex[T]](real,im){
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Concat(Vector(im,real))

}
object Cpx{
  def apply[T](real:Sig[T],im:Sig[T])(implicit hw:HW[Complex[T]]):Sig[Complex[T]]= (real,im) match{
    case (Const(re), Const(im)) => Const(Complex(re, im)(real.hw.num))(ComplexHW(real.hw), real.sb)
    case (Re(cpxReal),Im(cpxIm)) if cpxReal==cpxIm => cpxReal
    case _ => new Cpx(real,im)
  }

  def unapply[T](arg: Sig[Complex[T]]): Option[(Sig[T], Sig[T])] = arg match{
    case arg:Cpx[Complex[T]] => Some((arg.real,arg.im))
    case _ => None
  }
}