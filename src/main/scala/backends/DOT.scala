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

package backends

import scala.collection.mutable
import scala.collection.immutable
import scala.annotation.tailrec
import ir.rtl._
import ir.rtl.signals
import ir.rtl.signals.Sig

import scala.sys.process._
import java.io.PrintWriter

/**
 * Adds graph outputs to Modules (RTL graph) and Streaming Modules (Sig Graph)
 */
object DOT:
  extension (mod: Module)
    /**
     * @return Graph of the RTL design in GraphViz DOT format.
     */
    def toRTLGraph: String =
      // Get a unique ID for non special nodes
      val indexes = immutable.HashMap.from(mod.components.filter {
        case _: Input | _: Output | _: Wire | _: Const => false
        case _ => true
      }.zipWithIndex)

      // Consts are handle separatly (we create a new node every time we see one)  
      val consts = mutable.ArrayBuffer[BigInt]()

      // Get an identifier for each node  
      @tailrec
      def getName(comp: Component): String = comp match
        case Input(_, name) => s"inputs:$name"
        case Output(_, name) => s"outputs:$name"
        case Wire(input) => getName(input)
        case Const(_, value) =>
          consts.addOne(value)
          s"c${consts.size}"
        case _ => s"s${indexes(comp) + 1}"

      // Representation of each node in the graph  
      inline def node(comp: Component, options: String) = Some(s"      ${getName(comp)}[$options];\n")

      val nodes = mod.components.flatMap {
        case _: Output | _: Input | _: Wire | _: Const => None
        case cur@Register(_, cycles) if cycles == 1 => node(cur, """label="Reg",shape=square""")
        case cur@Register(_, cycles) => node(cur, s"""label="FIFO($cycles cycles)",shape=record""")
        case cur@Plus(_) => node(cur, """label="+",shape=circle""")
        case cur@Times(_, _) => node(cur, """label="*",shape=circle""")
        case cur@Or(_) => node(cur, """label="|",shape=circle""")
        case cur@Xor(_) => node(cur, """label="^",shape=circle""")
        case cur@And(_) => node(cur, """label="&",shape=circle""")
        case cur@Minus(_, _) => node(cur, """label="-",shape=circle""")
        case cur@Tap(_, range) => node(cur, s"""label="[${if (range.size > 1) s"${range.last}:" else ""}${range.start}]",shape=triangle,orientation=270""")
        case cur@ROM(address, values) => node(cur, s"""label="<title>ROM (${values.size} × ${cur.size} bits) |${values.map(_.toString).mkString("|")}",shape=record""")
        case cur@Mux(_, _) => node(cur, s"""label="",shape=invhouse,orientation=90""")
        case cur@RAM(_, _, rd) => node(cur, s"""label="RAM bank (${1 << rd.size} × ${cur.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record""")
        case cur@Extern(_, _, module, _, _) => node(cur, s"""label="$module"""")
        case cur => node(cur, s"""label="${cur.getClass.getSimpleName}"""")
      }.mkString("")

      // Edges of the graph  
      inline def edge(from: Component, to: String) = s"  ${getName(from)}:e -> $to[penwidth=${1 + BigInt(from.size).bitLength}];\n"

      val edges = mod.components.flatMap {
        case Wire(_) => Seq()
        case cur@RAM(input, wr, rd) => Seq(edge(wr, getName(cur) + ":wr:w"), edge(rd, getName(cur) + ":rd:w"), edge(input, getName(cur) + ":data:w"))
        case cur@ROM(address, _) => edge(address, s"${getName(cur)}:title:w")
        case cur@Mux(address, inputs) => inputs.map(edge(_, s"${getName(cur)}:w")) :+ edge(address, s"${getName(cur)}:s")
        case cur => cur.parents.map(edge(_, s"${getName(cur)}:w"))
      }.mkString("")

      // outputs the graph  
      val res = new StringBuilder
      res ++= s"digraph ${mod.name} {\n"
      res ++= "  rankdir=LR;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= s"""  outputs[shape=record,label="${mod.outputs.map(i => s"<${i.name}> ${i.name} ").mkString("|")}",height=${mod.outputs.size * 1.5}];\n"""
      res ++= s"""  inputs[shape=record,label="${mod.inputs.map { i => "<" + i.name + "> " + i.name + " " }.mkString("|")}",height=${mod.inputs.size * 1.5}];\n"""
      res ++= nodes
      res ++= consts.zipWithIndex.map((v, i) => s"""      c${i + 1}[label="$v",shape=none];\n""").mkString("")
      res ++= edges
      res ++= "}\n"
      res.toString()

    /**
     * Generate the RTL graph, run graphviz and shows the graph. Works only in Windows, and with GraphViz in the path. 
     */
    def showRTLGraph: String =
      val graph = toRTLGraph
      val pw = PrintWriter("rtl.gv")
      pw.write(graph)
      pw.close()
      "dot -Tsvg rtl.gv -o rtl.svg".!!
      "cmd /c start rtl.svg".!!

  extension [U](sb: AcyclicStreamingModule[U])
    /**
     * @return Graph of the Sig design (where hardware types and timing is abstracted) in GraphViz DOT format.
     */
    def toGraph: String =
      val sigs = sb.synch.keys // Sig nodes in the graph

      // Get a unique ID for non special nodes in the graph  
      val indexes = immutable.HashMap.from(sigs.filter {
        case _: signals.Input[?] | signals.Next | signals.Reset => false
        case _ => true
      }.zipWithIndex)

      // Consts are handled independently (creating a new instance each time)   
      val consts = mutable.ArrayBuffer[String]()

      // Returns the DOT identifier of the node  
      def getName(sig: Sig[?]): String = sig match
        case signals.Input(i) => s"inputs:i$i"
        case signals.Const(value) =>
          consts.addOne(value.toString)
          s"c${consts.size}"
        case signals.Next =>
          consts.addOne("Next")
          s"c${consts.size}"
        case signals.Reset =>
          consts.addOne("Reset")
          s"c${consts.size}"
        case signals.Timer(limit) =>
          consts.addOne(s"Timer($limit)")
          s"c${consts.size}"
        case signals.SetCounter(limit) =>
          consts.addOne(s"SetCounter($limit)")
          s"c${consts.size}"
        case signals.LateSetCounter(limit, delay) =>
          consts.addOne(s"LateSetCounter($limit, $delay)")
          s"c${consts.size}"
        case _ => s"s${indexes(sig) + 1}"

      // Node declaration in the graph  
      inline def node(sig: Sig[?], options: String) = Some(s"      ${getName(sig)}[$options];\n")

      val nodes = sigs.flatMap {
        case _: signals.Input[?] | _: signals.Const[?] | signals.Next | signals.Reset | signals.Timer(_) | signals.SetCounter(_) | signals.LateSetCounter(_, _) => None
        case cur: signals.AssociativeSig[?] => node(cur, s"""label="${cur.op}",shape=circle""")
        case cur: signals.Plus[?] => node(cur, s"""label="+",shape=circle""")
        case cur: signals.Minus[?] => node(cur, s"""label="-",shape=circle""")
        case cur: signals.Times[?] => node(cur, s"""label="*",shape=circle""")
        case cur@signals.Tap(_, range) => node(cur, s"""label="[${if (range.size > 1) s"${range.last}:" else ""}${range.start}]",shape=triangle,orientation=270""")
        case cur@signals.ROM(values, address) => node(cur, s"""label="<title>ROM (${values.size} × ${cur.hw.size} bits) |${values.map(_.toString).mkString("|")}",shape=record""")
        case cur@signals.Mux(_, _) => node(cur, s"""label="",shape=invhouse,orientation=90""")
        case cur@signals.DualControlRAM(input, wr, rd, _) => node(cur, s"""label="RAM bank (${1 << rd.hw.size} × ${cur.hw.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record""")
        case cur@signals.SingleControlRAM(input, wr, _, _) => node(cur, s"""label="RAM bank (${1 << wr.hw.size} × ${cur.hw.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record""")
        case cur => node(cur, s"""label="${cur.getClass.getSimpleName}"""")
      }.mkString("")

      //Edges  
      inline def edge(from: Sig[?], to: String) = s"  ${getName(from)}:e -> $to[penwidth=${1 + BigInt(from.hw.size).bitLength}];\n"

      val edges = sigs.flatMap {
        case signals.Timer(_) | signals.LateSetCounter(_, _) | signals.SetCounter(_) => Seq()
        case cur@signals.ROM(_, address) => Seq(edge(address, s"${getName(cur)}:title:w"))
        case cur@signals.Mux(address, inputs) => inputs.map(edge(_, s"${getName(cur)}:w")) :+ edge(address, s"${getName(cur)}:s")
        case cur@signals.DualControlRAM(input, wr, rd, _) => Seq(edge(input, s"${getName(cur)}:data:w"), edge(wr, s"${getName(cur)}:wr:w"), edge(rd, s"${getName(cur)}:rd:w"))
        case cur@signals.SingleControlRAM(input, wr, _, _) => Seq(edge(input, s"${getName(cur)}:data:w"), edge(wr, s"${getName(cur)}:wr:w"), edge(wr, s"${getName(cur)}:rd:w"))
        case cur => cur.parents.map(parent => edge(parent._1, getName(cur)))
      }.mkString("")

      // Final output  
      val res = new StringBuilder
      res ++= "digraph " + sb.name + " {\n"
      res ++= "  rankdir=LR;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= "  outputs[shape=record,label=\"" + (0 until sb.K).map(i => "<o" + i + "> " + i + " ").mkString("|") + "\",height=" + (sb.K * 1.5) + "];\n"
      res ++= "  inputs[shape=record,label=\"" + (0 until sb.K).map(i => "<i" + i + "> " + i + " ").mkString("|") + "\",height=" + (sb.K * 1.5) + "];\n"
      res ++= nodes
      res ++= consts.zipWithIndex.map((v, i) => s"""      c${i + 1}[label="$v",shape=none];\n""").mkString("")
      res ++= edges
      res ++= sb.outputSigs.zipWithIndex.map { case (s, i) => s"  ${getName(s)} -> outputs:o$i:w[penwidth=${1 + BigInt(s.hw.size).bitLength}];\n" }.mkString("")
      res ++= "}\n"
      res.toString()

    /**
     * Generate the Sig graph, run graphviz and shows the graph. Works only in Windows, and with GraphViz in the path. 
     */
    def showGraph =
      val graph = sb.toGraph
      val pw = PrintWriter("graph.gv")
      pw.write(graph)
      pw.close()
      "dot -Tsvg graph.gv -o graph.svg".!!
      "cmd /c start graph.svg".!!