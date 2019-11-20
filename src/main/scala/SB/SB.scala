/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB

import RTL.Component
import SB.HW.HW
import SPL.SPL
import SB.Signals._
import StreamingModule.StreamingModule

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

abstract class SB[U](t: Int, k: Int)(implicit hw:HW[U]) extends StreamingModule(t, k) {

  def implement(inputs: Seq[Sig[U]])(implicit sb: SB[_]): Seq[Sig[U]]

  /*override def *(rhs: StreamingModule[U]): StreamingModule[U] = {

    rhs match {

      case sb: SB[U] => ProductSB(this, sb)
      case _ => super.*(rhs)
    }
  }*/
  private val signals = new ArrayBuffer[Sig[_]]()
  private val refs = new mutable.HashMap[Sig[_], Int]()

  final def signal(i: Int) = signals(i)

  final def ref(sig: Sig[_]) = refs.getOrElseUpdate(sig, {
    val res = signals.size
    signals += sig
    res
  })

  final override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    implicit val sb = this
    val inputSigs = inputs.map(c => Input(c,hw,this))
    val inputIndexes = inputSigs.map(_.ref.i)
    val outputs = implement(inputSigs)
    val synch = mutable.HashMap[Int, Int]()
    val toImplement = mutable.Queue[Int]()
    outputs.foreach(cur => synch.put(cur.ref.i, cur.pipeline))
    assert(outputs.forall(_.sb == this))
    inputSigs.foreach(cur => synch.put(cur.ref.i, 0))
    toImplement.enqueueAll(outputs.map(_.ref.i))

    while (!toImplement.isEmpty) {
      val cur = toImplement.dequeue
      val curSig = signal(cur)
      curSig.parents.foreach { s: SigRef[_] =>
        val time = synch(cur) + curSig.latency + s.pipeline
        //println(time)
        synch.get(s.i) match {
          case Some(i) if i > time =>
          case _ => {
            synch.put(s.i, time)
            toImplement.enqueue(s.i)
          }
        }
      }
    }
    //println(synch)
    val latency = inputIndexes.map(synch).max
    inputIndexes.foreach(synch(_) = latency)
    _latency = Some(latency)
    val implemented = new mutable.HashMap[(Int, Int), Component]()

    def implementComp(time: Int)(ref: SigRef[_]): Component = ref.sig match {
      case Next() => token(latency - time)
      case Reset() => rst
      case _: Const[_] => implemented.getOrElseUpdate((ref.i, time), ref.implement(implementComp(time + ref.latency)))
      case _ => val diff = synch(ref.i) - time
        assert(diff >= 0)
        implemented.getOrElseUpdate((ref.i, time), if (diff == 0) {
          val res = ref.implement(implementComp(time + ref.latency))
          res.description = ref.sig.toString
          res
        } else
          implementComp(time + 1)(ref).register)
    }

    outputs.map(implementComp(0)(_))
  }

  private var _latency: Option[Int] = None

  final def latency = {
    if (_latency == None) outputs
    _latency.get
  }
}
