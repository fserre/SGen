/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB.Signals

import RTL.Component
import SB.HW.{HW, Unsigned}
import SB.SB

case class Mux[U] private(address: SigRef[Int], inputs: Seq[SigRef[U]]) extends Sig[U](address +: inputs: _*)(inputs.head.hw) {
  override def implement(implicit cp: SigRef[_] => Component): Component = new RTL.Mux(address, inputs.map(cp))
  override val pipeline = 1
}

object Mux {
  def apply[U](address: Sig[Int], inputs: Seq[Sig[U]]): Sig[U] = {
    val hw = inputs(0).hw
    implicit val sb=address.sb
    require(inputs.forall(_.hw == hw))
    address match {
      case Const(value) => (inputs(value))
      case _ => inputs match {
        case _ if inputs.toSet.size == 1 => inputs(0)
        case Seq(Mux(adrl, Seq(ll, lr)), Mux(adrr, Seq(rl, rr))) if adrl.hw.size == 1 && adrr.hw.size == 1 => Mux(adrl :: adrr, Seq(rl, rr, ll, lr))
        case _ => (0 until address.hw.size).find(pos => (0 until inputs.size).forall(i => {
          val j = i | (1 << pos)
          j >= inputs.size || inputs(i) == inputs(j)
        })) match {
          case Some(pos) =>
            val control = address(pos + 1 until address.hw.size) :: address(0 until pos)
            Mux(control, (0 until inputs.size).filter(i => (i & (1 << pos)) == 0).map(inputs(_)))

          case _ => if (hw.isInstanceOf[Unsigned]) (0 until hw.size).find(i => {
            val ref = inputs(0).asInstanceOf[Sig[Int]](i)
            inputs.forall(_.asInstanceOf[Sig[Int]](i) == ref)
          }) match {
            case Some(pos) =>
              val part1=Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](pos + 1 until hw.size)))
              val part2=inputs(0).asInstanceOf[Sig[Int]](pos)
              val part3=Mux(address, inputs.map(_.asInstanceOf[Sig[Int]](0 until pos)))
              val res=part1::part2::part3
              res.asInstanceOf[Sig[U]]
            case _ => if (address.hw == hw && inputs.zipWithIndex.forall(i => i._1 == Const(i._2)(address.hw,sb)))
              address.asInstanceOf[Sig[U]]

            else
              new Mux(address, inputs.map(_.ref))
          } else
            new Mux(address, inputs.map(_.ref))
        }
      }
    }
  }

  def unapply[U](arg: Sig[U]): Option[(Sig[Int], Seq[Sig[U]])] = arg match {
    case arg: Mux[U] => Some((arg.address.sig, arg.inputs.map(_.sig)))
    case _ => None
  }
}

object ROM {
  def apply[U](values: Seq[U], addr: Sig[Int])(implicit hw:HW[U],sb:SB[_]) = Mux(addr, values.map(v => Const(v)))
}