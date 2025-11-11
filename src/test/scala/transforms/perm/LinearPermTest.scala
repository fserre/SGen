package transforms.perm

import ir.rtl.RAMControl
import ir.rtl.hardwaretype.{HW, Unsigned}
import org.scalatest.Tag
import org.scalatest.funsuite.AnyFunSuiteLike
import helpers.Xsim
import helpers.Xsim.test

class LinearPermTest extends AnyFunSuiteLike:
  val hw: HW[Int] = Unsigned(16)

  for
    t <- 1 to 5
    k <- 1 to 5
    n = t + k
    m <- 0 until n
    dp <- RAMControl.values
  do
    test(s"Full-shuffle simulation (size 2^$n, power $m, 2^$k ports, $dp RAM banks)", Tag("simulation")):
      val inputs = 0 until (1 << n) * 5
      LinearPerm(LinearPerm.Lmat(m, n)).test(k, dp, hw, s"shuffle-$n-$m-$k-$dp")

  for
    t <- 1 to 5
    k <- 1 to 5
    n = t + k
    r <- 1 until n if n % r == 0
    dp <- RAMControl.values
  do
    test(s"Bitreversal simulation (size 2^$n, blocks 2^$r, 2^$k ports, $dp RAM banks)", Tag("simulation")):
      val inputs = 0 until (1 << n) * 5
      LinearPerm(LinearPerm.Rmat(r, n)).test(k, dp, hw, s"bitrev-$n-$r-$k-$dp")



