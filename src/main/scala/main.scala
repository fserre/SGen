/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

//import SB.Signals._

import SB._
import StreamingModule.StreamingModule
import _root_.SB.HW._
import _root_.SPL.FFT.DFT
import _root_.SPL.WHT.WHT
import _root_.SPL._
import linalg.Fields.F2
import linalg._

import scala.collection.mutable

object main extends App {

  class Config {
    var testbench: Boolean = false
    var graph: Boolean = false
    var rtlgraph:Boolean = false

    private var _n: Option[Int] = None

    def n_=(arg: Option[Int]) = _n = arg

    def n: Int = _n match {
      case Some(n) => n
      case _ => println("Parameter required: -n")
        System.exit(-1)
        0
    }

    private var _r: Option[Int] = None

    def r_=(arg: Option[Int]) = _r = arg

    def r: Int = _r match {
      case Some(r) => r
      case _ => (1 to k).reverse.filter(n % _ == 0).head
    }

    private var _k: Option[Int] = None

    def k_=(arg: Option[Int]) = _k = arg

    def k: Int = _k match {
      case Some(k) => k
      case _ => n
    }


    private var _hw: Option[HW[_]] = None

    def hw_=(arg: Option[HW[_]]) = _hw = arg

    def hw: HW[_] = _hw match {
      case Some(k) => k
      case _ => Unsigned(16)
    }

  }

  val argsQ = mutable.Queue.from(args)
  var config = new Config()
  //implicit val hw2 = ComplexHW(FixedPoint(8, 8))
  implicit val hw2 = ComplexHW(IEEE754(8, 23))

  def finisher[T](imp: StreamingModule[T]) = if (config.graph)
    imp match {
    case imp: SB[T] => println(imp.toGraph)
    case _ => println("Graphs can only be generated for non-iterative designs.")
  }
  else if (config.rtlgraph)
    println(imp.toRTLGraph)
  else
    println(imp.toVerilog)

  while (!argsQ.isEmpty) argsQ.dequeue.toLowerCase match {
    case "-n" => config.n = Numeric[Int].parseString(argsQ.dequeue)
    case "-k" => config.k = Numeric[Int].parseString(argsQ.dequeue)
    case "-testbench" => config.testbench = true
    case "-graph" => config.graph=true
    case "-rtlgraph" => config.rtlgraph=true
    case "-hw" => config.hw = parseHW
    case "lp" =>
      val matrices = mutable.Queue[Matrix[F2]]()
      val n = config.n
      if (argsQ.isEmpty) {
        println("Invertible bit-matrices expected.")
        System.exit(-1)
      }
      while (!argsQ.isEmpty) argsQ.dequeue match {
        case "identity" => matrices.enqueue(Matrix.identity[F2](n))
        case "bitrev" => matrices.enqueue(Matrix.reverseIdentity[F2](n))
        case matrix if matrix.length == n * n => val mat = Matrix(n, n, matrix)
          if (mat.isInvertible)
            matrices.enqueue(mat)
          else {
            println(mat)
            println("is not invertible.")
            System.exit(-1)
          }
        case mat: String => println(mat + " is not a valid invertible bit-matrix.")
          System.exit(-1)
      }
      finisher(LinearPerm.stream(matrices.toSeq, config.k, config.hw))

    case "wht" => finisher(WHT.stream(config.n, config.r, config.k, config.hw))
    case "dft" => config.hw match {
      case hw: ComplexHW[Double] if hw.innerHW.num.zero.isInstanceOf[Double] => finisher(DFT.stream(config.n, config.r, config.k, hw))
      case _ => println("DFT requires a complex of fractional hardware datatype.")
        System.exit(-1)
    }
    case "dftcompact" => config.hw match {
      case hw: ComplexHW[Double] if hw.innerHW.num.zero.isInstanceOf[Double] => finisher(DFT.ItPeaseFused(config.n, config.r).stream(config.k)(hw))
      case _ => println("Compact DFT requires a complex of fractional hardware datatype.")
        System.exit(-1)
    }

    case arg => println("Unknown argument: " + arg)
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
  //WHT[Complex[Int]](4).stream(4)(ComplexHW(Unsigned(16))).asInstanceOf[SB[Complex[Int]]].showGraph()
  //DiagE(5,1,1).stream(3)(ComplexHW(FixedPoint(16,0))).asInstanceOf[SB[Complex[Double]]].showGraph()
  //DFT.CTDFT(3,1).stream(2)(ComplexHW(FixedPoint(16,0))).asInstanceOf[SB[Complex[Double]]].showGraph()
  implicit val hw = Unsigned(16)
  implicit val hw3 = FixedPoint(8, 8)

  def parseHW: Option[HW[_]] = argsQ.dequeue().toLowerCase() match {
    case "unsigned" => Numeric[Int].parseString(argsQ.dequeue).map(Unsigned(_))
    case "fixedpoint" => for {
      magnitude <- Numeric[Int].parseString(argsQ.dequeue)
      fractional <- Numeric[Int].parseString(argsQ.dequeue)
    } yield FixedPoint(magnitude, fractional)
    case "flopoco" => for {
      wE <- Numeric[Int].parseString(argsQ.dequeue)
      wF <- Numeric[Int].parseString(argsQ.dequeue)
    } yield Flopoco(wE, wF)
    case "ieee754" => for {
      wE <- Numeric[Int].parseString(argsQ.dequeue)
      wF <- Numeric[Int].parseString(argsQ.dequeue)
    } yield IEEE754(wE, wF)
    case "half" => Some(IEEE754(5, 10))
    case "float" => Some(IEEE754(8, 23))
    case "double" => Some(IEEE754(11, 52))
    case "minifloat" => Some(IEEE754(4, 3))
    case "bfloat16" => Some(IEEE754(8, 7))
    case "complex" => parseHW.map(ComplexHW(_))
    case _ => None
  }
  //DFT.CTDFT(3,1).stream(1).asInstanceOf[SB[Complex[Double]]].showRTLGraph()
  //ItProduct(2,LinearPerm[Int](Matrix.reverseIdentity[F2](3))).stream(1).showRTLGraph()
  //println(ItProduct(3,LinearPerm[Int](Seq(Matrix.reverseIdentity[F2](3),Matrix.identity[F2](3)))).stream(1).test(Vector.tabulate(1 << 3)(i => i)))
  //Product(SwitchArray(Vector((. 1)^T),2), SwitchArray(Vector((1 .)^T),2))
  //val test=SB.Product[Double](SwitchArray[Double](Vec.fromInt(2,1),2), SwitchArray[Double](Vec.fromInt(2,2),2))
  //println(test.test(Vector.tabulate(2 << test.n)(i => i)))
  //test.showRTLGraph()

  //println(FixedPoint(8,8).valueOf(BigInt(256)))
  //val test=StreamingModule.ItProduct(2,TemporalNG[Int](Vec.fromInt(3,1),Matrix(3,3,"010001100"))*SwitchArray[Int](Vec.fromInt(3,1),1)*Delay[Int](3,1,64))
  //val test=TemporalNG[Int](Vec.fromInt(3,1),Matrix(3,3,"010001100"))*Delay[Int](3,1,0)
  //val test=DFT.CTDFT(3,1).stream(1)
  //println(test.test(Vector.tabulate(2 << test.n)(i => Complex(i)),1))
  //test.showRTLGraph()

  //val test2=Flopoco(8,23)
  //println(test2.bitsOf(1))
  //println(test2.valueOf(test2.bitsOf(1)))
}

