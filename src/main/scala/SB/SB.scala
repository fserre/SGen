/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package SB

import java.io.PrintWriter

import RTL.Component
import SB.HW.HW
import SB.Signals._
import StreamingModule.StreamingModule

import sys.process._
import scala.collection.mutable


abstract class SB[U](t: Int, k: Int)(implicit hw:HW[U]) extends StreamingModule(t, k) {

  def implement(inputs: Seq[Sig[U]])(implicit sb: SB[_]): Seq[Sig[U]]

  private val signals = new mutable.ArrayBuffer[Sig[_]]()
  private val refs = new mutable.HashMap[Sig[_], Int]()
  private implicit val sb:SB[U] = this

  final def signal(i: Int):Sig[_] = signals(i)
  final def ref(sig: Sig[_]):Int = refs.getOrElseUpdate(sig, {
    val res = signals.size
    signals += sig
    res
  })

  final override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = {
    val inputSigs = inputs.map(c => Input(c,hw,this))
    val inputIndexes = inputSigs.map(_.ref.i)

    val outputs = implement(inputSigs)
    assert(outputs.forall(_.sb == this))

    val synch = mutable.HashMap[Int, Int]()
    outputs.foreach(cur => synch.put(cur.ref.i, cur.pipeline))
    inputSigs.foreach(cur => synch.put(cur.ref.i, 0))
    val toImplement = mutable.BitSet.fromSpecific(outputs.map(_.ref.i))
    while (toImplement.nonEmpty) {
      val cur = toImplement.last
      toImplement.remove(cur)
      val curSig = signal(cur)
      curSig.parents.foreach { case (s: SigRef[_], advance: Int) =>
        val time = synch(cur) + advance + s.pipeline
        //println(time)
        synch.get(s.i) match {
          case Some(i) if i > time =>
          case _ => synch.put(s.i, time)
                    toImplement.add(s.i)
        }
      }
    }

    val latency = inputIndexes.map(synch).max
    inputIndexes.foreach(synch(_) = latency)
    _latency = Some(latency)
    val implemented = new mutable.HashMap[(Int, Int), Component]()

    def implementComp(time: Int)(ref: SigRef[_], advance: Int): Component = {
      val advancedTime = time + advance
      ref.sig match {
        case Next() => token(latency - advancedTime)
        case Reset() => rst
        case _: Const[_] => implemented.getOrElseUpdate((ref.i, advancedTime), ref.implement(implementComp(advancedTime)))
        case _ => val diff = synch(ref.i) - advancedTime
          assert(diff >= 0)
          implemented.getOrElseUpdate((ref.i, advancedTime), if (diff == 0) {
            val res = ref.implement(implementComp(advancedTime))
            res.description = ref.sig.toString
            res
          } else
            implementComp(advancedTime)(ref, 1).register)
      }
    }

    outputs.map(implementComp(0)(_, 0))
  }

  def toGraph:String = {
    implicit val sb:SB[U] = this
    val inputSigs = dataInputs.map(c => Input(c, hw, this))

    val outputs = implement(inputSigs)
    val toProcess = mutable.Queue[Int]()
    val processed = mutable.BitSet()
    assert(outputs.forall(_.sb == this))
    toProcess.enqueueAll(outputs.map(_.ref.i))
    processed.addAll(outputs.map(_.ref.i))
    val res = new StringBuilder
    res ++= "digraph " + name + " {\n"
    res ++= "  rankdir=RL;\n"
    res ++= "  ranksep=1.5;\n"
    res ++= "  outputs[shape=record,label=\"" + outputs.indices.map(i => "<o" + i + "> " + i + " ").mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
    res ++= "  inputs[shape=record,label=\"" + inputSigs.zipWithIndex.map { case (p, i) => "<i" + p.ref.i + "> " + i + " " }.mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
    while (toProcess.nonEmpty) {
      val cur = toProcess.dequeue
      val curSig = signal(cur)
      curSig.parents.map(_._1).foreach(f =>
        if (!processed(f.i)) {
          processed.add(f.i)
          toProcess.enqueue(f.i)
        }

      )
    }
    val nodes = processed.toSeq.map(signal)
    res ++= nodes.map(s => s.graphDeclaration).mkString("\n")
    res ++= nodes.flatMap(s => s.graphNode).mkString("\n")
    res ++= outputs.zipWithIndex.map { case (s, i) => s.graphName + " -> outputs:o" + i + ";\n" }.mkString("")
    res ++= "}\n"
    res.toString()
  }

  def showGraph():String = {
    val graph = toGraph
    new PrintWriter("graph.gv") {
      write(graph)
      close()
    }
    "dot -Tpdf graph.gv -o graph.pdf".!!
    "cmd /c start graph.pdf".!!
  }

  private var _latency: Option[Int] = None

  final def latency: Int = {
    if (_latency.isEmpty) outputs
    _latency.get
  }
}
