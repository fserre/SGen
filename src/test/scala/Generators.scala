import linalg.Fields.F2
import linalg.{Matrix, Vec}
import org.scalacheck.{Gen, Shrink}

object Generators {
  implicit val genF2 = Gen.oneOf(F2(true), F2(false))
  implicit val genVec = for {
    size <- Gen.choose(1, 10)
    value <- Gen.choose(0, (1 << size) - 1)
  } yield Vec.fromInt(size, value)

  implicit def genVec(size: Int) = Gen.choose(0, (1 << size) - 1).map(value => Vec.fromInt(size, value))

  implicit def shrinkVec(implicit s: Shrink[Int]) = Shrink { v: Vec[F2] =>
    for {
      size <- s.shrink(v.m)
      if (size > 0)
      value <- s.shrink(v.toInt())
      if value < (1 << size)
    } yield Vec.fromInt(size, value)
  }

  def genInvLower(n: Int) = {
    Gen.listOfN(n * (n - 1) / 2, genF2).map(v => Matrix.tabulate(n, n)((i, j) =>
      if (i > j)
        v(i * (i - 1) / 2 + j)
      else
        F2(i == j)
    ))
  }

  def genMatrix(m: Int, n: Int) = Gen.listOfN(m * n, genF2).map(v => Matrix(m, n, v.toVector))

  def genInvertible(n: Int) = for {
    u1 <- genInvLower(n)
    u2 <- genInvLower(n)
    u3 <- genInvLower(n)
  } yield u1 * u2.transpose * u3
}
