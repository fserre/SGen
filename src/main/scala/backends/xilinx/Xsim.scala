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

package backends.xilinx

import backends.xilinx.Xilinx
import backends.Verilog._
import ir.rtl.StreamingModule

import java.io.PrintWriter
import java.nio.file.{Files, Paths}


object Xsim:
  extension[U] (sm: StreamingModule[U]) def test(repeat: Int = 2, addedGap: Int = 0): Option[U] = 
      val outputs = sm.testBenchInput(repeat).grouped(sm.N).toSeq.zipWithIndex.flatMap { case (input, set) => sm.eval(input, set) }.map(sm.hw.valueOf)
      val pw = new PrintWriter("test.v")
      pw.write("/*\n")
      io.Source.fromResource("testlogo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.write(sm.toVerilog)
      pw.write(sm.getTestBench(repeat, addedGap))
      pw.close()
      val xvlog=Xilinx.run("xvlog","test.v")
      sm.dependencies.foreach(filename => Xilinx.run("xvhdl",filename))
      val xelag = Xilinx.run("xelab","test")
      val xsim = Xilinx.run("xsim", "work.test -R")
      if !xsim.contains("Success.") then
        println(xvlog)
        println(xelag)
        println(xsim)
        None
      else
        Some(sm.outputs.indices.map(i => 
          val pos1 = xsim.indexOf("output" + i + ": ")
          val pos2 = xsim.indexOf(" ", pos1) + 1
          val pos3 = xsim.indexOf(" ", pos2)
          val res = sm.hw.valueOf(BigInt(xsim.slice(pos2, pos3)))
          val diff = sm.hw.num.minus(res, outputs(i))
          sm.hw.num.times(diff, diff)
        ).sum(sm.hw.num))
