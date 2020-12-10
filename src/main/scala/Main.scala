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

import java.io.{FileInputStream, FileOutputStream, PrintWriter}
import java.util.zip.{ZipEntry, ZipOutputStream}

import SB._
import StreamingModule.StreamingModule
import _root_.SB.HardwareType._
import _root_.SPL.FFT.DFT
import _root_.SPL.WHT.WHT
import _root_.SPL._
import linalg.Fields.F2
import linalg._

import scala.collection.mutable

object Main extends App{
    val argsQ = mutable.Queue.from(args)

    var testbench: Boolean = false
    var graph: Boolean = false
    var rtlgraph: Boolean = false
    var dualPort: Boolean = false
    var zip=false


    var _n: Option[Int] = None

    def n_=(arg: Option[Int]): Unit = _n = arg

    def n: Int = _n match {
      case Some(n) => n
      case _ => throw new IllegalArgumentException("Parameter required: -n")
    }

    var _k: Option[Int] = None

    def k_=(arg: Option[Int]): Unit = _k = arg

    def k: Int = _k match {
      case Some(k) => k
      case _ => n
    }

    var _r: Option[Int] = None

    def r_=(arg: Option[Int]): Unit = _r = arg

    def r: Int = _r match {
      case Some(r) => r
      case _ => (1 to k).reverse.filter(n % _ == 0).head
    }

    var _hw: Option[HW[?]] = None

    def hw_=(arg: Option[HW[?]]): Unit = _hw = arg

    def hw: HW[?] = _hw match {
      case Some(k) => k
      case _ => Unsigned(16)
    }

    var _design: Option[StreamingModule[?]] = None

    def design_=(arg: StreamingModule[?]): Unit = _design = Some(arg)

    def design = _design match {
      case Some(d) => d
      case None => throw new IllegalArgumentException("No design has been specified")
    }

    var _filename: Option[String] = None

    def filename_=(arg: String): Unit = _filename = Some(arg)

    def filename(default: String) = _filename.getOrElse(default)


    def parseHW: Option[HW[?]] = argsQ.dequeue().toLowerCase() match {
      case "unsigned" => Numeric[Int].parseString(argsQ.dequeue()).map(Unsigned)
      case "signed" => Numeric[Int].parseString(argsQ.dequeue()).map(FixedPoint(_, 0))
      case "char" => Some(FixedPoint(8, 0))
      case "short" => Some(FixedPoint(16, 0))
      case "int" => Some(FixedPoint(32, 0))
      case "long" => Some(FixedPoint(64, 0))
      case "uchar" => Some(Unsigned(8))
      case "ushort" => Some(Unsigned(16))
      case "uint" => Some(Unsigned(32))
      case "ulong" => Some(Unsigned(64))
      case "fixedpoint" => for {
        magnitude <- Numeric[Int].parseString(argsQ.dequeue())
        fractional <- Numeric[Int].parseString(argsQ.dequeue())
      } yield FixedPoint(magnitude, fractional)
      case "flopoco" => for {
        wE <- Numeric[Int].parseString(argsQ.dequeue())
        wF <- Numeric[Int].parseString(argsQ.dequeue())
      } yield Flopoco(wE, wF)
      case "ieee754" => for {
        wE <- Numeric[Int].parseString(argsQ.dequeue())
        wF <- Numeric[Int].parseString(argsQ.dequeue())
      } yield IEEE754(wE, wF)
      case "half" => Some(IEEE754(5, 10))
      case "float" => Some(IEEE754(8, 23))
      case "double" => Some(IEEE754(11, 52))
      case "minifloat" => Some(IEEE754(4, 3))
      case "bfloat16" => Some(IEEE754(8, 7))
      case "complex" => parseHW.map(ComplexHW(_))
      case _ => None
    }

    io.Source.fromResource("logo.txt").getLines().foreach(println)
    io.Source.fromResource("lic.txt").getLines().foreach(println)

