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

package backends

import ir.rtl.hardwaretype.{ComplexHW, FixedPoint, Unsigned}
import ir.rtl._
import transforms.fft.{Butterfly, DFT, DiagE}
import linalg.Vec
import transforms.perm.{LinearPerm, SmallTemporal}

import java.io.PrintWriter
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer
import sys.process._

/**
 * SVG animations output (currently under construction)
 */
object SVG:
  val unit=50

  class Element(x: Int, y: Int, color: String):
    val path=ArrayBuffer[(Int,Int)]((x - Element.radius, y - Element.radius))
    def moveTo(x:Int,y:Int) = path += ((x - Element.radius, y - Element.radius))
    def stay = path += path.last
    def move(dx: Int=0, dy: Int=0) = path += ((dx + path.last._1, dy + path.last._2))
    def apply(sb: mutable.StringBuilder)=
      sb ++= s"""<rect x="0" y="0" width="${Element.size}" height="${Element.size}" stroke="#000" style="fill:#${color}" rx="5">\n"""
      sb ++= s"""<animateMotion dur="${path.size/4}s" values="${path.map((x,y)=>s"$x,$y").mkString(";")}" calcMode="linear" repeatCount="indefinite"/>\n"""
      sb ++= s"""</rect>\n"""

  object Element:
    var n = 0
    val size = unit/3
    val radius = size/2
    val colors = Vector("2f75b6", "df5963", "5bd59b", "1f407a", "505050", "b7e0f4", "1f407a", "3c3c3c", "def7de", "a1e47e", "FFF")
    def apply(x:Int, y:Int) =
      n = n + 1
      new Element(x, y, colors(n % colors.size))

  def animate[T](sm: StreamingModule[T], el:Seq[Element], set:Int): Seq[Element] = sm match
    case Product(list) =>
      var cur = el
      for(i <- list.indices.reverse)
        cur=animate(list(i),cur,set)
        if i > 0 then
          cur.foreach(_.move(unit))
      cur
    case AcyclicProduct(list) =>
      var cur = el
      for(i <- list.indices.reverse)
        cur = animate(list(i), cur, set)
        if i > 0 then
          cur.foreach(_.move(unit))
      cur
    case transforms.perm.Steady(p1, t) =>
      (0 until sm.N).foreach(i =>
        val p = i % sm.K
        el(i).move(unit, unit * (LinearPerm.permute(p1.head, p) - p)))
      el.grouped(sm.K).toSeq.flatMap(LinearPerm.permute(p1.head, _))
    case transforms.perm.SwitchArray(v, k) =>
      el.grouped(2).zipWithIndex.flatMap{case (Seq(e1, e2), hi) =>
        val c = hi * 2 / sm.K
        val cv = Vec.fromInt(sm.t, c)
        val res = cv scalar v.head
        if res.value then
          e1.move(unit, unit)
          e2.move(unit, -unit)
          Vector(e2, e1)
        else
          e1.move(unit)
          e2.move(unit)
          Vector(e1, e2)
      }.toSeq
    case transforms.perm.SmallTemporal(v3, v4) =>
      val res=Array.fill(sm.N)(el.head)
      (0 until sm.N).foreach(i =>
        val c = i / sm.K
        val p = i % sm.K
        val basis = v4(set) scalar Vec.fromInt(sm.t - 1, c / 2)
        val offset = v3(set) scalar Vec.fromInt(sm.k, p)
        if (basis + offset).value then
          if (c & 1) == 0 then // even cycle
            res(i + sm.K) = el(i)
            el(i).move(6 * unit / 10)
            el(i).move(8 * unit / 10)
            el(i).stay
            el(i).move(6 * unit / 10)
            el(i).stay
          else
            res(i - sm.K) = el(i)
            el(i).move(dy = Element.size)
            el(i).move(2 * unit)
            el(i).move(dy = -Element.size)
        else
          res(i) = el(i)
          el(i).move(6 * unit/10)
          el(i).move(dy = Element.size)
          el(i).move(14 * unit/10)
          el(i).move(dy = -Element.size))
      res.toSeq
    case sm@transforms.perm.Temporal(p3, p4, _) =>
      val res=Array.fill(sm.N)(el.head)
      (0 until sm.N).foreach(i =>
        val c = i / sm.K
        val p = i % sm.K
        val s = (set << sm.r) + (c >> (sm.t - sm.r))
        val off = sm.offset1(p)
        val adr = (sm.basis(s % sm.basis.size) * Vec.fromInt(sm.t - sm.r, c % (1 << (sm.t - sm.r))) + off(s % off.size)).toInt + 1
        val nc = (p3.head * Vec.fromInt(sm.k, p) + p4.head * Vec.fromInt(sm.t, c)).toInt
        val ni = nc * sm.K + p
        res(ni)=el(i)
        el(i).move(dy = -Element.size)
        el(i).move(Element.size*3/2*(adr))
        el(i).move(dy = Element.size)
        //el(i).stay
        (0 until (sm.innerLatency-c+nc)).foreach(_ => el(i).stay)
        el(i).move(dy = Element.size)
        el(i).move(length(sm) - Element.size * 3 / 2 * adr)
        el(i).move(dy = -Element.size))
      res.toSeq
    case ITensor(r, factor, k) =>
      el.grouped(factor.N).toSeq.flatMap(animate(factor, _, set))
    case Butterfly(_) =>
      el(0).move(unit / 2, unit / 2)
      el(0).move(unit / 2, -unit / 2)
      el(1).move(unit / 2, -unit / 2)
      el(1).move(unit / 2, unit / 2)
      el
    case DFT(t, k) =>
      el.foreach(_.move(length(sm) / 2))
      (0 until (1 << (t + k))).foreach(_ => el.foreach(_.stay))
      el.foreach(_.move(length(sm) / 2))
      el
    case _ =>
      val l=length(sm)
      if(l>0)
        el.foreach(_.move(length(sm)))
      el

  def length[T](sm: StreamingModule[T]): Int = sm match
    case Product(list) => list.map(length).sum + (list.size - 1) * unit
    case AcyclicProduct(list) => list.map(length).sum + (list.size - 1) * unit
    case transforms.perm.Steady(_, _) => unit
    case transforms.perm.SwitchArray(_, _) => unit
    case sm@transforms.perm.Temporal(p3, p4, _) => ((1 << sm.innerP4.head.m) + 1) * 3 * Element.size / 2
    case ITensor(_, factor, _) => length(factor)
    case Butterfly(_) => unit
    case sm if sm.spl.isInstanceOf[DiagE] => 0//unit/2
    case DFT(t, k) => (t+ k) * unit
    case _ => 2 * unit


  def static[T](sm: StreamingModule[T], pw:StringBuilder, x:Int, y:Int):Unit=sm match {
    case Product(list) =>
      var curx = x
      for(i<-list.indices.reverse)
      {
        curx += length(list(i))
        if(i>0)
          (0 until sm.K).foreach(i => pw ++= s"""<line x1="$curx" y1="${y+i*unit+unit/2}" x2="${curx+unit}" y2="${y+i*unit+unit/2}" stroke="#000"/>\n""")
        curx+=unit
      }
      curx = x
      for(i<-list.indices.reverse)
      {
        static(list(i),pw,curx,y)
        curx += length(list(i))+unit
      }
    case AcyclicProduct(list) =>
      var curx = x
      for(i<-list.indices.reverse)
      {
        curx += length(list(i))
        if(i>0)
          (0 until sm.K).foreach(i => pw ++= s"""<line x1="$curx" y1="${y+i*unit+unit/2}" x2="${curx+unit}" y2="${y+i*unit+unit/2}" stroke="#000"/>\n""")
        curx+=unit
      }
      curx = x
      for(i<-list.indices.reverse)
      {
        static(list(i),pw,curx,y)
        curx += length(list(i))+unit
      }
    case transforms.perm.Steady(p1,t) => (0 until sm.K).foreach(i => pw ++= s"""<line x1="$x" y1="${i*unit+unit/2}" x2="${x+unit}" y2="${LinearPerm.permute(p1.head,i)*unit+unit/2}" stroke="#000"/>\n""")
    case transforms.perm.SwitchArray(v,k) =>
      for(i<-0 until 1<<(k-1)) {
        pw ++= s"""<rect x="${x-0.25*unit}" y="${y + 2 * i * unit + 0.25 * unit}" width="${unit * 1.5}" height="${unit * 1.5}" rx="0" style="fill:#d5d5d5"/>"""
        pw ++= s"""<line x1="${x}" y1="${y+2*i*unit+unit/2}" x2="${x+unit}" y2="${y+2*i*unit+unit/2}" stroke="#000"/>\n"""
        pw ++= s"""<line x1="${x}" y1="${y+2*i*unit+3*unit/2}" x2="${x+unit}" y2="${y+2*i*unit+3*unit/2}" stroke="#000"/>\n"""
        pw ++= s"""<line x1="${x}" y1="${y+2*i*unit+unit/2}" x2="${x+unit}" y2="${y+2*i*unit+3*unit/2}" stroke="#000"/>\n"""
        pw ++= s"""<line x1="${x}" y1="${y+2*i*unit+3*unit/2}" x2="${x+unit}" y2="${y+2*i*unit+unit/2}" stroke="#000"/>\n"""

      }
    case sm@transforms.perm.Temporal(p3,p4,_) =>
      (0 until sm.K).foreach { i =>
      val l=length(sm)
        pw ++= s"""<line x1="$x" y1="${y+i*unit+unit/2}" x2="${x+l}" y2="${y+i*unit+unit/2}" stroke="#000"/>\n"""
        pw ++= s"""<rect x="${x + unit * 0.2}" y="${y + i * unit + unit / 2 - unit * 0.2}" width="${l - unit * 0.4}" height="${unit * 0.4}" fill="#2f75b6"/>\n"""
        if(sm.t-sm.r==1)
          pw ++= s"""<text x="${x + l/2}" y="${y + i * unit + unit / 2}" text-anchor="middle" alignment-baseline="middle" style="fill:#025; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">RAM</text>"""
        else if(sm.t-sm.r==2)
          pw ++= s"""<text x="${x + l/2}" y="${y + i * unit + unit / 2}" text-anchor="middle" alignment-baseline="middle" style="fill:#025; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">RAM bank</text>"""
        else
          pw ++= s"""<text x="${x + l/2}" y="${y + i * unit + unit / 2}" text-anchor="middle" alignment-baseline="middle" style="fill:#025; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">RAM bank (${1<<(sm.t-sm.r)} elements)</text>"""
      }
    case sm: SmallTemporal[T] =>
      (0 until sm.K).foreach { i =>
        pw ++= s"""<line x1="$x" y1="${y+i*unit+unit/2}" x2="${x+unit*2}" y2="${y+i*unit+unit/2}" stroke="#000"/>\n"""
        pw ++= s"""<rect x="${x + unit * 0.4}" y="${y + i * unit + unit / 2 - unit * 0.2}" width="${unit * 0.4}" height="${unit * 0.4}" fill="#2f75b6"/>\n"""
        pw ++= s"""<rect x="${x + unit * 1.2}" y="${y + i * unit + unit / 2 - unit * 0.2}" width="${unit * 0.4}" height="${unit * 0.4}" fill="#2f75b6"/>\n"""
      }
    case ITensor(r,factor,k) =>
      if (k>factor.n)
      for(i<-0 until (sm.K/factor.K))
        static(factor,pw,x,y+i*(1<<factor.k)*unit)
      else
        static(factor,pw,x,y)
    case Butterfly(_) =>
      pw ++= s"""<rect x="${x-0.25*unit}" y="${y+0.25*unit}" width="${unit*1.5}" height="${unit*1.5}" rx="10" style="fill:#a1e47e"/>"""
      //pw ++= s"""<text x="${x+0.5*unit}" y="${y+unit}" text-anchor="middle" alignment-baseline="middle" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">Butterfly</text>"""
      pw ++= s"""<text x="${x+0.5*unit}" y="${y+unit}" text-anchor="middle" alignment-baseline="middle" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:24px; font-weight: bold;font-style:italic;">DFT<tspan dy="10" style="font-size:18px;">2</tspan></text>"""
    case DFT(t, k) =>
    case sm if sm.spl.isInstanceOf[DiagE] =>
      val de:DiagE=sm.spl.asInstanceOf[DiagE]
      (0 until sm.K).map{p =>
        val coefs = (0 until sm.T).toList.map(c => de.pow(((c << sm.k) + p)) % (1 << (sm.t + sm.k)))
        if(coefs.toSet.size != 1) {
          pw ++= s"""<circle cx="${x+unit*0.25}" cy="${y+p*unit+unit/2}" r="${unit*0.25}" fill="#a1e47e"/>\n"""
          pw ++= s"""<text x="${x + 0.25 * unit}" y="${y + p*unit+unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">&#xD7;</text>"""
        }
        else if (coefs.head==0)
          pw ++= s"""<line x1="$x" y1="${y+p*unit+unit/2}" x2="${x+unit/2}" y2="${y+p*unit+unit/2}" stroke="#000"/>\n"""
        else if(coefs.head*4==sm.N) {
          pw ++= s"""<circle cx="${x + unit * 0.25}" cy="${y + p * unit + unit / 2}" r="${unit * 0.25}" stroke="#000" fill="#FFF"/>\n""" //-i
          pw ++= s"""<text x="${x + 0.25 * unit}" y="${y + p*unit+unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#000; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">-i</text>"""
        }
        else if(coefs.head*2==sm.N) {
          pw ++= s"""<circle cx="${x + unit * 0.25}" cy="${y + p * unit + unit / 2}" r="${unit * 0.25}" stroke="#000" fill="#FFF"/>\n""" //-i
          pw ++= s"""<text x="${x + 0.25 * unit}" y="${y + p*unit+unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#000; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">-1</text>"""
        }
        else if(coefs.head*4==sm.N*3) {
          pw ++= s"""<circle cx="${x + unit * 0.25}" cy="${y + p * unit + unit / 2}" r="${unit * 0.25}" stroke="#000" fill="#FFF"/>\n""" //-i
          pw ++= s"""<text x="${x + 0.25 * unit}" y="${y + p*unit+unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#000; font-family:Futura,Calibri,Sans-serif; font-size:18px; font-weight: bold;font-style:italic;">i</text>"""
        }
        else {
          pw ++= s"""<circle cx="${x + unit * 0.25}" cy="${y + p * unit + unit / 2}" r="${unit * 0.25}" fill="#a1e47e"/>\n""" //-i
          pw ++= s"""<text x="${x + 0.25 * unit}" y="${y + p*unit+unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:10px; font-weight: bold;font-style:italic;">&#x3c9;<tspan dy ="-2" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:8px; font-weight: font-style:italic;">${coefs.head}/${sm.N}</tspan></text>"""
        }
      }
    case _ => pw ++= s"""<rect x="${x}" y="${y}" width="${2*unit}" height="${sm.K*unit}" rx="10" />"""
    }


  def foreground[T](sm: StreamingModule[T], pw:StringBuilder, x:Int, y:Int):Unit = sm match
    case DFT(t, k) =>
      pw ++= s"""<rect x="${x}" y="${y}" width="${sm.n * unit}" height="${sm.K*unit}" rx="10" style="fill:#a1e47e"/>"""
      pw ++= s"""<text x="${x+sm.n*unit/2}" y="${y+sm.K*unit/2}" text-anchor="middle" alignment-baseline="middle" style="fill:#040; font-family:Futura,Calibri,Sans-serif; font-size:24px; font-weight: bold;font-style:italic;">DFT<tspan dy="10" style="font-size:18px;">${1 << (t+k)}</tspan></text>"""
    case _ =>



  extension [T](sm: StreamingModule[T])
    def toSVG =
      val res = new mutable.StringBuilder
      val height = Math.max(Element.size*sm.N,sm.K*unit)//sm.N * dyElements //unit/2 up and down
      val width = length(sm) + 4 * unit+6 //unit on each side
      res ++= s"""<?xml version="1.0" encoding="utf-8"?>\n<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="${-Element.radius} 0 ${width+Element.size} ${height+Element.size}" height="${(height+Element.size)/2}">\n"""
      res ++= """<defs><marker id="triangle" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="10" markerHeight="10" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" fill="#000"/> </marker><marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto"><polygon points="0 0, 10 3.5, 0 7"/></marker></defs>"""
      (0 until sm.K).foreach(i => res ++= s"""<line x1="$unit" y1="${i * unit + (unit +height-sm.K*unit)/2}" x2="${2 * unit}" y2="${i * unit + (unit +height-sm.K*unit)/2}" stroke="#000"/>\n""")
      (0 until sm.K).foreach(i => res ++= s"""<line x1="${length(sm) + 2 * unit}" y1="${i * unit + (unit +height-sm.K*unit)/2}" x2="${length(sm) + 3 * unit}" y2="${i * unit + (unit +height-sm.K*unit)/2}" stroke="#000" marker-end="url(#triangle)"/>\n""")
      static(sm, res, 2 * unit, (height-sm.K*unit)/2)

      val elements = Seq.tabulate(sm.N)((i) =>
        val p = i % sm.K
        val c = i / sm.K
        val res = Element(2, i * Element.size + (height - sm.N*Element.size+ Element.size) / 2)
        (0 until (c + 2)).foreach(_ => res.stay)
        res.moveTo(unit, p * unit + (unit + height - sm.K * unit) / 2)
        res.move(unit)
        res)

      animate(sm, elements, 0).zipWithIndex.foreach((e, i) =>
        val p = i % sm.K
        val c = i / sm.K
        e.move(unit)
        e.moveTo(length(sm) + 4 * unit, i * Element.size + (height - sm.N*Element.size+Element.size) / 2)
        (0 until (sm.T - c + 1)).foreach(_ => e.stay)
        e(res))

      foreground(sm, res, 2 * unit, (height - sm.K * unit) / 2)
      res ++= "</svg>\n"
      res.toString()

    def writeSVG(filename: String = "test.svg") =
      val pw = new PrintWriter(filename)
      pw.write(sm.toSVG)
      pw.close()

    def showSVG(filename: String = "test.svg")=
      sm.writeSVG(filename)
      s"cmd /c start $filename".!!
