/*
 *     _____ ______          SGen - A Generator of Streaming Hardware
 *    / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *    \__ \/ / __/ _ \/ __ \
 *   ___/ / /_/ /  __/ / / /
 *  /____/\____/\___/_/ /_/  Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software Foundation,
 *  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 */

package RTL

import java.io.PrintWriter

import scala.annotation.tailrec
import scala.collection.mutable
import scala.language.implicitConversions
import scala.sys.process._

/**
 * Class that represents a RTL module
 */
abstract class Module {
  def inputs: Seq[Input]

  def outputs: Seq[Output]

  lazy val name: String = this.getClass.getSimpleName.toLowerCase
  val dependencies: mutable.Set[String] = mutable.Set[String]()
  final def toVerilog: String = {
    val names = mutable.AnyRefMap[Component, String]()
    val toImplement = mutable.Queue[Component]()
    toImplement.enqueueAll(outputs)

   implicit class CompName(cp:Component) {
      @tailrec
      def id:String = cp match {
        case comp: Input => comp.name
        case comp: Output => comp.name
        case comp: Wire => comp.input.id
        case comp: Const => s"${comp.size}'d${comp.value}"
        case _ => if (!(names contains cp)) {
          names(cp) = s"s${names.size + 1}"
          toImplement.enqueue(cp)
        }
          names(cp)
      }
    }
    val combinatorial = new mutable.StringBuilder
    val sequential = new mutable.StringBuilder
    val declarations = new mutable.StringBuilder

    def addDec(line: String) = declarations ++= "  " ++= line ++= "\n"

    def addSeq(line: String*): Unit = line.foreach(sequential ++= "      " ++= _ ++= "\n")

    def addComb(line: String*): Unit = line.foreach(combinatorial ++= "  " ++= _ ++= "\n")

    //def addComb(line: Vector[String]) = line.foreach(combinatorial ++= "  " ++= _ ++= "\n")
    while (toImplement.nonEmpty) {
      val cur = toImplement.dequeue()
      cur match {
        case _: Output | _: Input | _: Const | _: Wire =>
        case _: Register | _: Mux | _: RAMRd => addDec(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${cur.id};")
        case cur:RAMWr => addDec(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${cur.id} [${(1 << cur.wrAddress.size) - 1}:0]; // synthesis attribute ram_style of ${cur.id} is block")
        case _ => addDec(s"wire ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${cur.id};")
      }
      if (cur.description != "") addComb(s"// ${cur.description}")
      cur match {
        case cur:Output => addComb(s"assign ${cur.id} = ${cur.input.id};")
        case cur:Plus => addComb(s"assign ${cur.id} = ${cur.terms.map(_.id).mkString(" + ")};")
        case cur:Minus => addComb(s"assign ${cur.id} = ${cur.lhs.id} - ${cur.rhs.id};")
        case cur:Times => addComb(s"assign ${cur.id} = $$signed(${cur.lhs.id}) * $$signed(${cur.rhs.id});")
        case cur:And => addComb(s"assign ${cur.id} = ${cur.terms.map(_.id).mkString(" & ")};")
        case cur:Xor => addComb(s"assign ${cur.id} = ${cur.inputs.map(_.id).mkString(" ^ ")};")
        case cur: Or => addComb(s"assign ${cur.id} = ${cur.inputs.map(_.id).mkString(" | ")};")
        case cur:Equals => addComb(s"assign ${cur.id} = ${cur.lhs.id} == ${cur.rhs.id};")
        case cur:Not => addComb(s"assign ${cur.id} = ~${cur.input.id};")
        case cur:Mux =>
          addComb("always @(*)")
          addComb(s"  case(${cur.address.id})")
          cur.inputs.zipWithIndex.foreach { case (in, i) => addComb(s"    ${if (i == inputs.size - 1 && ((1 << cur.address.size) != inputs.size)) "default" else i}: ${cur.id} <= ${in.id};") }
          addComb("  endcase")
        case cur:Concat => addComb(s"assign ${cur.id} = {${cur.inputs.map(_.id).mkString(", ")}};")
        case cur:Tap => addComb(s"assign ${cur.id} = ${cur.input.id}[${if (cur.range.size > 1) s"${cur.range.last}:" else ""}${cur.range.start}];")
        case cur:Register => addSeq(s"${cur.id} <= ${cur.input.id};")
        case cur:RAMWr => addSeq(s"${cur.id} [${cur.wrAddress.id}] <= ${cur.input.id};")
        case cur:RAMRd => addSeq(s"${cur.id} <= ${cur.mem.id} [${cur.rdAddress.id}];")
        case cur:Extern => addComb(s"${cur.module} ext_${cur.id}(${cur.inputs.map{case (name, comp)=>s".$name(${comp.id}), "}.mkString}.${cur.outputName}(${cur.id}));")
          dependencies.add(cur.filename)
        case _ =>
      }
    }

    var result = new StringBuilder
    result ++= s"module $name(input clk,\n"
    result ++= inputs.map(s => s"  input ${if (s.size != 1) s"[${s.size - 1}:0] " else ""}${s.id},\n").mkString("")
    result ++= outputs.map(s => s"  output ${if (s.size != 1) s"[${s.size - 1}:0] " else ""}${s.id}").mkString(",\n")
    result ++= ");\n\n"
    result ++= declarations
    result ++= combinatorial
    result ++= "  always @(posedge clk)\n"
    result ++= "    begin\n"
    result ++= sequential
    result ++= "    end\n"
    result ++= "endmodule\n"
    result.toString()
  }

  final def toRTLGraph: String = {
    val names = mutable.AnyRefMap[Component, String]()
    val toImplement = mutable.Queue[Component]()
    toImplement.enqueueAll(outputs)

    implicit def getName(comp: Component): String = comp match {
      case comp: Input => s"inputs:${comp.name}"
      case comp: Output => s"outputs:${comp.name}"
      case _ => if (!(names contains comp)) {
        names(comp) = s"s${names.size + 1}"
        toImplement.enqueue(comp)
      }
        names(comp)
    }

    val edges = new mutable.StringBuilder
    val nodes = new mutable.StringBuilder


    def addNode(line: String*): Unit = line.foreach(nodes ++= "      " ++= _ ++= "\n")

    def addEdge(dest: Component, origins: Seq[Component]): Unit = origins.foreach {
      case o: Wire => edges ++= s"  ${o.input} -> $dest[constraint=false,penwidth=${1 + BigInt(o.size).bitLength}];\n"
      case o => edges ++= s"  $o -> $dest[penwidth=${1 + BigInt(o.size).bitLength}];\n"
    }

    while (toImplement.nonEmpty) {
      val cur = toImplement.dequeue()
      cur match {
        case _: Output | _: Input | _:RAMWr =>
        case _: Register => addNode(s"""$cur[label="",shape=square];""")
        case _: Plus => addNode(s"""$cur[label="+",shape=circle];""")
        case _: Or => addNode(s"""$cur[label="|",shape=circle];""")
        case _: Xor => addNode(s"""$cur[label="^",shape=circle];""")
        case _: And => addNode(s"""$cur[label="&",shape=circle];""")
        case _: Minus => addNode(s"""$cur[label="-",shape=circle];""")
        case cur: Const => addNode(s"""$cur[label="${cur.value}",shape=none];""")
        case cur: Tap => addNode(s"""$cur[label="[${if (cur.range.size > 1) s"${cur.range.last}:" else ""}${cur.range.start}]",shape=triangle,orientation=270];""")
        case cur: Mux => if (cur.inputs.forall(_.isInstanceOf[Const]))
          addNode(s"""$cur [label="<title>ROM (${cur.inputs.size} × ${cur.size} bits) |${cur.inputs.map(_.asInstanceOf[Const].value.toString).mkString("|")}",shape=record];""")
        else
          addNode(s"""$cur[label="",shape=invhouse,orientation=90];""")
        case cur:RAMRd => addNode(s"""$cur[label="RAM bank (${1 << cur.rdAddress.size} × ${cur.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record];""")
        case cur:Extern => addNode(s"""$cur[label="${cur.module}"];""")
        case _ => addNode(s"""$cur[label="${cur.getClass.getSimpleName}"];""")
      }

      cur match {
        case cur: Mux if cur.inputs.forall(_.isInstanceOf[Const]) => addEdge(cur, Seq(cur.address))
        case _ => addEdge(cur, cur.parents)
      }
    }

    var res = new StringBuilder
    res ++= s"digraph $name {\n"
    res ++= "  rankdir=RL;\n"
    res ++= "  ranksep=1.5;\n"
    res ++= s"""  outputs[shape=record,label="${outputs.map(i => s"<${i.name}> ${i.name} ").mkString("|") }",height=${outputs.size * 1.5}];\n"""
    res ++= s"""  inputs[shape=record,label="${inputs.map { i => "<" + i.name + "> " + i.name + " " }.mkString("|")}",height=${inputs.size * 1.5}];\n"""
    res ++= nodes
    res ++= edges
    res ++= "}\n"
    res.toString()
  }

  final def showRTLGraph(): String = {
    val graph = toRTLGraph
    new PrintWriter("rtl.gv") {
      write(graph)
      close()
    }
    "dot -Tpdf rtl.gv -o rtl.pdf".!!
    "cmd /c start rtl.pdf".!!

  }
}
