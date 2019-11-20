/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

//import SB.Signals._

import SB._
import _root_.SB.HW.{ComplexHW, FixedPoint, HW, Unsigned}
import _root_.SB.SLP.{Steady, SwitchArray, Temporal}
import SPL._
import _root_.SPL._
import _root_.SPL.FFT.DFT2
import Signals._
import StreamingModule.StreamingModule
import linalg.Fields.{Complex, F2}
import linalg.{Matrix, Vec}
import java.lang.System.{currentTimeMillis => currentTime}

import _root_.SPL.WHT.WHT

import scala.collection.mutable
object main extends App {

  class Config{
    var testbench:Boolean=false

    private var _n:Option[Int]=None
    def n_=(arg:Option[Int])=_n=arg
    def n:Int=_n match{
      case Some(n) => n
      case _ => println("Parameter required: -n")
        System.exit(-1)
        0
    }

    private var _k:Option[Int]=None
    def k_=(arg:Option[Int])=_k=arg
    def k:Int=_k match{
      case Some(k) => k
      case _ => n
    }


    private var _hw:Option[HW[_]]=None
    def hw_=(arg:Option[HW[_]])=_hw=arg
    def hw:HW[_]=_hw match{
      case Some(k) => k
      case _ => Unsigned(16)
    }

  }

  val argsQ=mutable.Queue.from(args)
  var config=new Config()
  def parseHW:Option[HW[_]]=argsQ.dequeue() match{
    case "unsigned" => Numeric[Int].parseString(argsQ.dequeue).map(Unsigned(_))
    case "fixedpoint" => for{
      magnitude<-Numeric[Int].parseString(argsQ.dequeue)
      fractional<-Numeric[Int].parseString(argsQ.dequeue)
    }yield FixedPoint(magnitude,fractional)
    case "complex" => parseHW.map(ComplexHW(_))
    case _ => None
  }
while(!argsQ.isEmpty) argsQ.dequeue match{
  case "-n" => config.n=Numeric[Int].parseString(argsQ.dequeue)
  case "-k" => config.k=Numeric[Int].parseString(argsQ.dequeue)
  case "-testbench" => config.testbench=true
  case "-hw" => config.hw=parseHW
  case "lp" =>
    val matrices=mutable.Queue[Matrix[F2]]()
    val n=config.n
    if (argsQ.isEmpty){
      println("Invertible bit-matrices expected.")
      System.exit(-1)
    }
    while(!argsQ.isEmpty) argsQ.dequeue match{
      case "identity" => matrices.enqueue(Matrix.identity[F2](n))
      case "bitrev" => matrices.enqueue(Matrix.reverseIdentity[F2](n))
      case matrix if matrix.length==n*n => val mat=Matrix(n,n,matrix)
        if(mat.isInvertible)
          matrices.enqueue(mat)
        else{
          println(mat)
          println ("is not invertible.")
          System.exit(-1)
        }
      case mat:String => println(mat+ " is not a valid invertible bit-matrix.")
        System.exit(-1)
    }
    val imp=LinearPerm(matrices.toSeq).stream(config.k)(config.hw)
    println(imp.toVerilog)
  case "wht" => def run[T](hw:HW[T])=WHT(config.n)(hw.num).stream(config.k)(hw)
    println(run(config.hw).toVerilog)
case arg => println("Unknown argument: "+arg)
    System.exit(-1)
}
  /*case object DFT2 extends SB(1,1)(Unsigned(3)){
    def implement(inputs: Vector[Sig[Int]])=Vector(inputs(0)+inputs(1),inputs(0)+inputs(1))

    override def implement(inputs: Seq[Sig[Int]]): Seq[Sig[Int]] = Vector(inputs(0)+inputs(1),inputs(0)+inputs(1))

    override def spl: SPL[Int] = ???
  }*/

  //println(DFT2.getVerilog.verilog)
  /*val start=Input(1,"start")
    val w=new Wire(2,u)
    val u:Component=Register(start?(Const(2,0),w+1))
    val s=Output(u,"truc")
    object Test extends StreamingModule(2,1,1){
      override def implement(rst: Component, token: Int => Component, inputs: Seq[Component]): Seq[Component] = inputs.map(Plus(_,token(0)))

      override def latency: Int = 2

      override val name: String = "test"
    }
    println(Test.toVerilog)*/

/*val sb=WHT[Complex[Double]](6).stream(2)(ComplexHW(FixedPoint(16,0)))
  println(sb.toVerilog)
  println(currentTime-this.executionStart)
*/


}

