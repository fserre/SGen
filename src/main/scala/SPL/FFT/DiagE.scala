package SPL.FFT

import SB.HW.{ComplexHW, FixedPoint, HW}
import SB.SB
import _root_.SB.Signals.{ROM, Sig, Timer}
import SPL.{Repeatable, SPL}
import StreamingModule.StreamingModule
import linalg.Fields.Complex
import linalg.Fields.Complex._

case class DiagE(override val n: Int, r: Int, l: Int) extends SPL[Complex[Double]](n) with Repeatable[Complex[Double]] {
  def pow(x: Int) = {
    val j = x % (1 << r)
    val i = (x >> r) % (1 << (n - r * (l + 1)))
    (i * j) << (r * l)
  }

  def coef(i: Int) = DFT.omega(n, pow(i))

  override def eval(inputs: Seq[Complex[Double]], set: Int): Seq[Complex[Double]] = inputs.zipWithIndex.map { case (input, i) => input * coef(i % (1 << n)) }

  override def stream(k: Int)(implicit hw: HW[Complex[Double]]) = new SB(n - k, k) {
    override def implement(inputs: Seq[Sig[Complex[Double]]])(implicit sb: SB[_]): Seq[Sig[Complex[Double]]] = {
      (0 until K).map(p => {
        val twiddles = Vector.tabulate(T)(c => coef((c * K) + p))
        val twiddleHW = hw match {
          case ComplexHW(FixedPoint(magnitude, fractional)) => ComplexHW(FixedPoint(1, magnitude + fractional - 1))
          case _ => hw
        }
        val control = Timer(T)
        val twiddle = ROM(twiddles, control)(twiddleHW, sb)
        inputs(p) * twiddle
      })
    }

    override def spl: SPL[Complex[Double]] = DiagE(n, r, l)
  }
}
