/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
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

package helpers
import backends.Verilog.*
import ir.rtl.{RAMControl, StreamingModule}
import ir.rtl.hardwaretype.HW
import transforms.Transform

import java.io.PrintWriter
import java.nio.file.{Files, Paths}

/**
 * Adds a Vivado XSim test to streaming modules
 */
object Xsim:
  var testCnt = 0

  /**
   * Run XSim on the design
   *
   * @param repeat   Number of datasets that will be tested
   * @param addedGap Number of cycles to add between datasets, in addition to the gap required by the design
   * @return None if test threw an error, and Some(e) where e is:
   *         - if U is Double or Complex[Double], the mean of the relative errors,
   *         - the sum of the absolute value of the difference otherwise.
   */
  extension [U](transform: Transform[U])
    def test(k: Int, dp: RAMControl, hw: HW[U], filename: String): Unit =
      // computes the expected output
      // val outputs = inputs.grouped(sm.N).toSeq.zipWithIndex.flatMap { case (input, set) => sm.eval(input, set) }.map(sm.hw.valueOf)
      // Write the design with testbench
      testCnt += 1
      //val dir=s"test/sim/test$testCnt"
      val dir = s"test/sim/$filename"
      val imp = transform.stream(k, dp)(using hw)
      val (testInputs, epsilon) = transform.testParams(hw)
      Files.createDirectories(Paths.get(dir))
      val pw = new PrintWriter(s"$dir/test.v")
      pw.write("/*\n")
      pw.write(Utils.readFromResources("testlogo", " * "))
      pw.write(" */\n\n")
      pw.write(imp.toVerilog)
      pw.write(imp.getTestBench(testInputs, filename, epsilon))
      pw.close()
      for dep <- imp.dependencies do
        val dst = Paths.get(s"$dir/${dep.split('/').last}")
        Files.copy(Paths.get(dep), dst)
