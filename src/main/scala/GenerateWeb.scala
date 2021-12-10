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


import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Flopoco, HW, IEEE754, Unsigned}
import transforms.perm.{LinearPerm, SmallTemporal, Spatial, Steady, SwitchArray, Temporal}
import ir.rtl._
import transforms.fft.{Butterfly, DFT, DiagE}
import linalg.Fields.{Complex, F2}
import linalg.{Matrix, Vec}
import backends.DOT._
import backends.SVG._
import backends.Verilog._
import backends.xilinx.Vivado._
import backends.xilinx.Xsim._
import transforms.wht.WHT

import collection.parallel.CollectionConverters.VectorIsParallelizable
import scala.sys.process._
import java.io.PrintWriter


/**
 * Script to generate all the elements used in the different websites.
 */
object GenerateWeb extends App:
  if System.getProperty("os.name") contains "Windows" then
    transforms.fft.DFT(0,3).writeSVG("img/dft8basic.svg")
    transforms.fft.DFT(1,2).writeSVG("img/dft8s4basic.svg")
    transforms.fft.DFT(2,1).writeSVG("img/dft8s2basic.svg")
    transforms.fft.DFT.CTDFT(3,1,1).stream(3,RAMControl.Single)(using ComplexHW(FixedPoint(16,0))).writeSVG("dft8.svg")
    transforms.fft.DFT.CTDFT(3,1,1).stream(2,RAMControl.Single)(using ComplexHW(FixedPoint(16,0))).writeSVG("dft8s4.svg")
    transforms.fft.DFT.CTDFT(3,1,1).stream(1,RAMControl.Single)(using ComplexHW(FixedPoint(16,0))).writeSVG("dft8s2.svg")
    val graphDesign = transforms.fft.DFT.CTDFT(3,1,1).stream(1,RAMControl.Single)(using ComplexHW(FixedPoint(16,0))).asInstanceOf[AcyclicStreamingModule[Complex[Double]]]
    graphDesign.showGraph
    graphDesign.showRTLGraph
  else
    val designSpace =
      (for
        transform <- Vector("dft", "dftcompact", "wht", "whtcompact")
        n <- 1 to 15
        k <- 1 to Math.min(n,8)
        r <- 1 to k
        if n % r == 0
        hw <- Vector("char","short","int","long","half","float","double","bfloat16")
      yield
        (transform, n, k, r, hw)) ++
      (for
        transform <- Vector("bitrev", "stride")
        n <- 2 to 15
        k <- 1 to Math.min(n,8)
        r <- 1 to n-1
        if transform=="stride" || n % r == 0
        hw <- Vector("char","short","int","long","half")
      yield
        (transform, n, k, r, hw))

    for n <- 1 to 15 do
      println(s"Generating for n=$n")
      println(s"-------------------")
      println
      designSpace.filter((_,_n,_,_,_) => n == _n).par.foreach((transform, n, k, r, hw) =>
        val name = s"$transform-$n-$k-$r-$hw"
        Main.main(s"-zip -o $name.zip -testbench -n $n -k $k -r $r -hw ${if (transform contains "wht") || (transform contains "dft") then "complex " else ""}$hw $transform".split(" "))
      )

    // tests small designs using Xilinx XSim
    designSpace.filter((_,n,_,_,_) => n<8).foreach((transform, n, k, r, hw) =>
      val name = s"$transform-$n-$k-$r-$hw"
      val rhw:HW[Double] =
        if hw == "char" then
          FixedPoint(4, 4)
        else if hw == "short" then
          FixedPoint(8, 8)
        else if hw == "int" then
          FixedPoint(16, 16)
        else if hw == "long" then
          FixedPoint(32, 32)
        else if hw == "half" then
          IEEE754(5, 10)
        else if hw == "float" then
          IEEE754(8, 23)
        else if hw == "double" then
          IEEE754(11, 52)
        else
          IEEE754(8, 7)
      print(name + " - ")
      val uut=
        if transform=="dft" then
          DFT.CTDFT(n,r,1).stream(k,RAMControl.Single)(using ComplexHW(rhw))
        else if transform=="dftcompact" then
          DFT.ItPeaseFused(n,r,1).stream(k,RAMControl.Dual)(using ComplexHW(rhw))
        else if transform=="wht" then
          WHT.stream(n,r,k,ComplexHW(rhw),RAMControl.Single)
        else if transform=="whtcompact" then
          WHT.streamcompact(n,r,k,ComplexHW(rhw))
        else if transform=="stride" then
          LinearPerm.stream(Seq(LinearPerm.Lmat(r,n)),k,rhw,RAMControl.Single)
        else //bitrev
          LinearPerm.stream(Seq(LinearPerm.Rmat(r,n)),k,rhw,RAMControl.Single)
      println(uut.test())
    )

