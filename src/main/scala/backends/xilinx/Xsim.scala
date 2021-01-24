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

/**
 * Adds a Vivado XSim test to streaming modules 
 */
object Xsim:
  /**
   * Run XSim on the design
   * @param repeat Number of datasets that will be tested
   * @param addedGap Number of cycles to add between datasets, in addition to the gap required by the design
   * @return None if test threw an error, and Some(e) where e is:
   *         - if U is Fractional (e.g. Double), the sum of the square of the relative errors,
   *         - the sum of the absolute value of the difference  (e.g. Int).
  */
  extension[U] (sm: StreamingModule[U]) final def test(repeat: Int = 2, addedGap: Int = 0): Option[U] = 
      // computes the expected output
      val outputs = sm.testBenchInput(repeat).grouped(sm.N).toSeq.zipWithIndex.flatMap { case (input, set) => sm.eval(input, set) }.map(sm.hw.valueOf)
      // Write the design with testbench  
      val pw = new PrintWriter("test.v")
      pw.write("/*\n")
      io.Source.fromResource("testlogo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.write(sm.toVerilog)
      pw.write(sm.getTestBench(repeat, addedGap))
      pw.close()
      // Run the simulator  
      val xvlog=Xilinx.run("xvlog","test.v")
      sm.dependencies.foreach(filename => Xilinx.run("xvhdl",filename))
      val xelag = Xilinx.run("xelab","test")
      val xsim = Xilinx.run("xsim", "work.test -R")
      if !xsim.contains("Success.") then // there was a problem during the test => show output
        println(xvlog)
        println(xelag)
        println(xsim)
        None
      else
        Some(sm.outputs.indices.map(i => // Test was run without error => parse the results   
          val pos1 = xsim.indexOf("output" + i + ": ")
          val pos2 = xsim.indexOf(" ", pos1) + 1
          val pos3 = xsim.indexOf(" ", pos2)
          val res = sm.hw.valueOf(BigInt(xsim.slice(pos2, pos3)))
          sm.hw.num match
            case num: Fractional[U] =>
              import num._
              val diff = if res == outputs(i) then num.zero else (res - outputs(i)) / num.max(res, outputs(i))
              diff * diff
            case num =>
              import num._
              num.abs(res - outputs(i)) 
        ).sum(sm.hw.num))

