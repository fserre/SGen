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

  def finisher[T](imp: StreamingModule[T]) = if (config.graph)
    imp match {
      case imp: SB[T] => println(imp.toGraph)
      case _ => println("Graphs can only be generated for non-iterative designs.")
    }
  else if (config.rtlgraph)
    println(imp.toRTLGraph)
  else
    println(imp.toVerilog)

  val argsQ = mutable.Queue.from(args)
  var config = new Config()

  def parseHW: Option[HW[_]] = argsQ.dequeue().toLowerCase() match {
    case "unsigned" => Numeric[Int].parseString(argsQ.dequeue).map(Unsigned(_))
    case "signed" => Numeric[Int].parseString(argsQ.dequeue).map(FixedPoint(_, 0))
    case "char" => Some(FixedPoint(8, 0))
    case "short" => Some(FixedPoint(16, 0))
    case "int" => Some(FixedPoint(32, 0))
    case "long" => Some(FixedPoint(64, 0))
    case "uchar" => Some(Unsigned(8))
    case "ushort" => Some(Unsigned(16))
    case "uint" => Some(Unsigned(32))
    case "ulong" => Some(Unsigned(64))
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

  while (!argsQ.isEmpty) argsQ.dequeue.toLowerCase match {
    case "-n" => config.n = Numeric[Int].parseString(argsQ.dequeue)
    case "-k" => config.k = Numeric[Int].parseString(argsQ.dequeue)
    case "-r" => config.r = Numeric[Int].parseString(argsQ.dequeue)
    case "-testbench" => config.testbench = true
    case "-graph" => config.graph = true
    case "-rtlgraph" => config.rtlgraph = true
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

      case hw: ComplexHW[Double@unchecked] if hw.innerHW.num.zero.isInstanceOf[Double] => finisher(DFT.stream(config.n, config.r, config.k, hw))
      case _ => println("DFT requires a complex of fractional hardware datatype.")
        System.exit(-1)
    }
    case "dftcompact" => config.hw match {
      case hw: ComplexHW[Double@unchecked] if hw.innerHW.num.zero.isInstanceOf[Double] => finisher(DFT.ItPeaseFused(config.n, config.r).stream(config.k)(hw))
      case _ => println("Compact DFT requires a complex of fractional hardware datatype.")
        System.exit(-1)
    }

    case arg => println("Unknown argument: " + arg)
      System.exit(-1)
  }

  class Config {
    var testbench: Boolean = false
    var graph: Boolean = false
    var rtlgraph: Boolean = false

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
}

