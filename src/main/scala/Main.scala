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

import java.io.{BufferedInputStream, FileInputStream, FileOutputStream, PrintWriter}
import java.util.zip.{ZipEntry, ZipOutputStream}
import transforms._
import ir.rtl.{RAMControl, AcyclicStreamingModule, StreamingModule}
import ir.rtl.hardwaretype._
import transforms.fft.DFT
import transforms.perm.LinearPerm
import transforms.wht.WHT
import ir.spl._
import linalg.Fields.F2
import linalg._

import scala.collection.mutable
import backends.DOT._
import backends.Verilog._

object Main:
  def main(args: Array[String]) = 
    var testbench: Boolean = false
    var graph: Boolean = false
    var rtlgraph: Boolean = false
    var dualRAMControl: Boolean = false
    var singlePortedRAM: Boolean = false
    var zip = false
  
    var _n: Option[Int] = None
    def n: Int = _n match
      case Some(n) => n
      case _ => throw new IllegalArgumentException("Parameter required: -n")
  
    var _k: Option[Int] = None
    def k: Int = _k match 
      case Some(k) => k
      case _ => n
  
    var _r: Option[Int] = None
    def r: Int = _r match
      case Some(r) => r
      case _ => (1 to k).reverse.filter(n % _ == 0).head
  
    var _hw: Option[HW[?]] = None
    def hw: HW[?] = _hw match 
      case Some(k) => k
      case _ => Unsigned(16)
  
    var _design: Option[StreamingModule[?]] = None
    def design = _design match 
      case Some(d) => d
      case None => throw new IllegalArgumentException("No design has been specified")
  
    var _filename: Option[String] = None
    def filename(default: String) = _filename.getOrElse(default)
  
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
    
    if !logoDisplayed then
      io.Source.fromResource("logo.txt").getLines().foreach(println)
      io.Source.fromResource("lic.txt").getLines().foreach(println)
      logoDisplayed = true

    while argsQ.nonEmpty do argsQ.dequeue().toLowerCase match 
      case "-n" => _n = Numeric[Int].parseString(argsQ.dequeue())
      case "-k" => _k = Numeric[Int].parseString(argsQ.dequeue())
      case "-r" => _r = Numeric[Int].parseString(argsQ.dequeue())
      case "-hw" => _hw = parseHW(argsQ)
      case "-o" => _filename = argsQ.removeHeadOption()
      case "-testbench" => testbench = true
      case "-dualramcontrol" => dualRAMControl = true
      case "-signleportedram" => singlePortedRAM = true
      case "-graph" => graph = true
      case "-rtlgraph" => rtlgraph = true
      case "-zip" => zip = true
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
        _design = Some(LinearPerm.stream(matrices.toSeq, k, hw, control))
      case "bitrev" => _design = Some(LinearPerm.stream(Seq(LinearPerm.Rmat(r,n)),k,hw,control))
      case "stride" => _design = Some(LinearPerm.stream(Seq(LinearPerm.Lmat(r,n)),k,hw,control))  
      case "wht" => _design = Some(WHT.stream(n, r, k, hw, control))
      case "whtcompact" => _design = Some(WHT.streamcompact(n, r, k, hw))
      case "dft" => hw match
        case hw: ComplexHW[Double@unchecked] => _design = Some(DFT.CTDFT(n, r).stream(k, control)(hw/*.asInstanceOf[ComplexHW[Double]]*/))
        case _ => throw new IllegalArgumentException("DFT requires a complex of fractional hardware datatype.")
      case "dftcompact" => hw match
        case hw: ComplexHW[Double@unchecked] => _design = Some(DFT.ItPeaseFused(n, r).stream(k, RAMControl.Dual)(hw/*.asInstanceOf[ComplexHW[Double]]*/))
        case _ => throw new IllegalArgumentException("Compact DFT requires a complex of fractional hardware datatype.")
      case arg => throw new IllegalArgumentException("Unknown argument: " + arg)
    

    if graph then
      design match
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
      pw.write(design.toRTLGraph)
      pw.close()
      println(s"Written rtl-level graph in $file.")
    else if zip then
      val file = filename("design.zip")
      val archive = new ZipOutputStream(new FileOutputStream(file))
      archive.putNextEntry(new ZipEntry("design.v"))
      val pw = new PrintWriter(archive)
      pw.write("/*\n")
      io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.println(design.toVerilog)
      pw.flush()
      archive.putNextEntry(new ZipEntry("readme.txt"))
      io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s"$l\n"))
      io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s"$l\n"))
      pw.println("This archive contains the following files:")
      pw.println(" - readme.txt: this file,")
      design.dependencies.foreach ((d) =>
        pw.println(s" - $d: a third party library used by the design,")
      )
      pw.println(" - benchmark.v: a Verilog benchmark that can be used to test the design, and")
      pw.println(" - design.v: the design itself, in Verilog.")
      pw.println
      pw.write(design.description.mkString("\n"))
      pw.flush()
      if testbench then
        archive.putNextEntry(new ZipEntry("benchmark.v"))
        pw.write("/*\n")
        io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
        io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
        pw.write(" */\n\n")
        pw.write(design.getTestBench())
        pw.flush()
      design.dependencies.foreach { d =>
        val fis = new FileInputStream(d)
        archive.putNextEntry(new ZipEntry(d.split('/').last))
        val bis = new BufferedInputStream(fis, 2048)
        var data = new Array[Byte](2048)
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
      io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      design.description.foreach(l => pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.println(design.toVerilog)
      if testbench then
        pw.write(design.getTestBench())
      pw.close()
      println(s"Written design in $file.")
  
  var logoDisplayed = false



