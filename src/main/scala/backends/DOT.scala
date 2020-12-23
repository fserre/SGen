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

package backends
import scala.collection.mutable
import ir.rtl._
import scala.sys.process._
import java.io.PrintWriter

object DOT {
  extension (mod: Module) {
    final def toRTLGraph: String = {
      val names = mutable.AnyRefMap[Component, String]()
      val toImplement = mutable.Queue[Component]()
      toImplement.enqueueAll(mod.outputs)

      def getName(comp: Component): String = comp match {
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

      def addEdge(dest: Component, origins: Seq[Component]): Unit = origins.foreach( //case o: Wire => edges ++= s"  ${getName(o.input)} -> ${getName(dest)}[constraint=false,penwidth=${1 + BigInt(o.size).bitLength}];\n"
        o => edges ++= s"  ${getName(o)} -> ${getName(dest)}[penwidth=${1 + BigInt(o.size).bitLength}];\n")

      while (toImplement.nonEmpty) {
        val cur = toImplement.dequeue()
        cur match {
          case _: Output | _: Input | _: RAMWr =>
          case _: Register => addNode(s"""${getName(cur)}[label="",shape=square];""")
          case _: Plus => addNode(s"""${getName(cur)}[label="+",shape=circle];""")
          case _: Or => addNode(s"""${getName(cur)}[label="|",shape=circle];""")
          case _: Xor => addNode(s"""${getName(cur)}[label="^",shape=circle];""")
          case _: And => addNode(s"""${getName(cur)}[label="&",shape=circle];""")
          case _: Minus => addNode(s"""${getName(cur)}[label="-",shape=circle];""")
          case cur: Const => addNode(s"""${getName(cur)}[label="${cur.value}",shape=none];""")
          case cur: Tap => addNode(s"""${getName(cur)}[label="[${if (cur.range.size > 1) s"${cur.range.last}:" else ""}${cur.range.start}]",shape=triangle,orientation=270];""")
          case cur: Mux => if (cur.inputs.forall(_.isInstanceOf[Const]))
            addNode(s"""${getName(cur)} [label="<title>ROM (${cur.inputs.size} × ${cur.size} bits) |${cur.inputs.map(_.asInstanceOf[Const].value.toString).mkString("|")}",shape=record];""")
          else
            addNode(s"""${getName(cur)}[label="",shape=invhouse,orientation=90];""")
          case cur: RAMRd => addNode(s"""${getName(cur)}[label="RAM bank (${1 << cur.rdAddress.size} × ${cur.size} bits) |<data> Data|<wr> Write address |<rd> Read address ",shape=record];""")
          case cur: Extern => addNode(s"""${getName(cur)}[label="${cur.module}"];""")
          case _ => addNode(s"""${getName(cur)}[label="${cur.getClass.getSimpleName}"];""")
        }

        cur match {
          case cur: Mux if cur.inputs.forall(_.isInstanceOf[Const]) => addEdge(cur, Seq(cur.address))
          case _ => addEdge(cur, cur.parents)
        }
      }

      var res = new StringBuilder
      res ++= s"digraph ${mod.name} {\n"
      res ++= "  rankdir=RL;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= s"""  outputs[shape=record,label="${mod.outputs.map(i => s"<${i.name}> ${i.name} ").mkString("|")}",height=${mod.outputs.size * 1.5}];\n"""
      res ++= s"""  inputs[shape=record,label="${mod.inputs.map { i => "<" + i.name + "> " + i.name + " " }.mkString("|")}",height=${mod.inputs.size * 1.5}];\n"""
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
      "Graphviz/dot -Tpdf rtl.gv -o rtl.pdf".!!
      "cmd /c start rtl.pdf".!!
    }
  }
  extension [U](sb: SB[U]) {
    def toGraph:String = {
      //implicit val sb:SB[U] = this
      val inputSigs = sb.dataInputs.map(c => signals.Input(c, sb.hw, sb))

      val outputs = sb.implement(inputSigs)(sb)
      val toProcess = mutable.Queue[Int]()
      val processed = mutable.BitSet()
      assert(outputs.forall(_.sb == this))
      toProcess.enqueueAll(outputs.map(_.ref.i))
      processed.addAll(outputs.map(_.ref.i))
      val res = new StringBuilder
      res ++= "digraph " + sb.name + " {\n"
      res ++= "  rankdir=RL;\n"
      res ++= "  ranksep=1.5;\n"
      res ++= "  outputs[shape=record,label=\"" + outputs.indices.map(i => "<o" + i + "> " + i + " ").mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
      res ++= "  inputs[shape=record,label=\"" + inputSigs.zipWithIndex.map { case (p, i) => "<i" + p.ref.i + "> " + i + " " }.mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
      while (toProcess.nonEmpty) {
        val cur = toProcess.dequeue()
        val curSig = sb.signal(cur)
        curSig.parents.map(_._1).foreach(f =>
          if (!processed(f.i)) {
            processed.add(f.i)
            toProcess.enqueue(f.i)
          }

        )
      }
      val nodes = processed.toSeq.map(sb.signal)
      res ++= nodes.map(s => s.graphDeclaration).mkString("\n")
      res ++= nodes.flatMap(s => s.graphNode).mkString("\n")
      res ++= outputs.zipWithIndex.map { case (s, i) => s.graphName + " -> outputs:o" + i + ";\n" }.mkString("")
      res ++= "}\n"
      res.toString()
    }

    def showGraph():String = {
      val graph = toGraph
      new PrintWriter("graph.gv") {
        write(graph)
        close()
      }
      "dot -Tpdf graph.gv -o graph.pdf".!!
      "cmd /c start graph.pdf".!!
    }
  }
}