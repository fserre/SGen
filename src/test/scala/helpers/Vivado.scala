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
import ir.rtl.StreamingModule

import java.io.PrintWriter
import java.nio.file.{Files, Paths}

/**
 * Adds Vivado specific measurements on streaming modules.
 */
object Vivado:
  /**
   * Synthesize a design using Vivado, and returns measures after place and route
   * @param number A number appended at the end of filenames (to allow synthesize over several threads)
   * @returns a 5-uplet (number of slices, number of block-RAM, longest path in ns, number of DSP slices, power in W)
   */
  extension[U] (sm: StreamingModule[U]) def synthetize(filename: String): Unit =
    Files.createDirectories(Paths.get(s"test/synth/$filename"))
    // Write the design in verilog
    val pw = PrintWriter(s"test/synth/$filename/test.v")
    pw.write("/*\n")
    pw.write(Utils.readFromResources("testlogo"," * "))
    pw.write(" */\n\n")
    pw.write(sm.toVerilog)
    pw.close()
    for dep <- sm.dependencies do
      val dst = Paths.get(s"test/synth/$filename/" + dep.split('/').last)
      if !Files.exists(dst) then
        Files.copy(Paths.get(dep), dst)
