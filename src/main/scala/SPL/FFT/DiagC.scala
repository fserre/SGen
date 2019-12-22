package SPL.FFT

import SB.HW.{ComplexHW, FixedPoint, HW, Unsigned}
import SB.SB
import SPL.{Repeatable, SPL}
import _root_.SB.Signals.{Const, Counter, ROM, Sig, Timer}
import linalg.Fields.Complex
import linalg.Fields.Complex._

case class DiagC(override val n: Int, r: Int, l: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]] {
  def pow(x: Int) = {
    val j = x % (1 << r)
    val i = ((x >> r) >> (r * l)) << (r * l)
    i * j
  }

  def coef(i: Int) = DFT.omega(n, pow(i))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map { case (input, i) => input * coef(i % (1 << n)) }

  override def stream(k: Int)(implicit hw: HW[Complex[Double]]) = new SB(n - k, k) {
    override def implement(inputs: Seq[Sig[Complex[Double]]])(implicit sb: SB[_]): Seq[Sig[Complex[Double]]] = {
      (0 until K).map(p => {
        val twiddles = Vector.tabulate(T)(c => coef((c * K) + p))
        val twiddleHW = hw match {
          case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(2, magnitude + fractional - 2))
          case _ => hw
        }
        val control = Timer(T)
        val twiddle = ROM(twiddles, control)(twiddleHW, sb)
        inputs(p) * twiddle
      })
    }

    override def spl: SPL[Complex[Double]] = DiagC(n, r, l)
  }
}

case class StreamDiagC(override val n: Int, r: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]] {
  def pow(x: Int, l: Int) = {
    val j = x % (1 << r)
    val i = ((x >> r) >> (r * l)) << (r * l)
    i * j
  }

  def coef(i: Int, l: Int) = DFT.omega(n, pow(i, l))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map { case (input, i) => input * coef(i % (1 << n), set % (n / r)) }

  override def stream(k: Int)(implicit hw: HW[Complex[Double]]) = {
    //require(k>=r)
    new SB(n - k, k) {
      override def implement(inputs: Seq[Sig[Complex[Double]]])(implicit sb: SB[_]): Seq[Sig[Complex[Double]]] = {
        (0 until K).map(p => {
          val j = p % (1 << r)
          val coefs = Vector.tabulate(1 << (n - r))(i => DFT.omega(n, i * j))
          //val twiddles = Vector.tabulate(T)(c => coef((c * K) + p))
          val twiddleHW = hw match {
            case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(2, magnitude + fractional - 2))
            case _ => hw
          }
          /*val control = Timer(T)
          val twiddle = ROM(twiddles, control)(twiddleHW, sb)*/
          val control1 = Timer(T) :: Const(p >> r)(Unsigned(k - r), implicitly)
          //println(control1)
          val control2a = Counter(n / r)
          val control2 = ROM(Vector.tabulate(n / r)(i => ((1 << (i * r)) - 1) ^ ((1 << (n - r)) - 1)), control2a)(Unsigned(n - r), implicitly)
          val control = control1 & control2
          val twiddle = ROM(coefs, control)(twiddleHW, implicitly)
          inputs(p) * twiddle
        })
      }

      override def toString: String = "StreamDiagC(" + n + "," + r + "," + k + ")"

      override def spl: SPL[Complex[Double]] = StreamDiagC(n, r)
    }
  }
}
