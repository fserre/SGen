package maths.fields

import org.scalatest.funsuite.AnyFunSuiteLike

class ComplexTest extends AnyFunSuiteLike:
  test("Parsing some complex numbers"):
    val num=Complex.complexIsFractional[Double]
    import num.parseString
    val c1 = parseString("3+4i")
    assert(c1.contains(Complex(3.0, 4.0)))

    val c2 = parseString("2.5 - 0.75i")
    assert(c2.contains(Complex(2.5, -0.75)))

    val c3 = parseString("i-1.2")
    assert(c3.contains(Complex(-1.2, 1.0)))

    val c4 = parseString("5")
    assert(c4.contains(Complex(5.0, 0.0)))

    val c5 = parseString("i")
    assert(c5.contains(Complex(0.0, 1.0)))
