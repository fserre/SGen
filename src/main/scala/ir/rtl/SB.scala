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
    val res = mutable.HashMap[Sig[?], Int]()
    outputSigs.foreach(cur => res.put(cur, cur.pipeline))
    inputSigs.foreach(cur => res.put(cur, 0))
    var toImplement:Seq[Sig[?]] = outputSigs.distinct
    while toImplement.nonEmpty do
      toImplement = toImplement.flatMap(cur=>
        val curTime=res(cur)
        cur.parents.flatMap ((s: Sig[?], advance: Int) =>
          val time = curTime + advance + s.pipeline
          res.get(s) match
            case Some(i) if i > time => None
            case _ =>
              res.put(s, time)
              Some(s))).distinct
    val latency=inputSigs.map(res).max
    inputSigs.foreach(res(_) = latency)
    _latency = Some(latency)
    res.toMap

  final override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] =
    val implemented=mutable.HashMap.from[Sig[?],ArrayBuffer[Component]](inputSigs.zip(inputs.map(ArrayBuffer(_))))
    def implementComp(time: Int)(sig: Sig[?], advance: Int): Component =
      val requestedTime = time + advance
      sig match
        case Next => token(latency - requestedTime)
        case Reset => rst
        case sig:Const[?] => implemented.getOrElseUpdate(sig, ArrayBuffer(ir.rtl.Const(sig.hw.size, sig.bits))).head
        case _ =>
          val originalTime = synch(sig)
          val components = implemented.getOrElseUpdate(sig, ArrayBuffer(sig.implement(implementComp(originalTime))))
          val diff = originalTime - requestedTime
          assert(diff >= 0)
          while components.size <= diff do
            components+=components.last.register
            components.last.hashCode
          val res=components(diff)
          res.hashCode
          res
    val tmp=synch.toSeq.sortBy(- _._2)
    println(tmp.size)
    tmp.foreach((sig, time) => implementComp(time)(sig,0))  
    outputSigs.map(implementComp(0)(_, 0))
    /*val implemented = new mutable.HashMap[(Sig[?], Int), Component]()
    def implementComp(time: Int)(ref: Sig[?], advance: Int): Component =
      val advancedTime = time + advance
      ref match
        case Next => token(latency - advancedTime)
        case Reset => rst
        case Input(i) if advancedTime == latency => inputs(i)
        case sig:Const[?] => implemented.getOrElseUpdate((ref, 0), ir.rtl.Const(sig.hw.size, sig.bits))
        case _ =>
          val diff = synch(ref) - advancedTime
          assert(diff >= 0)
          println(diff)
          implemented.getOrElseUpdate((ref, advancedTime), if diff == 0 then ref.implement(implementComp(advancedTime)) else implementComp(advancedTime)(ref, 1).register)
    outputSigs.map(implementComp(0)(_, 0))*/
      

  private var _latency: Option[Int] = None

  final def latency: Int = 
    if _latency.isEmpty then synch
    _latency.get
