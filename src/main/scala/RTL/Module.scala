/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package RTL

import java.io.PrintWriter

import scala.collection.mutable
import sys.process._
abstract class Module {
  def inputs: Seq[Input]

  def outputs: Seq[Output]

  lazy val name: String = this.getClass.getSimpleName.toLowerCase

  def toVerilog = {
    val names = mutable.AnyRefMap[Component, String]()
    val toImplement = mutable.Queue[Component]()
    toImplement.enqueueAll(outputs)

    implicit def getName(comp: Component): String = comp match {
      case comp:Input => comp.name
      case comp:Output => comp.name
      case comp:Wire => getName(comp.input)
      case comp:Const => comp.size+"'d"+comp.value
      case _ => if (!(names contains comp)) {
        names(comp) = "s" + (names.size + 1)
        toImplement.enqueue(comp)
      }
        names(comp)
    }

    val combinatorial = new mutable.StringBuilder
    val sequential = new mutable.StringBuilder
    val declarations = new mutable.StringBuilder

    def addDec(line: String) = declarations ++= "  " ++= line ++= "\n"

    def addSeq(line: String*) = line.foreach(sequential ++= "      " ++= _ ++= "\n")

    def addComb(line: String*) = line.foreach(combinatorial ++= "  " ++= _ ++= "\n")

    //def addComb(line: Vector[String]) = line.foreach(combinatorial ++= "  " ++= _ ++= "\n")
    while (!toImplement.isEmpty) {
      val cur = toImplement.dequeue
      cur match {
        case _: Output | _: Input | _: Const | _: Wire =>
        case _: Register | _: Mux | _: RAMRd => addDec("reg " + (if (cur.size != 1) "[" + (cur.size - 1) + ":0] " else "") ++ cur + ";")
        case cur:RAMWr => addDec("reg " ++ (if (cur.size != 1) "[" + (cur.size - 1) + ":0] " else "") ++ cur ++ " [" ++ ((1 << cur.wrAddress.size) - 1).toString ++ ":0]; // synthesis attribute ram_style of " ++ cur ++ " is block")
        case _ => addDec("wire " + (if (cur.size != 1) "[" + (cur.size - 1) + ":0] " else "") ++ cur + ";")
      }
      if (cur.description != "") addComb("// " + cur.description)
      cur match {
        case cur:Output => addComb("assign " ++ cur + " = " ++ cur.input + ";")
        case cur:Plus => addComb("assign " ++ cur + " = " ++ cur.terms.map(getName).mkString(" + ") + ";")
        case cur:Minus => addComb("assign " ++ cur + " = " ++ cur.lhs ++ " - "++ cur.rhs ++ ";")
        case cur: Times => addComb("assign " ++ cur + " = $signed(" ++ cur.lhs ++ ") * $signed(" ++ cur.rhs ++ ");")
        case cur:And => addComb("assign " ++ cur + " = " ++ cur.terms.map(getName).mkString(" & ") + ";")
        case cur:Xor => addComb("assign " ++ cur + " = " ++ cur.inputs.map(getName).mkString(" ^ ") + ";")
        case cur: Or => addComb("assign " ++ cur + " = " ++ cur.inputs.map(getName).mkString(" | ") + ";")
        case cur:Equals => addComb("assign " ++ cur ++ " = " ++ cur.lhs ++ " == " ++ cur.rhs ++ ";")
        case cur:Not => addComb("assign " ++ cur + " = ~" ++ cur.input + ";")
        case cur:Mux => addComb("always @(*)")
          addComb("  case(" ++ cur.address ++ ")")
          //(0 until inputs.size).foreach(i =>addComb("    " + (if(i==inputs.size-1 && ((1<<control.size)!=inputs.size))"default" else i) + ": " ++ cur + " <= " ++ inputs(i) + ";"))
          cur.inputs.zipWithIndex.foreach { case (in, i) => addComb("    " + (if (i == inputs.size - 1 && ((1 << cur.address.size) != inputs.size)) "default" else i) + ": " ++ cur + " <= " ++ in + ";") }
          addComb("  endcase")
        case cur:Concat => addComb("assign " ++ cur + " = {" ++ cur.inputs.map(getName).mkString(", ") + "};")
        case cur:Tap => addComb("assign " ++ cur + " = " ++ cur.input ++ "[" + (if (cur.range.size > 1) cur.range.last + ":" else "") + cur.range.start + "];")
        case cur:Register => addSeq(cur + " <= " ++ cur.input + ";")
        case cur:RAMWr => addSeq(cur + " [" ++ cur.wrAddress ++ "] <= " ++ cur.input ++ ";")
        case cur:RAMRd => addSeq(cur + " <= " + getName(cur.mem) + " [" ++ cur.rdAddress ++ "];")
        case _ =>
      }
    }

    var result = new StringBuilder
    result ++= "module " + name + "(input clk,\n"
    result ++= inputs.map(s => "  input " + (if (s.size != 1) "[" + (s.size - 1) + ":0] " else "") ++ s + ",\n").mkString("")
    result ++= outputs.map(s => "  output " + (if (s.size != 1) "[" + (s.size - 1) + ":0] " else "") ++ s).mkString(",\n")
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

  def toRTLGraph = {
    val names = mutable.AnyRefMap[Component, String]()
    val toImplement = mutable.Queue[Component]()
    toImplement.enqueueAll(outputs)

    implicit def getName(comp: Component): String = comp match {
      case comp: Input => "inputs:" + comp.name
      case comp: Output => "outputs:" + comp.name
      case _ => if (!(names contains comp)) {
        names(comp) = "s" + (names.size + 1)
        toImplement.enqueue(comp)
      }
        names(comp)
    }

    val edges = new mutable.StringBuilder
    val nodes = new mutable.StringBuilder


    def addNode(line: String*) = line.foreach(nodes ++= "      " ++= _ ++= "\n")

    def addEdge(dest: Component, origins: Seq[Component]): Unit = origins.foreach(o => o match {
      case o: Wire => edges ++= "  " ++= o.input ++= " -> " ++= dest ++= "[constraint=false];\n"
      case _ => edges ++= "  " ++= o ++= " -> " ++= dest ++= ";\n"
    })


    //def addComb(line: Vector[String]) = line.foreach(combinatorial ++= "  " ++= _ ++= "\n")
    while (!toImplement.isEmpty) {
      val cur = toImplement.dequeue
      cur match {
        case _: Output | _: Input =>
        case _: Register => addNode("" ++ cur ++ "[label=\"\",shape=square];")
        case cur: Const => addNode("" ++ cur ++ "[label=\"" ++ cur.value.toString() ++ "\",shape=none];")
        case _ => addNode("" ++ cur ++ "[label=\"" + cur.getClass.getSimpleName + "\"];")
      }

      addEdge(cur, cur.parents)
    }

    var res = new StringBuilder
    res ++= "digraph " + name + " {\n"
    res ++= "  rankdir=LR;\n"
    res ++= "  ranksep=1.5;\n"
    res ++= "  outputs[shape=record,label=\"" + outputs.map(i => "<" + i.name + "> " + i.name + " ").mkString("|") + "\",height=" + (outputs.size * 1.5) + "];\n"
    res ++= "  inputs[shape=record,label=\"" + inputs.map { i => "<" + i.name + "> " + i.name + " " }.mkString("|") + "\",height=" + (inputs.size * 1.5) + "];\n"
    res ++= nodes
    res ++= edges
    res ++= "}\n"
    res.toString()
  }

  def showRTLGraph() = {
    val graph = toRTLGraph
    new PrintWriter("rtl.gv") {
      write(graph);
      close
    }
    "dot -Tpdf rtl.gv -o rtl.pdf".!!
    "cmd /c start rtl.pdf".!!

  }
}
