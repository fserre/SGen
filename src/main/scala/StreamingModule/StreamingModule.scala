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

package StreamingModule

import java.io.PrintWriter

import RTL.{Component, Input, Module, Output, Wire}
import SB.HW.HW
import SPL.SPL

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


  def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component]

  def latency: Int

  def minGap = 0


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

  def getTestBench(repeat: Int=2, addedGap: Int = 0): String = {

    val input=testBenchInput(repeat)

    //val input = Vector.tabulate(repeat)(set => Vector.tabulate[Int](N)(i => i * 100 + set * 1000))
    //val input = Vector.tabulate(repeat)(set => Vector.tabulate[BigInt](N)(i => 0))


    var res = new StringBuilder
    res ++= "module test;\n"
    res ++= "    reg clk,rst,next;\n"
    dataInputs.foreach(res ++= "    reg [" ++= (busSize - 1).toString ++= ":0] " ++= _.name ++= ";\n")
    res ++= "    wire next_out;\n"
    dataOutputs.foreach(res ++= "    wire [" ++= (busSize - 1).toString ++= ":0] " ++= _.name ++= ";\n")
    res ++= "\n"
    res ++= " //Clock\n"
    res ++= "    always\n"
    res ++= "      begin\n"
    res ++= "        clk <= 0;#50;\n"
    res ++= "        clk <= 1;#50;\n"
    res ++= "      end\n"
    res ++= "\n"
    res ++= "//inputs\n"
    res ++= "    initial\n"
    res ++= "      begin\n"
    res ++= "        @(posedge clk);\n"
    res ++= "        next <= 0;\n"
    (0 to (latency - nextAt)).foreach(_ => res ++= "        @(posedge clk);\n")
    res ++= "        rst <= 1;\n"
    res ++= "        @(posedge clk);\n"
    res ++= "        @(posedge clk);\n"
    res ++= "        rst <= 0;\n"
    (Math.min(nextAt, 0) until Math.max((T + minGap + addedGap) * repeat, (T + minGap + addedGap) * (repeat - 1) + nextAt + 4)).foreach(cycle => {
      res ++= "        @(posedge clk); //cycle " ++= cycle.toString ++= "\n"
      if ((cycle - nextAt) >= 0 && (cycle - nextAt) % (T + minGap + addedGap) == 0 && (cycle - nextAt) / (T + minGap + addedGap) < repeat)
        res ++= "        next <= 1;\n"
      if ((cycle - nextAt + 1) >= 0 && (cycle - nextAt) % (T + minGap + addedGap) == 1 && (cycle - nextAt) / (T + minGap + addedGap) < repeat)
        res ++= "        next <= 0;\n"
      val set = cycle / (T + minGap + addedGap)
      val c = cycle % (T + minGap + addedGap)
      if (set < repeat && cycle >= 0 && c < T) {
        if (c == 0)
          res ++= "        //dataset " + set + " enters.\n"
        dataInputs.zipWithIndex.foreach(i => res ++= "        " ++= i._1.name ++= " <= " ++= hw.size.toString ++= "'d" ++=  input(set * N + c * K + i._2).toString ++= ";\n")
      }
    })

    res ++= "      end\n"
    res ++= "    initial\n"
    res ++= "      begin\n"
    res ++= "        @(posedge next_out);//#100;\n"
    res ++= "        #50;\n"
    //if (check) {
    val output = input.grouped(N).toSeq.zipWithIndex.flatMap { case (input, set) => eval(input, set) }
    (0 until repeat).foreach(r => {
      (0 until T).foreach(c => {
        (0 until K).foreach(i => {
          res ++= "        $display(\"output" ++= (r * T * K + c * K + i).toString ++= ": %0d (expected: " ++= output(r * N + c * K + i).toString ++= ")\"," ++= dataOutputs(i).name ++= ");\n"
          //res ++= "        if(^" ++= inputs(i).toString ++= "===1'bX) $finish();\n"
          //res ++= "        errorSum = errorSum + (" ++= output(r)(c * T + i).toString ++= "-" ++= outputs(i).name + ")*(" ++= output(r)(c * K + i).toString ++= "-" ++= outputs(i).name + ");\n"

        })

        res ++= "        #100;\n"
      })

      res ++= "        #" + (100 * (minGap + addedGap)) + "; //gap\n"
    })
    //}
    /*else {
      (0 until repeat).foreach(r => {
        (0 until (T)).foreach(c => {
          (0 until K).foreach(i => {
            res ++= "        $display(\"output" ++= (c * T + i).toString ++= ": %d \"," ++= dataOutputs(i).name ++= ");\n"
          })
          res ++= "        #100;\n"
        })
        res ++= "        #" + (100 * minGap) + "; //gap\n"
      })
    }*/
    res ++= "        $display(\"Success.\");\n"
    res ++= "        $finish();\n"
    res ++= "      end\n"
    res ++= "      " ++= name ++= " uut(clk,rst,next," ++= (0 until K).map(i => dataInputs(i).name).mkString(",") ++= ",next_out," ++= (0 until K).map(i => dataOutputs(i).name).mkString(",") ++= ");\n"
    res ++= "endmodule\n"
    res.toString
  }

  def test(repeat:Int=2, addedGap: Int = 0): Option[U] = {
    val xDir = if (System.getProperty("os.name") == "Windows 10") "C:\\Xilinx\\Vivado\\2020.1\\bin\\" else "/home/serref/Xilinx/Vivado/2014.4/bin/"
    val ext = if (System.getProperty("os.name") == "Windows 10") ".bat" else ""

    val outputs = testBenchInput(repeat).grouped(N).toSeq.zipWithIndex.flatMap { case (input, set) => eval(input, set) }.map(implicitly[HW[U]].valueOf)
    val pw=new PrintWriter("test.v")
    pw.write("/*\n")
    io.Source.fromResource("logo.txt").getLines().foreach(l =>pw.write(s" * $l\n"))
    io.Source.fromResource("license.txt").getLines().foreach(l =>pw.write(s" * $l\n"))
    pw.write(" */\n\n")
    pw.write(toVerilog)
    pw.write(getTestBench(repeat, addedGap))
    pw.close()

    val xvlog = (xDir + "xvlog" + ext + " test.v").!!
    dependencies.foreach(filename => (xDir + "xvhdl" + ext + " " + filename).!!)
    val xelag = (xDir + "xelab" + ext + " test").!!
    val xsim = (xDir + "xsim" + ext + " work.test -R").!!
    if (!xsim.contains("Success.")) {
      println(xvlog)
      println(xelag)
      println(xsim)
      None
    }
    else
      Some(outputs.indices.map(i => {
        val pos1 = xsim.indexOf("output" + i + ": ")
        val pos2 = xsim.indexOf(" ", pos1) + 1
        val pos3 = xsim.indexOf(" ", pos2)
        val res = implicitly[HW[U]].valueOf(BigInt(xsim.slice(pos2, pos3)))
        val diff = implicitly[HW[U]].num.minus(res, outputs(i))

        /*if (diff != 0) {
          println(i)
          println("expecting " + outputs(i))
          println(xsim.slice(pos2, pos3))
          println(BigInt(xsim.slice(pos2, pos3)))
          println(res)
          println()
        }*/
        implicitly[HW[U]].num.times(diff, diff)
      }).sum(implicitly[HW[U]].num))


  }

}

