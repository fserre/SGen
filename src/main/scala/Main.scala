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

import backends.DOT.*
import backends.Verilog.*
import buildinfo.BuildInfo
import ir.rtl.hardwaretype.*
import ir.rtl.{AcyclicStreamingModule, RAMControl, StreamingModule}
import maths.fields.F2
import maths.linalg.Matrix
import transforms.Transform
import transforms.fft.{CTDFT, DFT, ICTDFT, IItPeaseFused, ItPeaseFused, Swap}
import transforms.perm.LinearPerm
import transforms.wht

import java.io.{BufferedInputStream, FileInputStream, FileOutputStream, PrintWriter}
import java.util.zip.{ZipEntry, ZipOutputStream}
import scala.collection.mutable
import transforms.perm.LinearPerm
import transforms.perm.LinearPerm.{*, given}

import scala.language.implicitConversions

object Main:
  def main(args: Array[String]):Unit =
    var testbench: Boolean = false
    var graph: Boolean = false
    var rtlgraph: Boolean = false
    var dualRAMControl: Boolean = false
    var singlePortedRAM: Boolean = false
    var zip = false
    var logo = true
    var scalingFactor = "1"

    var _n: Option[Int] = None
    def n: Int = _n match
      case Some(n) if n > 0 => n
      case Some(n) => throw new IllegalArgumentException(s"Parameter n should be a strictly positive integer.")
      case _ => throw new IllegalArgumentException("Parameter required: -n")
    def n_=(value:Int) = _n = Some(value)
    
    var _k: Option[Int] = None
    def k: Int = _k match
      case Some(k) if k > 0 && k <= n => k
      case Some(k) => throw new IllegalArgumentException(s"Parameter k should be a striclty positive integer lower or equal to n.")
      case _ => n
    def k_=(value:Int) = _k = Some(value)

    var _r: Option[Int] = None
    def r: Int = _r match
      case Some(r) if r > 0 && r <= n => r
      case Some(r) => throw new IllegalArgumentException(s"Parameter r should be a strictly positive integer lower or equal to n.")
      case _ => (1 to k).reverse.filter(n % _ == 0).head
    def r_=(value:Int) = _r = Some(value)

    var _hw: Option[HW[?]] = None
    def hw: HW[?] = _hw match
      case Some(k) => k
      case _ => Unsigned(16)
    def hw_=(value:HW[?]) = _hw = Some(value)


    var _filename: Option[String] = None
    def filename(default: String) = _filename.getOrElse(default)
    def filename_=(value:String) = _filename = Some(value)

    def control = if singlePortedRAM then RAMControl.SinglePorted else if dualRAMControl then RAMControl.Dual else RAMControl.Single

    def parseHW(argsQ:mutable.Queue[String]): Option[HW[?]] = argsQ.dequeue().toLowerCase() match
      case "unsigned" => Numeric[Int].parseString(argsQ.dequeue()).map(Unsigned.apply)
      case "signed" => Numeric[Int].parseString(argsQ.dequeue()).map(FixedPoint(_, 0))
      case "char" => Some(FixedPoint(8, 0))
      case "short" => Some(FixedPoint(16, 0))
      case "int" => Some(FixedPoint(32, 0))
      case "long" => Some(FixedPoint(64, 0))
      case "uchar" => Some(Unsigned(8))
      case "ushort" => Some(Unsigned(16))
      case "uint" => Some(Unsigned(32))
      case "ulong" => Some(Unsigned(64))
      case "fixedpoint" =>
        for
          magnitude <- Numeric[Int].parseString(argsQ.dequeue())
          fractional <- Numeric[Int].parseString(argsQ.dequeue())
        yield
          FixedPoint(magnitude, fractional)
      case "flopoco" =>
        for
          wE <- Numeric[Int].parseString(argsQ.dequeue())
          wF <- Numeric[Int].parseString(argsQ.dequeue())
        yield
          Flopoco(wE, wF)
      case "ieee754" =>
        for
          wE <- Numeric[Int].parseString(argsQ.dequeue())
          wF <- Numeric[Int].parseString(argsQ.dequeue())
        yield
          IEEE754(wE, wF)
      case "half" => Some(IEEE754(5, 10))
      case "float" => Some(IEEE754(8, 23))
      case "double" => Some(IEEE754(11, 52))
      case "minifloat" => Some(IEEE754(4, 3))
      case "bfloat16" => Some(IEEE754(8, 7))
      case "complex" => parseHW(argsQ).map(ComplexHW(_))
      case _ => None

    val argsQ = mutable.Queue.from(args)

    while argsQ.nonEmpty do argsQ.dequeue().toLowerCase match
      case "-n" => _n = Numeric[Int].parseString(argsQ.dequeue())
      case "-k" => _k = Numeric[Int].parseString(argsQ.dequeue())
      case "-r" => _r = Numeric[Int].parseString(argsQ.dequeue())
      case "-hw" => _hw = parseHW(argsQ)
      case "-o" => _filename = argsQ.removeHeadOption()
      case "-sf" => scalingFactor = argsQ.dequeue()
      case "-testbench" => testbench = true
      case "-dualramcontrol" => dualRAMControl = true
      case "-singleportedram" => singlePortedRAM = true
      case "-graph" => graph = true
      case "-rtlgraph" => rtlgraph = true
      case "-zip" => zip = true
      case "-nologo" => logo = false
      case "lp" =>
        val matrices = mutable.Queue[Matrix[F2]]()
        if (argsQ.isEmpty) throw new IllegalArgumentException("Invertible bit-matrices expected.")
        while (argsQ.nonEmpty) argsQ.dequeue() match
          case "identity" => matrices.enqueue(Matrix.identity[F2](n))
          case "bitrev" => matrices.enqueue(Matrix.reverseIdentity[F2](n))
          case matrix if matrix.length == n * n => val mat = Matrix(n, n, matrix)
            if mat.isInvertible then
              matrices.enqueue(mat)
            else
              throw new IllegalArgumentException(s"Matrix is not invertible:\n$mat")
          case mat: String => throw new IllegalArgumentException(s"Matrix is not invertible:\n$mat")
        finish(LinearPerm(matrices.toSeq), hw)
      case "bitrev" => finish(Rmat(r,n), hw)
      case "stride" => finish(Lmat(r,n), hw)
      case "wht" => finish(wht.CTWHT(n, r, hw.num.parseString(scalingFactor).get)(using hw.num), hw.asInstanceOf)
      case "whtcompact" => finish(wht.ItPeaseFused(n, r, hw.num.parseString(scalingFactor).get)(using hw.num), hw.asInstanceOf)
      case "dft" => hw match
        case hw: ComplexHW[Double@unchecked] => finish(CTDFT(n, r, hw.num.parseString(scalingFactor).get), hw)
        case _ => throw new IllegalArgumentException("DFT requires a complex of fractional hardware datatype.")
      case "dftcompact" => hw match
        case hw: ComplexHW[Double@unchecked] => finish(ItPeaseFused(n, r, hw.num.parseString(scalingFactor).get), hw)
        case _ => throw new IllegalArgumentException("Compact DFT requires a complex of fractional hardware datatype.")
      case "idft" => hw match
        case hw: ComplexHW[Double@unchecked] => finish(ICTDFT(n, r, hw.num.parseString(scalingFactor).get), hw)
        case _ => throw new IllegalArgumentException("iDFT requires a complex of fractional hardware datatype.")
      case "idftcompact" => hw match
        case hw: ComplexHW[Double@unchecked] => finish(IItPeaseFused(n, r, hw.num.parseString(scalingFactor).get), hw)
        case _ => throw new IllegalArgumentException("Compact iDFT requires a complex of fractional hardware datatype.")
      case "version" => println(BuildInfo.version)
      case arg => throw new IllegalArgumentException("Unknown argument: " + arg)
    if logo then
      print(Utils.readFromResources("logo"))
      print(Utils.readFromResources("lic"))

    def finish[T](design: Transform[T], hw: HW[T]): Unit =
      if logo then
        print(Utils.readFromResources("logo"))
        print(Utils.readFromResources("lic"))
      given HW[T] = hw
      val imp = design.stream(k, control)
      if graph then
        imp match
          case imp: AcyclicStreamingModule[?] =>
            val file = filename("graph.gv")
            val pw = new PrintWriter(file)
            pw.write(imp.toGraph)
            pw.close()
            println(s"Written streaming block-level graph in $file.")
          case _ => throw new Exception("Graphs can only be generated for non-iterative designs.")
      else if rtlgraph then
        val file = filename("rtl.gv")
        val pw = new PrintWriter(file)
        pw.write(design.stream(k, control).toRTLGraph)
        pw.close()
        println(s"Written rtl-level graph in $file.")
      else if zip then
        val file = filename("design.zip")
        val archive = new ZipOutputStream(new FileOutputStream(file))
        archive.setLevel(9)
        archive.putNextEntry(new ZipEntry("design.v"))
        val pw = new PrintWriter(archive)
        pw.write("/*\n")
        pw.write(Utils.readFromResources("version", " * "))
        pw.write(Utils.readFromResources("logo", " * "))
        pw.write(" */\n\n")
        pw.println(imp.toVerilog)
        pw.flush()
        archive.putNextEntry(new ZipEntry("readme.txt"))
        pw.write(Utils.readFromResources("version"))
        pw.write(Utils.readFromResources("logo"))
        pw.println("This archive contains the following files:")
        pw.println(" - readme.txt: this file,")
        imp.dependencies.foreach (d =>
          pw.println(s" - $d: a third party library used by the design,")
        )
        if testbench && design.testParams.isDefinedAt(hw) then
          pw.println(" - benchmark.v: a Verilog benchmark that can be used to test the design, and")
        pw.println(" - design.v: the design itself, in Verilog.")
        pw.println()
        pw.write(imp.description.mkString("\n"))
        pw.flush()
        if testbench then
          if design.testParams.isDefinedAt(hw) then
            archive.putNextEntry(new ZipEntry("benchmark.v"))
            pw.write("/*\n")
            pw.write(Utils.readFromResources("version", " * "))
            pw.write(Utils.readFromResources("logo", " * "))
            pw.write(" */\n\n")
            pw.write(imp.getTestBench(design))
            pw.flush()
          else
            println(s"Warning: no testbench generated as no test parameters are defined for $design on $hw.")
        imp.dependencies.foreach { d =>
          val fis = new FileInputStream(d)
          archive.putNextEntry(new ZipEntry(d.split('/').last))
          val bis = new BufferedInputStream(fis, 2048)
          val data = new Array[Byte](2048)
          var b = bis.read(data, 0, 2048)
          while b != -1 do
            archive.write(data, 0, b)
            b = bis.read(data, 0, 2048)
          bis.close()
          //fis.transferTo(archive)
          fis.close()
          archive.closeEntry()
        }
        pw.close()
        println(s"Written zip file in $file.")
      else
        val file = filename("design.v")
        val pw = new PrintWriter(file)
        pw.write("/*\n")
        pw.write(Utils.readFromResources("version", " * "))
        pw.write(Utils.readFromResources("logo", " * "))
        imp.description.foreach(l => pw.write(s" * $l\n"))
        pw.write(" */\n\n")
        pw.println(imp.toVerilog)
        if testbench then
          pw.write(imp.getTestBench(design))
        pw.close()
        println(s"Written design in $file.")




