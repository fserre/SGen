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

package StreamingModule

import SB.HardwareType.{ComplexHW, FixedPoint}
import SPL.FFT.DFT
import SPL.LinearPerm

import java.io.PrintWriter
import scala.collection.mutable

object SVG extends App {
  val unit=50
  def length[T](sm: StreamingModule[T]):Int= sm match{
    case Product(list) => list.map(length).sum+(list.size-1)*unit
    case SB.Product(list) => list.map(length).sum+(list.size-1)*unit
    case SB.SLP.Steady(p1,t) => unit
    case _ => 2*unit
  }


  def static[T](sm: StreamingModule[T], pw:StringBuilder, x:Int, y:Int):Unit=sm match {
    case Product(list) =>
      var curx = x
      for(i<-list.indices.reverse)
      {
        static(list(i),pw,curx,y)
        curx += length(list(i))
        if(i>0)
          (0 until sm.K).foreach(i => pw ++= s"""<line x1="$curx" y1="${i*unit+unit/2}" x2="${curx+unit}" y2="${i*unit+unit/2}" stroke="#000"/>\n""")
        curx+=unit
      }
    case SB.Product(list) =>
      var curx = x
      for(i<-list.indices.reverse)
      {
        static(list(i),pw,curx,y)
        curx += length(list(i))
        if(i>0)
          (0 until sm.K).foreach(i => pw ++= s"""<line x1="$curx" y1="${i*unit+unit/2}" x2="${curx+unit}" y2="${i*unit+unit/2}" stroke="#000"/>\n""")
        curx+=unit
      }
    case SB.SLP.Steady(p1,t) => (0 until sm.K).foreach(i => pw ++= s"""<line x1="$x" y1="${i*unit+unit/2}" x2="${x+unit}" y2="${LinearPerm.permute(p1.head,i)*unit+unit/2}" stroke="#000"/>\n""")
    case _ => pw ++= s"""<rect x="${x}" y="${y}" width="${2*unit}" height="${sm.K*unit}" rx="10" />"""
    }

  def apply[T](sm: StreamingModule[T])={
    val res=new mutable.StringBuilder
    val height=sm.K*unit //unit/2 up and down
    val width=length(sm)+2*unit //unit on each side
    res ++= s"""<?xml version="1.0" encoding="utf-8"?>\n<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="$width" height="$height">\n"""
    res ++= """<defs><marker id="triangle" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="10" markerHeight="10" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" fill="#000"/> </marker><marker id="arrowhead" markerWidth="10" markerHeight="7" refX="0" refY="3.5" orient="auto"><polygon points="0 0, 10 3.5, 0 7"/></marker></defs>"""
    (0 until sm.K).foreach(i => res ++= s"""<line x1="0" y1="${i*unit+unit/2}" x2="$unit" y2="${i*unit+unit/2}" stroke="#000"/>\n""")
    static(sm,res,unit,0)
    (0 until sm.K).foreach(i => res ++= s"""<line x1="${length(sm)+unit}" y1="${i*unit+unit/2}" x2="${length(sm)+2*unit}" y2="${i*unit+unit/2}" stroke="#000" marker-end="url(#triangle)"/>\n""")
    res++="</svg>\n"
    res.toString()
  }
  val sm=DFT.CTDFT(3,1,false).stream(2)(ComplexHW(FixedPoint(4,4)))
  val pw = new PrintWriter("test.svg")
  pw.write(apply(sm))
  pw.close()

}
