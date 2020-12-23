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


import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Unsigned}
import transforms.perm.{Steady, SwitchArray, Temporal}
import ir.rtl.{AcyclicProduct, StreamingModule,RAMControl}
import transforms.fft.DiagE
import linalg.Fields.{Complex, F2}
import linalg.{Matrix, Vec}
import backends.DOT._
import backends.Verilog._

import scala.sys.process._
import java.io.PrintWriter


/**
 * Class used for debugging
 */
object Debug extends App{
  val innerP4=Matrix(2,2,"1110")
  val innerP3=Matrix.zeros[F2](2,1)
  val r=2
  val k=1
  val t=2
  val p4=Matrix.identity[F2](r) oplus innerP4
  val p3=Matrix.zeros[F2](r,k)/innerP3
  val uut=Temporal(p3,p4,RAMControl.SinglePorted)(Unsigned(16))
  //val uut=Product(SwitchArray(Vector(v1),2)(Unsigned(16)), Steady(List(Matrix.reverseIdentity[F2](2)),2)(Unsigned(16)))
  uut.toVerilog
  uut.showGraph()
  print(test(uut))


  def test[U](sm:StreamingModule[U],repeat:Int=2, addedGap: Int = 0): Option[U] = {



    val xDir = "" // Path to Xilinx binaries can be put here, if it is not in the system path.
    val ext = if (System.getProperty("os.name").contains("Windows")) ".bat" else ""

    val outputs = sm.testBenchInput(repeat).grouped(sm.N).toSeq.zipWithIndex.flatMap { case (input, set) => sm.eval(input, set) }.map(sm.hw.valueOf)
    val pw=new PrintWriter("test.v")
    pw.write("/*\n")
    io.Source.fromResource("logo.txt").getLines().foreach(l =>pw.write(s" * $l\n"))
    io.Source.fromResource("license.txt").getLines().foreach(l =>pw.write(s" * $l\n"))
    pw.write(" */\n\n")
    pw.write(sm.toVerilog)
    pw.write(sm.getTestBench(repeat, addedGap))
    pw.close()

    val xvlog = (xDir + "xvlog" + ext + " test.v").!!
    sm.dependencies.foreach(filename => (xDir + "xvhdl" + ext + " " + filename).!!)
    val xelag = (xDir + "xelab" + ext + " test").!!
    val xsim = (xDir + "xsim" + ext + " work.test -R").!!
    if (!xsim.contains("Success.")) {
      println(xvlog)
      println(xelag)
      println(xsim)
      None
    }
    else
      Some(sm.outputs.indices.map(i => {
        val pos1 = xsim.indexOf("output" + i + ": ")
        val pos2 = xsim.indexOf(" ", pos1) + 1
        val pos3 = xsim.indexOf(" ", pos2)
        val res = sm.hw.valueOf(BigInt(xsim.slice(pos2, pos3)))
        val diff = sm.hw.num.minus(res, outputs(i))

        if (diff != 0) {
          println(i)
          println("expecting " + outputs(i))
          println(xsim.slice(pos2, pos3))
          println(BigInt(xsim.slice(pos2, pos3)))
          println(res)
          println()
        }
        sm.hw.num.times(diff, diff)
      }).sum(sm.hw.num))


  }
}
