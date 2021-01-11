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
import java.nio.file.{Files, Paths}
import scala.sys.process._

object Xilinx:
  private lazy val xDir = 
    if !Files.exists(Paths.get("xilinx.txt")) then
      println("To perform tests using simulator, please provide the path to Xilinx binaries in the file xilinx.txt.")
      println("For instance:")
      println("""echo c:\xilinx\Vivado\2020.1\bin\ > xilinx.txt""")
      System.exit(0)
    val source = io.Source.fromFile("xilinx.txt")
    val res = source.getLines().next()
    source.close()
    res.trim
  
  private val ext = if (System.getProperty("os.name") contains "Windows") ".bat" else ""
  
  def run(command: String, param: String = "") =
    val commandLine = xDir + (if(xDir.last == '/' || xDir.last == '\\') "" else "/") + command + xDir + " " + param
    commandLine.!!
