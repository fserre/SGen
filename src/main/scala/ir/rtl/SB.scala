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
import scala.sys.process._


abstract class SB[U](t: Int, k: Int)(implicit hw:HW[U]) extends StreamingModule(t, k):

  def implement(inputs: Seq[Sig[U]]): Seq[Sig[U]]

  final override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = 
    val inputSigs = inputs.map(c => Input(c,hw))

    val outputs = implement(inputSigs)

    val synch = mutable.HashMap[Sig[?], Int]()
    outputs.foreach(cur => synch.put(cur, cur.pipeline))
    inputSigs.foreach(cur => synch.put(cur, 0))
    var toImplement:Seq[Sig[?]] = outputs.distinct
    while toImplement.nonEmpty do
      toImplement = toImplement.flatMap(cur=>
        val curTime=synch(cur)
        cur.parents.flatMap ((s: Sig[?], advance: Int) =>
          val time = curTime + advance + s.pipeline
          synch.get(s) match 
            case Some(i) if i > time => None
            case _ =>
              synch.put(s, time)
              Some(s)
        )
      ).distinct
    
    val latency = inputSigs.map(synch).max
    inputSigs.foreach(synch(_) = latency)
    _latency = Some(latency)
    val implemented = new mutable.HashMap[(Sig[?], Int), Component]()

    def implementComp(time: Int)(ref: Sig[?], advance: Int): Component = 
      val advancedTime = time + advance
      ref match 
        case Next => token(latency - advancedTime)
        case Reset => rst
        case _: Const[?] => implemented.getOrElseUpdate((ref, advancedTime), ref.implement(implementComp(advancedTime)))
        case _ =>
          val diff = synch(ref) - advancedTime
          assert(diff >= 0)
          implemented.getOrElseUpdate((ref, advancedTime), 
            if diff == 0 then
              val res = ref.implement(implementComp(advancedTime))
              // res.description = ref.toString
              res
            else 
              implementComp(advancedTime)(ref, 1).register)
    outputs.map(implementComp(0)(_, 0))

  private var _latency: Option[Int] = None

  final def latency: Int = 
    if _latency.isEmpty then outputs
    _latency.get
  

