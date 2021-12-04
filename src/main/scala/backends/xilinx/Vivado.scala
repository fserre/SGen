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
import scala.util.{Success, Try}
import backends.Verilog._
import java.io.PrintWriter
import ir.rtl.StreamingModule
import backends.xilinx.Xilinx

/**
 * Adds Vivado specific measurements on streaming modules.
 */
object Vivado:
  /**
   * Synthesize a design using Vivado, and returns measures after place and route
   * @param number A number appended at the end of filenames (to allow synthesize over several threads)
   * @returns a 5-uplet (number of slices, number of block-RAM, longest path in ns, number of DSP slices, power in W)
   */
  extension[U] (sm: StreamingModule[U]) def synthetize(number: Int = 0) =
    // Write the design in verilog
    var pw = PrintWriter(s"test$number.v")
    pw.write("/*\n")
    io.Source.fromResource("testlogo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
    pw.write(" */\n\n")
    pw.write(sm.toVerilog)
    pw.close()
    // Write a TCL command batch
    val dependencies=sm.dependencies.map("read_vhdl ./"+_).mkString("\n")
    pw = PrintWriter("test" + number + ".tcl")
    pw.write(
      s"""proc reportCriticalPaths {} {
        |foreach path [get_timing_paths -delay_type max -max_paths 1 -nworst 1] {
        |# Get the slack on the Timing Path object
        |set slack [get_property SLACK $$path]
        |# Save the collected path details to the CSV file
        |puts "Worst slack: $$slack"
        |}
        |return 0
        |}; # End PROC
        |# STEP#2: setup design sources and constraints
        |#
        |read_verilog ./test$number.v
        |$dependencies
        |read_xdc ./clock$number.xdc
        |#
        |# STEP#3: run synthesis, write design checkpoint, report timing,
        |# and utilization estimates
        |#
        |synth_design -top ${sm.name} -part xc7vx1140tflg1930-2
        |# STEP#4: run logic optimization, placement and physical logic optimization,
        |# write design checkpoint, report utilization and timing estimates
        |#
        |opt_design
        |reportCriticalPaths
        |place_design
        |#
        |# Optionally run optimization if there are timing violations after placement
        |#if {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
        |# puts "Found setup timing violations => running physical optimization"
        |# phys_opt_design
        |#}
        |puts ""
        |puts ""
        |puts ""
        |report_utilization
        |puts ""
        |puts ""
        |puts ""
        |report_power
        |puts ""
        |puts ""
        |puts ""
      """.stripMargin)
    pw.close()


    var bestSlices = Int.MaxValue
    var bestBram = Float.MaxValue
    var bestLp = Float.MaxValue
    var bestDsp = Int.MaxValue
    var bestPower = Float.MaxValue
    // Run place and route 3 times, and pick the best values.
    for _ <- 0 until 3 do
      // Write a configuration for the clock
      pw = PrintWriter("clock" + number + ".xdc")
      pw.write("create_clock -name Clock -period " + (if (bestLp == Float.MaxValue) 1 else bestLp) + " [get_ports clk]\n")
      pw.close()
      // Run vivado, and parse the result (in an ugly way )
      Try(Xilinx.run("vivado", s"-source test$number.tcl -mode batch -notrace")) match
        case Success(synth) =>
          //val synth2 = synth.flatMap(c => if (c == '\r') None else Some(c))
          val synth2 = synth.replace("\r","")
          //println(synth)
          val pos1 = synth2.indexOf("\nWorst slack: ")
          val str1 = synth2.drop(pos1 + 14)
          val pos2 = str1.indexOf("\n")
          val str2 = str1.take(pos2)
          val lp = (if (bestLp == Float.MaxValue) 1 else bestLp) - str2.toFloat
          val pos3 = str1.indexOf(" | ", str1.indexOf(" Slice ", str1.indexOf("2. Slice Logic Distribution\n---------------------------\n") + 48) + 7) + 3
          val str3 = str1.drop(pos3)
          val pos4 = str3.indexOf(" | ")
          val str4 = str3.take(pos4).trim
          val slices = str4.toInt
          val pos5 = str3.indexOf(" | ", str3.indexOf(" Block RAM Tile ") + 16) + 3
          val str5 = str3.drop(pos5)
          //println(str5)
          val pos6 = str5.indexOf(" | ")
          val str6 = str5.take(pos6).trim
          val bram = str6.toFloat
          val pos7 = str1.indexOf(" | ", str1.indexOf(" DSPs ", str1.indexOf(". DSP\n------\n") + 13) + 6) + 3
          val str7 = str1.drop(pos7)
          val pos8 = str7.indexOf(" | ")
          val str8 = str7.take(pos8).trim
          val dsps = str8.toInt
          val pos9 = str1.indexOf(" | ", str1.indexOf(" Total On-Chip Power (W) ") + 6) + 3
          val str9 = str1.drop(pos9)
          val pos10 = str9.indexOf(" |")
          val str10 = str9.take(pos10).trim
          val power = str10.toFloat
          //println(lp + " " + slices + " " + bram)
          if (bestLp > lp) bestLp = lp
          if (bestSlices > slices) bestSlices = slices
          if (bestPower > power) bestPower = power
          if (bestBram > bram) bestBram = bram
          if (bestDsp > dsps) bestDsp = dsps
        case _ =>
    (bestSlices, bestBram, bestLp, bestDsp, bestPower)
