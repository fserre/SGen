/**
  * LUL Factorisation - ETH Zurich
  * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
  */

package linalg

object Examples extends App {
  println("First example of the article:")
  val P1 = Matrix[F2](7, 7, Vector(
    1, 1, 0, 0, 1, 0, 1,
    0, 0, 1, 0, 0, 1, 0,
    1, 1, 0, 1, 1, 1, 1,
    0, 0, 0, 0, 0, 1, 1,
    1, 0, 1, 1, 0, 0, 0,
    1, 1, 0, 0, 1, 1, 1,
    0, 1, 0, 0, 0, 0, 0
  ))
  val lul1 = new LUL(P1, 4, 3)
  val L1 = lul1.getSolution
  println("Solution:")
  println("L=")
  println(L1)
  assert(lul1.isSolution(L1))
  println()

  println("Second example of the article:")
  val P2 = Matrix[F2](7, 7, Vector(
    0, 1, 1, 1, 1, 0, 0,
    1, 0, 0, 1, 0, 1, 1,
    0, 1, 1, 1, 0, 1, 1,
    1, 1, 0, 1, 0, 1, 1,
    1, 0, 0, 1, 0, 1, 0,
    0, 0, 0, 1, 0, 1, 0,
    1, 0, 1, 1, 1, 1, 0
  ))
  val lul2 = new LUL(P2, 4, 3)
  val L2 = lul2.getSolution
  println("Solution:")
  println("L=")
  println(L2)
  assert(lul2.isSolution(L2))
  println()

  println("Example using rational numbers:")
  val P = Matrix[Q](7, 7, Vector(
    1, Q(5, 2), 0, 0, 1, 0, 1,
    0, 0, 7, 0, 0, 1, 0,
    1, 1, 0, 1, 11, 1, 1,
    0, 0, 6, 0, 0, 1, 1,
    1, 0, 1, 1, 0, 0, 0,
    1, 1, 0, 2, 1, 1, 1,
    0, 5, 10, 0, 0, 0, 0
  ))
  val lul = new LUL(P, 4, 3)
  val L = lul.getSolution
  println("Solution:")
  println("L=")
  println(L)
  assert(lul2.isSolution(L2))
}