    while (argsQ.nonEmpty) argsQ.dequeue().toLowerCase match {
      case "-n" => n = Numeric[Int].parseString(argsQ.dequeue())
      case "-k" => k = Numeric[Int].parseString(argsQ.dequeue())
      case "-r" => r = Numeric[Int].parseString(argsQ.dequeue())
      case "-hw" => hw = parseHW
      case "-o" => filename = argsQ.dequeue()
      case "-testbench" => testbench = true
      case "-dualport" => dualPort = true
      case "-graph" => graph = true
      case "-rtlgraph" => rtlgraph = true
      case "-zip" => zip = true
      case "lp" =>
        val matrices = mutable.Queue[Matrix[F2]]()
        if (argsQ.isEmpty) throw new IllegalArgumentException("Invertible bit-matrices expected.")
        while (argsQ.nonEmpty) argsQ.dequeue() match {
          case "identity" => matrices.enqueue(Matrix.identity[F2](n))
          case "bitrev" => matrices.enqueue(Matrix.reverseIdentity[F2](n))
          case matrix if matrix.length == n * n => val mat = Matrix(n, n, matrix)
            if (mat.isInvertible)
              matrices.enqueue(mat)
            else
              throw new IllegalArgumentException(s"Matrix is not invertible:\n$mat")
          case mat: String => throw new IllegalArgumentException(s"Matrix is not invertible:\n$mat")
        }
        design = LinearPerm.stream(matrices.toSeq, k, hw, dualPort)
      case "wht" => design = WHT.stream(n, r, k, hw, dualPort)
      case "dft" => hw match {
        case hw: ComplexHW[Double@unchecked] if hw.innerHW.num.zero.isInstanceOf[Double] => design = DFT.stream(n, r, k, hw, dualPort)
        case _ => throw new IllegalArgumentException("DFT requires a complex of fractional hardware datatype.")
      }
      case "dftcompact" => hw match {
        case hw: ComplexHW[Double@unchecked] if hw.innerHW.num.zero.isInstanceOf[Double] => design = DFT.ItPeaseFused(n, r).stream(k)(hw)
        case _ => throw new IllegalArgumentException("Compact DFT requires a complex of fractional hardware datatype.")
      }
      case arg => throw new IllegalArgumentException("Unknown argument: " + arg)
    }

    if (graph)
      design match {
        case imp: SB[?] =>
          val file = filename("graph.gv")
          val pw = new PrintWriter(file)
          pw.write(imp.toGraph)
          pw.close()
          println(s"Written streaming block-level graph in $file.")
        case _ => throw new Exception("Graphs can only be generated for non-iterative designs.")
      }
    else if (rtlgraph) {
      val file = filename("rtl.gv")
      val pw = new PrintWriter(file)
      pw.write(design.toRTLGraph)
      pw.close()
      println(s"Written RTL-level graph in $file.")
    }
    else if(zip){
      val file = filename("design.zip")
      val archive=new ZipOutputStream(new FileOutputStream(file))
      archive.putNextEntry(new ZipEntry("design.v"))
      val pw=new PrintWriter(archive)
      pw.write("/*\n")
      io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.println(design.toVerilog)
      pw.flush()
      if (testbench) {
        archive.putNextEntry(new ZipEntry("benchmark.v"))
        pw.write("/*\n")
        io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
        io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
        pw.write(" */\n\n")
        pw.write(design.getTestBench())
        pw.flush()
      }
      design.dependencies.foreach{d=>
        val fis=new FileInputStream(d)
        archive.putNextEntry(new ZipEntry(d.split('/').last))
        fis.transferTo(archive)
        fis.close()
      }
      pw.close()
      println(s"Written zip file in $file.")
    }
    else {
      val file = filename("design.v")
      val pw = new PrintWriter(file)
      pw.write("/*\n")
      io.Source.fromResource("logo.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      io.Source.fromResource("license.txt").getLines().foreach(l => pw.write(s" * $l\n"))
      design.description.foreach(l=>pw.write(s" * $l\n"))
      pw.write(" */\n\n")
      pw.println(design.toVerilog)
      if (testbench)
        pw.write(design.getTestBench())
      pw.close()
      println(s"Written design in $file.")
    }
  }


