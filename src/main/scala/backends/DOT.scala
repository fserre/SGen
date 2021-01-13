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
import scala.collection.mutable
import scala.collection.immutable
import scala.annotation.tailrec
import ir.rtl._
import ir.rtl.signals.Sig

import scala.sys.process._
import java.io.PrintWriter


object DOT:
  extension (mod: Module) 
    final def toRTLGraph: String = 
      val indexes = immutable.HashMap.from(mod.components.filter(_ match 
        case _: Input | _: Output | _: Wire | _: Const | _: RAMWr => false
        case _ => true
      ).zipWithIndex)

      val consts = mutable.ArrayBuffer[BigInt]()  
        
      @tailrec
      def getName(comp: Component): String = comp match
        case Input(_,name) => s"inputs:$name"
        case Output(_,name) => s"outputs:$name"
        case Wire(input) => getName(input)
        case Const(_, value) => 
          consts.addOne(value)
          s"c${consts.size}"
        case _ => s"s${indexes(comp) + 1}"

      inline def node(comp:Component, options: String) = Some(s"      ${getName(comp)}[$options];\n")
      val nodes=mod.components.flatMap(cur => cur match
          case _: Output | _: Input | _: RAMWr | _: Wire | _: Const => None
          case Register(_) => node(cur, """label="Reg",shape=square""")
          case Plus(_) => node(cur, """label="+",shape=circle""")
          case Or(_) => node(cur, """label="|",shape=circle""")
          case Xor(_) => node(cur, """label="^",shape=circle""")
          case And(_) => node(cur, """label="&",shape=circle""")
          case Minus(_,_) => node(cur, """label="-",shape=circle""")
          case Tap(_,range) => node(cur, s"""label="[${if (range.size > 1) s"${range.last}:" else ""}${range.start}]",shape=triangle,orientation=270""")
          case ROM(address, values) => node(cur, s"""label="<title>ROM (${values.size} × ${cur.size} bits) |${values.map(_.toString).mkString("|")}",shape=record""")
          case Mux(_, _) => node(cur, s"""label="",shape=invhouse,orientation=90""")
          case RAMRd(_,rd) => node(cur, s"""label="RAM bank (${1 << rd.size} × ${cur.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record""")
          case Extern(_,_,module,_,_) => node(cur, s"""label="$module"""")
          case _ => node(cur, s"""label="${cur.getClass.getSimpleName}"""")
      ).mkString("")

      inline def edge(from: Component, to: String) = s"  ${getName(from)}:e -> $to[penwidth=${1 + BigInt(from.size).bitLength}];\n"
      val edges=mod.components.flatMap {cur => cur match
          case Wire(_) | _: RAMWr => Seq()
          case RAMRd(RAMWr(wr,input),rd) => Seq(edge(wr,getName(cur)+":wr"),edge(rd,getName(cur)+":rd"),edge(input,getName(cur)+":data"))
          case cur: Mux if cur.inputs.forall(_.isInstanceOf[Const]) => edge(cur.address,getName(cur))
          case _ => cur.parents.map(edge(_,getName(cur)))
      }.mkString("")

      var res = new StringBuilder
      res ++= s"digraph ${mod.name} {\n"
      res ++= "  rankdir=LR;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= s"""  outputs[shape=record,label="${mod.outputs.map(i => s"<${i.name}> ${i.name} ").mkString("|")}",height=${mod.outputs.size * 1.5}];\n"""
      res ++= s"""  inputs[shape=record,label="${mod.inputs.map { i => "<" + i.name + "> " + i.name + " " }.mkString("|")}",height=${mod.inputs.size * 1.5}];\n"""
      res ++= nodes
      res ++= consts.zipWithIndex.map((v,i)=>s"""      c${i+1}[label="$v",shape=none];\n""").mkString("")
      res ++= edges
      res ++= "}\n"
      res.toString()

    final def showRTLGraph: String = 
      val graph = toRTLGraph
      val pw = PrintWriter("rtl.gv")
      pw.write(graph)
      pw.close()
      "Graphviz/dot -Tpdf rtl.gv -o rtl.pdf".!!
      "cmd /c start rtl.pdf".!!
  
  extension [U](sb: SB[U])
    def toGraph:String = 
      val inputSigs = (0 until sb.K).map(c => signals.Input(c, sb.hw))

      val outputs = sb.implement(inputSigs)
      val toProcess = mutable.HashSet[Sig[?]]()
      val processed = mutable.HashSet[Sig[?]]()
      toProcess.addAll(outputs)
      val res = new StringBuilder
      res ++= "digraph " + sb.name + " {\n"
      res ++= "  rankdir=RL;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= "  outputs[shape=record,label=\"" + outputs.indices.map(i => "<o" + i + "> " + i + " ").mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
      //res ++= "  inputs[shape=record,label=\"" + inputSigs.zipWithIndex.map { case (p, i) => "<i" + p.ref.i + "> " + i + " " }.mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
      while toProcess.nonEmpty do
        val cur = toProcess.head
        toProcess.remove(cur)
        //val curSig = sb.signal(cur)
        cur.parents.map(_._1).foreach(f =>
          if !processed(f) then
            processed.add(f)
            toProcess.add(f))

      val nodes = processed.toSeq
      res ++= nodes.map(s => s.graphDeclaration).mkString("\n")
      res ++= nodes.flatMap(s => s.graphNode).mkString("\n")
      res ++= outputs.zipWithIndex.map { case (s, i) => s.graphName + " -> outputs:o" + i + ";\n" }.mkString("")
      res ++= "}\n"
      res.toString()

    def showGraph = 
      val graph = sb.toGraph
      val pw = PrintWriter("graph.gv") 
      pw.write(graph)
      pw.close()
      "dot -Tpdf graph.gv -o graph.pdf".!!
      "cmd /c start graph.pdf".!!