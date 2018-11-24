package StreamingModule

import java.io.PrintWriter
import sys.process._
import RTL._
import RTL.Sig._
//import SPL.Module
//import linalg.Complex

import scala.util.{Success, Try}

abstract class StreamingModule[ST](val t:Int,/*module: Module[ST],*/ val k: Int) {
  //val n = module.n
  //val t = n - k
  val n=t+k
  val size = 1 << n
  val streamingWidth = 1 << k
  val dataDuration = 1 << t
  def minGap=0
  //def implement(inputs: Vector[Sig[ST]], addLatency: Int = 0): (Vector[Sig[ST]], Int)

  //final def apply(inputs: Vector[Complex[Double]], set: Int): Vector[Complex[Double]] = module.eval(inputs, set)

  //def *(rhs: StreamingModule[ST]): StreamingModule[ST] = StreamingProduct(this, rhs)

  //def toTex: String = module.toTex

  /*def showTex = {
    val name="tmp"
    new PrintWriter("graph.tex") {
    write(io.Source.fromResource("standalone.tex").mkString.
      replace("CONTENT", "$"+toTex+"$"))
    close
  }

  "pdflatex graph.tex".!!
  ("cmd /c copy graph.pdf figures\\" + name + ".pdf").!!
  ("cmd /c start figures\\" + name + ".pdf").!!
}*/

  private var startTime:Option[Int]=None
  def startTime_=(value:Int):Unit=startTime=Some(value)
  case object InputTL extends Timeline
  {
    override def parent=None

    lazy val (firstInstant,timers,timerDuration)={
      val sorted=instants.sortBy(_.cycle)
      val firstInstant=sorted.head
      val lastInstant=sorted.last
      startTime = firstInstant.cycle
      val minDelay = dataDuration + minGap//(if (cur == InputTL) nl.minGap else 0)
      val timerSize = Math.max(BigInt(minDelay).bitLength - 1, 1)
      val timerDuration = (1 << timerSize) - 1
      val timers = Vector.tabulate(Utils.ceilDiv(lastInstant.cycle - firstInstant.cycle - 1, timerDuration))(i => Timer(timerSize, firstInstant + i * timerDuration))
      //timers.foreach(_.name)
      (firstInstant,timers,timerDuration)
    }

    override def implementInstants(implicit nl: Netlist): Unit = {
      //nl.startTime_=(firstInstant.cycle)
      //val lastInstant = sorted.last//nl.getList.collect { case i: Instant => i }.filter(_.tl == cur).sortBy(_.cycle).last
      /*val minDelay = nl.dataDuration + nl.minGap//(if (cur == InputTL) nl.minGap else 0)
      val timerSize = Math.max(BigInt(minDelay).bitLength - 1, 1)
      val timerDuration = (1 << timerSize) - 1
      val timers = Vector.tabulate(Utils.ceilDiv(lastInstant.cycle - firstInstant.cycle - 1, timerDuration))(i => Timer(timerSize, firstInstant + i * timerDuration))
      timers.foreach(_.name)
      val curInstants = nl.getList.collect { case i: Instant => i }.filter(_.tl == cur).sortBy(_.cycle)
      assert(curInstants(0) == firstInstant)
      assert(curInstants.last == lastInstant)*/
      var prevInstant = firstInstant
      while (!instants.isEmpty){
        val curInstant=instants.pop()
        nl.addDec("reg " + curInstant.name + ";")
        if(curInstant==firstInstant) {
          nl.addComb("assign " + firstInstant.name + " = next;")
          nl.addDec("wire " + firstInstant.name + ";")
        }
        else if (curInstant.cycle - 1 == prevInstant.cycle) {
          nl.addSeq("if (reset)")
          nl.addSeq("  "+curInstant.name + " <= 0;")
          nl.addSeq("else")
          nl.addSeq("  "+curInstant.name + " <= " + prevInstant.name + ";")
        }
        else {
          val diffCycle = curInstant.cycle - firstInstant.cycle
          val timer = (diffCycle - 2) / timerDuration
          nl.addSeq(curInstant.name + " <= " + timers(timer).name + " == " + (curInstant.cycle - 1 - (firstInstant.cycle + timer * timerDuration)) + ";")
        }
        prevInstant = curInstant
      }
    }
  }
}
/*
object StreamingModule {

  implicit class ComplexModule[T:HW:Numeric](x: StreamingModule[Complex[T]]) {
    def getVerilog = {
      def complexImp(inputs: Vector[Sig[T]]) = {
        val tmp: Vector[Sig[Complex[T]]] = inputs.grouped(2).map(v => MkComplex[T](v(0), v(1))).toVector
        val res = x.implement(tmp)
        (res._1.flatMap(v => Vector(v.re, v.im)), res._2)
      }

      def complexApply(inputs: Vector[Int], set: Int) = {
        val res = x.apply(inputs.grouped(2).map(v => Complex[Double](v(0), v(1))).toVector, set)
        res.flatMap(v => Vector(v.re.toInt, v.im.toInt))
      }

      new Implementation[T](complexImp,
        complexApply,
        Vector.tabulate(2 * x.streamingWidth)(i => "i" + i / 2 + "_" + (if (i % 2 == 0) "re" else "im")),
        Vector.tabulate(2 * x.streamingWidth)(i => "o" + i / 2 + "_" + (if (i % 2 == 0) "re" else "im")),
        "main",
        implicitly[HW[T]].size,
        x.dataDuration)
    }
  }

  implicit class SimpleModule[T:HW:Numeric](x: StreamingModule[T]) {
    def getVerilog = {
      new Implementation((i: Vector[Sig[T]]) => x.implement(i),
        (i: Vector[Int], j: Int) => x(i.map(Complex[Double](_, 0)), j).map(_.toInt),
        Vector.tabulate(x.streamingWidth)(i => "i" + i),
        Vector.tabulate(x.streamingWidth)(i => "o" + i),
        "main",
        implicitly[HW[T]].size,
        x.dataDuration)
    }
  }
}
*/