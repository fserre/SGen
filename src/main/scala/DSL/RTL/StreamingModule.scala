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

package DSL.RTL

import DSL.RTL.HardwareType.HW
import DSL.RTL._
import DSL.SPL.SPL

import java.io.PrintWriter
import scala.collection.mutable
import scala.sys.process._

abstract class StreamingModule[U](val t: Int, val k: Int)(implicit val hw: HW[U]) extends Module {
  val n: Int = t + k
  val N: Int = 1 << n
  val K: Int = 1 << k
  val T: Int = 1 << t

  def spl: SPL[U]

  val busSize: Int = implicitly[HW[U]].size


  override lazy val name: String = spl.getClass.getSimpleName.toLowerCase

  override def description: Iterator[String] = io.Source.fromResource("streaming.txt").getLines().
    filterNot(s=>(s.contains ("full-throughput")) && minGap!=0).
    filterNot(s=>(s.contains ("requires a delay")) && minGap==0).
    filterNot(s=>((s.contains ("single RAM control")) || (s.contains("additional cycles"))|| (s.contains ("-dualRAMcontrol"))) && !hasSinglePortedMem).
    map(_.
    replace("SIZE",N.toString).
    replace("DATADURATION",T.toString).
    replace("STREAMINGWIDTH",K.toString).
      replace("LATENCY",latency.toString).
      replace("TOTALGAP",(minGap+T).toString).
      replace("GAP",minGap.toString).
      replace("INPUTS",s"i0 - i${K-1}").
      replace("OUTPUTS",s"o0 - o${K-1}").
      replace("START",if(nextAt==0) "at the same time as" else if(nextAt>0) s"$nextAt cycles after" else s"${-nextAt} cycles before").
      replace("HW",hw.description)
  )
    /*filterNot(s=>(s contains "Computer Generation") && params("arch")!="full" && params("arch")!="iter").
    filterNot(s=>(s contains "Memory-Efficient") && params("arch")!="fused")*/

  def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component]

  def latency: Int

  def minGap = 0

  def hasSinglePortedMem:Boolean=false

  lazy val dataInputs: Vector[Input] = Vector.tabulate(K)(i => new Input(busSize, "i" + i))
  val reset = new Input(1, "reset")
  val next = new Input(1, "next")

  def *(rhs: StreamingModule[U]): StreamingModule[U] = Product(this, rhs)

  override lazy val inputs: Seq[Input] = reset +: next +: dataInputs
  override lazy val outputs: Seq[Output] = {
    val tokens = mutable.Map[Int, Wire]()

    def getToken(time: Int) = tokens.getOrElseUpdate(time, Wire(1))

    val res = implement(reset, getToken, dataInputs).zipWithIndex.map { case (comp, i) => new Output(comp, "o" + i) }
    val next_out = new Output(getToken(latency), "next_out")

    val minTime = tokens.keys.min
    val maxTime = tokens.keys.max
    val tokenComps: Vector[Component] = Vector.iterate[Component](next, maxTime - minTime + 1)(_.register)
    //, tokenComps(time-tokens.keys.min)
    tokens.foreach { case (time, wire) => wire.input = tokenComps(time - minTime) }
    _nextAt = Some(minTime)

    next_out +: res
  }
  lazy val dataOutputs: Seq[Output] = outputs.drop(1)
  lazy val next_out: Output = outputs.head
  private var _nextAt: Option[Int] = None

  def nextAt: Int = {
    if (_nextAt.isEmpty) outputs
    _nextAt.get
  }

  def eval(inputs: Seq[BigInt], set: Int): Seq[BigInt] = spl.eval(inputs.map(hw.valueOf), set).map(hw.bitsOf)

  def testBenchInput(repeat:Int): Seq[BigInt]=(0 until repeat*N).map(i=>hw.bitsOf(hw.num.fromInt(i)))


}


