/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

package object Utils {
  def gcd(a: Int, b: Int): Int = if (b == 0) a.abs else gcd(b, a % b)

  def lcm(a: Int, b: Int): Int = (a * b).abs / gcd(a, b)

  def lcm(x: Vector[Int]): Int = x.reduce(lcm)
}
