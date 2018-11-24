package RTL

import scala.collection.mutable

class Netlist(val inputs: Vector[Input[_]], val outputs: Vector[Sig[_]], val name: String, val dataDuration:Int, val minGap:Int) {
  implicit val nl=this
  private val names = mutable.Map[Sig[_], String]()
  private val combinatorial = new mutable.StringBuilder
  private val sequential = new mutable.StringBuilder
  private val declarations = new mutable.StringBuilder
  private val toImplement: mutable.Queue[Sig[_]] = outputs.to // mutable.Queue[Sig[_]]()
  private val floatingDelays= mutable.ArrayBuffer[FloatingDelay[_]]()


  def addComb(line: String) = combinatorial ++= "  " ++= line ++= "\n"

  def addSeq(line: String) = sequential ++= "     " ++= line ++= "\n"

  def addDec(line: String) = declarations ++= "  " ++= line ++= "\n"
  def getName(sig: Sig[_]) = {
    if (!(names contains sig)) {
      //toImplement.enqueue(sig)
      names(sig) = "s" + (names.size + 1)
      toImplement.enqueue(sig)
    }
    names(sig)
  }

  def addFloatindDelay(fd:FloatingDelay[_])=floatingDelays += fd


  while (!toImplement.isEmpty) {
    while (!toImplement.isEmpty) {
      val cur = toImplement.dequeue
      cur.declaration.foreach(addDec)
      cur.implement
    }
    val tmp = floatingDelays.flatMap(_.input.availableAt).map(_.tl).toSet
    tmp.foreach { tl =>
      val fds = floatingDelays.filter(_.input.availableAt.exists(_.tl == tl))
      val offset = fds.map(fd => fd.instant.cycle - fd.input.availableAt.get.cycle).min
      println(offset)
      fds.foreach { fd =>
        addComb("assign " + fd.name + " = " + fd.input.delay(fd.instant.cycle - fd.input.availableAt.get.cycle - offset).name + ";")
      }
    }
    floatingDelays.clear()
  }
  /*private def implementTL(implemented: Set[Timeline] = Set())(implicit nl: Netlist): Unit = {
    //println("duration "+nl.dataDuration)
    val remainingTLs = instants.map(_.tl).toSet.filterNot(implemented contains _)
    if (!remainingTLs.isEmpty) {
      val cur = remainingTLs.filter(tl => !remainingTLs.exists(_.parent contains tl)).head
      cur.implementInstants(instants.filter(_.tl==cur).toVector)
      /*cur match {
        case InputTL =>
        case x: InnerLoopTL => {
          val curInstants = nl.getList.collect { case i: Instant => i }.filter(_.tl == cur).sortBy(_.cycle)
          var prevInstant = curInstants(0)
          curInstants.foreach(curInstant => {
            nl.addDec("reg " + curInstant.name + ";")
            if (prevInstant.cycle == curInstant.cycle - 1)
              nl.addSeq(curInstant.name + " <= " + prevInstant.name + ";")
            else
              nl.addSeq(curInstant.name + " <= " + (0 until x.power).map(i => curInstant.cycle - 1 + i * (x.duration)).map(x.initial + _).map(_.name).mkString(" | ") + ";")
            prevInstant = curInstant
          })
        }
        case _ =>
      }*/
      implementTL(implemented + cur)
    }
  }
*/
  def getVerilog = {
    var _verilog = new StringBuilder

    _verilog ++= "module " + name + "(input clk, input reset, input next, output next_out,\n"
    _verilog ++= inputs.map(s => "  input " + (if (s.dt.isInstanceOf[FxP]) "signed " else "") + (if (s.busSize != 1) "[" + (s.busSize - 1) + ":0] " else "") + s.name(this) + ",\n").mkString("")
    _verilog ++= outputs.map(s => "  output " + (if (s.dt.isInstanceOf[FxP]) "signed " else "") + (if (s.busSize != 1) "[" + (s.busSize - 1) + ":0] " else "") + s.name(this)).mkString(",\n")
    _verilog ++= ");\n\n"
    _verilog ++= declarations
    _verilog ++= combinatorial
    _verilog ++= "  always @(posedge clk)\n"
    _verilog ++= "    begin\n"
    _verilog ++= sequential
    _verilog ++= "    end\n"
    _verilog ++= "endmodule\n"
    _verilog.toString()
  }




}
