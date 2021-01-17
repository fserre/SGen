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
import ir.rtl._

import scala.collection.{immutable, mutable}
import scala.annotation.tailrec

/**
 * Adds a Verilog backend to modules.
 */
object Verilog {
  extension (mod:Module)
    /**
     * @return a string containing the verilog code of the module
     */
    final def toVerilog: String = 
      // Get IDs for each regular RTL nodes. An RTL node may use several ids.
      val indexes = immutable.HashMap.from(mod.components.zip(mod.components.map(_ match
        case _: Input | _: Output | _: Wire | _: Const => 0
        case Register(_, cycles) if cycles > 1 => 2
        case RAM(_, _, _) => 2
        case _ => 1
      ).scanLeft(1)(_ + _)))

      // Returns a verilog identifier for each of the nodes  
      @tailrec
      def getName(comp: Component, internal: Int = 0): String = comp match
        case Input(_,name) => name
        case Output(_,name) => name
        case Wire(input) => getName(input)
        case Const(size, value) => s"$size'd$value"
        case _ => s"s${indexes(comp) + internal}"
      

      val declarations = (mod.components.flatMap(cur => cur match
          case _: Output | _: Input | _: Const | _: Wire => Seq()
          case _: RAMRd => Seq(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case Mux(address, inputs) if address.size > 1 => Seq(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case Register(_, cycles) if cycles == 1   => Seq(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case Register(_, cycles) if cycles == 2 => Seq(
            s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur,1)};",
            s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case Register(_, cycles) => Seq(
            s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur,1)} [${cycles-1}:0];",
            s"wire ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case cur:RAMWr => Seq(s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)} [${(1 << cur.wrAddress.size) - 1}:0]; // synthesis attribute ram_style of ${getName(cur)} is block")
          case RAM(data, wr, rd) => Seq(
            s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur, 1)} [${(1 << wr.size) - 1}:0]; // synthesis attribute ram_style of ${getName(cur, 1)} is block",
            s"reg ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
          case _ => Seq(s"wire ${if (cur.size != 1) s"[${cur.size - 1}:0] " else ""}${getName(cur)};")
      ):+"integer i;").map(s => s"  $s\n").mkString("")
        
      val assignments = mod.components.flatMap(cur => (cur match
        case Output(input, _) => Some(getName(input))
        case Plus(terms) => Some(terms.map(getName(_,0)).mkString(" + "))
        case Minus(lhs, rhs) => Some(s"${getName(lhs)} - ${getName(rhs)}")
        case Times(lhs, rhs) => Some(s"$$signed(${getName(lhs)}) * $$signed(${getName(rhs)})")
        case And(terms) => Some(terms.map(getName(_,0)).mkString(" & "))
        case Xor(inputs) => Some(inputs.map(getName(_,0)).mkString(" ^ "))
        case Or(inputs) => Some(inputs.map(getName(_,0)).mkString(" | "))
        case Equals(lhs, rhs) => Some(s"${getName(lhs)} == ${getName(rhs)}")
        case Not(input) => Some(s"~${getName(input)}")
        case Concat(inputs) => Some(inputs.map(getName(_,0)).mkString("{",", ","}"))
        case Tap(input, range) => Some(s"${getName(input)}[${if (range.size > 1) s"${range.last}:" else ""}${range.start}]")
        case Register(input, cycles) if cycles > 2 => Some(s"${getName(cur,1)} [${cycles - 1}]")
        case Mux(address, inputs) if address.size == 1 => Some(s"${getName(address)} ? ${getName(inputs.last)} : ${getName(inputs.head)}")
        case _ => None
      ).map((cur, _))).map((cur, rhs) => s"  assign ${getName(cur)} = $rhs;\n").mkString("")

      val sequential = mod.components.flatMap(cur => cur match
        case Register(input, cycles) if cycles == 1 => Seq(s"${getName(cur)} <= ${getName(input)};")
        case Register(input, cycles) if cycles == 2 => Seq(
          s"${getName(cur, 1)} <= ${getName(input)};",
          s"${getName(cur)} <= ${getName(cur, 1)};")
        case Register(input, cycles) => Seq(
          s"${getName(cur,1)} [0] <= ${getName(input)};",
          s"for (i = 1; i < $cycles; i = i + 1)",
          s"  ${getName(cur,1)} [i] <= ${getName(cur,1)} [i - 1];")
        case cur: RAMWr => Seq(s"${getName(cur)} [${getName(cur.wrAddress)}] <= ${getName(cur.input)};")
        case cur: RAMRd => Seq(s"${getName(cur)} <= ${getName(cur.mem)} [${getName(cur.rdAddress)}];")
        case RAM(data, wr, rd) => Seq(
          s"${getName(cur,1)} [${getName(wr)}] <= ${getName(data)};",
          s"${getName(cur)} <= ${getName(cur,1)} [${getName(rd)}];")
        case _ => Seq()
      ).map(s => s"      $s\n").mkString("")
        
      val combinatorial = mod.components.flatMap(cur => cur match 
          case Mux(address, inputs) if address.size > 1 =>
            "always @(*)" +:
            s"  case(${getName(address)})" +:
            inputs.zipWithIndex.map ((in, i) => s"    ${if (i == inputs.size - 1 && ((1 << address.size) != inputs.size)) "default" else i}: ${getName(cur)} <= ${getName(in)};" ) :+
            "  endcase"
          case cur:Extern => 
            mod.dependencies.add(cur.filename)
              Seq(s"${cur.module} ext_${getName(cur)}(${cur.inputs.map{case (name, comp)=>s".$name(${getName(comp)}), "}.mkString}.${cur.outputName}(${getName(cur)}));")
          case _ => Seq()
      ).map(s => s"  $s\n").mkString("")

      var result = new StringBuilder
      result ++= s"module ${mod.name}(input clk,\n"
      result ++= mod.inputs.map(s => s"  input ${if (s.size != 1) s"[${s.size - 1}:0] " else ""}${getName(s)},\n").mkString("")
      result ++= mod.outputs.map(s => s"  output ${if (s.size != 1) s"[${s.size - 1}:0] " else ""}${getName(s)}").mkString(",\n")
      result ++= ");\n\n"
      result ++= declarations
      result ++= assignments
      result ++= combinatorial
      if sequential.nonEmpty then  
        result ++= "  always @(posedge clk)\n"
        result ++= "    begin\n"
        result ++= sequential
        result ++= "    end\n"
      result ++= "endmodule\n"
      result.toString()
    
  
  extension [U](sm:StreamingModule[U]) {
    /**
     * @param repeat Number of datasets that will be tested
     * @param addedGap Number of cycles to add between datasets, in addition to the gap required by the design
     * @returns A verilog testbench of the design
     */
    def getTestBench(repeat: Int = 2, addedGap: Int = 0): String = {

      val input = sm.testBenchInput(repeat)

      //val input = Vector.tabulate(repeat)(set => Vector.tabulate[Int](N)(i => i * 100 + set * 1000))
      //val input = Vector.tabulate(repeat)(set => Vector.tabulate[BigInt](N)(i => 0))


      var res = new StringBuilder
      res ++= "module test;\n"
      res ++= "    reg clk,rst,next;\n"
      sm.dataInputs.foreach(res ++= "    reg [" ++= (sm.hw.size - 1).toString ++= ":0] " ++= _.name ++= ";\n")
      res ++= "    wire next_out;\n"
      sm.dataOutputs.foreach(res ++= "    wire [" ++= (sm.hw.size - 1).toString ++= ":0] " ++= _.name ++= ";\n")
      res ++= "\n"
      res ++= " //Clock\n"
      res ++= "    always\n"
      res ++= "      begin\n"
      res ++= "        clk <= 0;#50;\n"
      res ++= "        clk <= 1;#50;\n"
      res ++= "      end\n"
      res ++= "\n"
      res ++= "//inputs\n"
      res ++= "    initial\n"
      res ++= "      begin\n"
      res ++= "        @(posedge clk);\n"
      res ++= "        next <= 0;\n"
      (0 to (sm.latency - sm.nextAt + sm.T)).foreach(_ => res ++= "        @(posedge clk);\n")
      res ++= "        rst <= 1;\n"
      res ++= "        @(posedge clk);\n"
      res ++= "        @(posedge clk);\n"
      res ++= "        rst <= 0;\n"
      (Math.min(sm.nextAt, 0) until Math.max((sm.T + sm.minGap + addedGap) * repeat, (sm.T + sm.minGap + addedGap) * (repeat - 1) + sm.nextAt + 4)).foreach(cycle => {
        res ++= "        @(posedge clk); //cycle " ++= cycle.toString ++= "\n"
        if ((cycle - sm.nextAt) >= 0 && (cycle - sm.nextAt) % (sm.T + sm.minGap + addedGap) == 0 && (cycle - sm.nextAt) / (sm.T + sm.minGap + addedGap) < repeat)
          res ++= "        next <= 1;\n"
        if ((cycle - sm.nextAt + 1) >= 0 && (cycle - sm.nextAt) % (sm.T + sm.minGap + addedGap) == 1 && (cycle - sm.nextAt) / (sm.T + sm.minGap + addedGap) < repeat)
          res ++= "        next <= 0;\n"
        val set = cycle / (sm.T + sm.minGap + addedGap)
        val c = cycle % (sm.T + sm.minGap + addedGap)
        if (set < repeat && cycle >= 0 && c < sm.T) {
          if (c == 0)
            res ++= "        //dataset " + set + " enters.\n"
          sm.dataInputs.zipWithIndex.foreach(i => res ++= "        " ++= i._1.name ++= " <= " ++= sm.hw.size.toString ++= "'d" ++= input(set * sm.N + c * sm.K + i._2).toString ++= ";\n")
        }
      })

      res ++= "      end\n"
      res ++= "    initial\n"
      res ++= "      begin\n"
      res ++= "        @(posedge next_out);//#100;\n"
      res ++= "        #50;\n"
      //if (check) {
      val output = input.grouped(sm.N).toSeq.zipWithIndex.flatMap { case (input, set) => sm.eval(input, set) }
      (0 until repeat).foreach(r => {
        (0 until sm.T).foreach(c => {
          (0 until sm.K).foreach(i => {
            res ++= "        $display(\"output" ++= (r * sm.T * sm.K + c * sm.K + i).toString ++= ": %0d (expected: " ++= output(r * sm.N + c * sm.K + i).toString ++= ")\"," ++= sm.dataOutputs(i).name ++= ");\n"
            //res ++= "        if(^" ++= inputs(i).toString ++= "===1'bX) $finish();\n"
            //res ++= "        errorSum = errorSum + (" ++= output(r)(c * T + i).toString ++= "-" ++= outputs(i).name + ")*(" ++= output(r)(c * K + i).toString ++= "-" ++= outputs(i).name + ");\n"

          })

          res ++= "        #100;\n"
        })

        res ++= "        #" + (100 * (sm.minGap + addedGap)) + "; //gap\n"
      })
      //}
      /*else {
      (0 until repeat).foreach(r => {
        (0 until (T)).foreach(c => {
          (0 until K).foreach(i => {
            res ++= "        $display(\"output" ++= (c * T + i).toString ++= ": %d \"," ++= dataOutputs(i).name ++= ");\n"
          })
          res ++= "        #100;\n"
        })
        res ++= "        #" + (100 * minGap) + "; //gap\n"
      })
    }*/
      res ++= "        $display(\"Success.\");\n"
      res ++= "        $finish();\n"
      res ++= "      end\n"
      res ++= "      " ++= sm.name ++= " uut(clk,rst,next," ++= (0 until sm.K).map(i => sm.dataInputs(i).name).mkString(",") ++= ",next_out," ++= (0 until sm.K).map(i => sm.dataOutputs(i).name).mkString(",") ++= ");\n"
      res ++= "endmodule\n"
      res.toString
    }

  }
}
