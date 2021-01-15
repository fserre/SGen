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

package ir.rtl

import ir.rtl.hardwaretype.HW
import ir.rtl.signals._
import ir.rtl.{Component, StreamingModule}

import java.io.PrintWriter
import scala.annotation.tailrec
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer
import scala.sys.process._


abstract class SB[U: HW](t: Int, k: Int) extends StreamingModule(t, k):
  def implement(inputs: Seq[Sig[U]]): Seq[Sig[U]]

  final lazy val inputSigs = (0 until K).map(c => Input(c))
  
  final lazy val outputSigs = implement(inputSigs)
  
  final lazy val synch =
    // First pass : extract the earliest cycle each signal needs to be available at
    val earliest = mutable.HashMap[Sig[?], Int]()
    outputSigs.foreach(cur => earliest.put(cur, cur.pipeline)) // each output needs to be available at time 0, plus the pipeline it requires
    inputSigs.foreach(cur => earliest.put(cur, 0)) // put the input signals (they need to be implemented, even if not used), initially at time 0
    // Process the (Sig) graph from outputs to inputs in a BFS manner (to reduce the number of time a given signal must be further "advanced")   
    @tailrec
    def firstPass(toProcess:Seq[Sig[?]]):Unit = if toProcess.nonEmpty then
      firstPass((
        for
          cur <- toProcess
          curTime = earliest(cur)
          (s, advance) <- cur.parents
          time = curTime + advance + s.pipeline
          res <- earliest.get(s) match
            case Some(i) if i > time => None
            case _ =>
              earliest.put(s, time)
              Some(s)
        yield
          res
      ).distinct)
    firstPass(outputSigs.distinct)

    val latency=inputSigs.map(earliest).max // get the latency (earliest time a signal must be available)
    inputSigs.foreach(earliest(_) = latency) // update all input signals
    _latency = Some(latency)
      
    // second pass: get all the times each signal is used  
    val res = earliest.map((cur, curTime) => (cur, mutable.BitSet(curTime)))
    for 
      (cur, curTime) <- earliest
      (s, advance) <- cur.parents
      time = curTime + advance + s.pipeline
    do
      res(s) += time
    res.map((cur,times)=>(cur,times.toSeq.sorted.reverse)).toMap

  final override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] =
    val implemented=mutable.HashMap.from[Sig[?],ArrayBuffer[Component]](inputSigs.zip(inputs.map(ArrayBuffer(_))))
    def implementComp(time: Int)(sig: Sig[?], advance: Int): Component =
      val requestedTime = time + advance
      sig match
        case Next => token(latency - requestedTime)
        case Reset => rst
        case sig:Const[?] => implemented.getOrElseUpdate(sig, ArrayBuffer(ir.rtl.Const(sig.hw.size, sig.bits))).head
        case _ =>
          val originalTime = synch(sig).head
          val components = implemented.getOrElseUpdate(sig, ArrayBuffer(sig.implement(implementComp(originalTime))))
          val diff = originalTime - requestedTime
          assert(diff >= 0)
          while components.size <= diff do
            components+=components.last.register
            components.last.hashCode
          val res=components(diff)
          res.hashCode
          res
    synch.toSeq.sortBy(- _._2.head).foreach((sig, times) => implementComp(times.head)(sig,0))  
    outputSigs.map(implementComp(0)(_, 0))

  private var _latency: Option[Int] = None

  final def latency: Int = 
    if _latency.isEmpty then synch
    _latency.get
