package RTL

import RTL.Sig._

case class Tap[T] private(input: Sig[_], range: Range, _dt: HW[T]) extends Sig()(_dt) {
  assert(range.size > 0)
  override val availableAt: Option[Instant] = input.availableAt

  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = " + input.name + "[" + (if (busSize > 1) range.last + ":" else "") + range.start + "];")
}

object Tap{
  private def apply[T](input: Sig[_], range: Range, _dt: HW[T]) = new Tap(input, range, _dt)

  def apply(input: Sig[Double], dt: FxP): Sig[Double] = Tap(input, (input.dt.asInstanceOf[FxP].fractional - dt.fractional) until (input.dt.asInstanceOf[FxP].fractional - dt.fractional + dt.size), dt)

  def apply(input: Sig[Int], r: Range): Sig[Int] = {
    require(input.dt.isInstanceOf[Unsigned])
    require(r.start >= 0)
    if (r.size == 0)
      Const(0)(Unsigned(0))
    else {
      assert(r.last < input.busSize)
      input match {
        case _ if r.length == input.busSize => input
        case Const(value) => Const(((((1 << r.length) - 1) << r.start) & value) >> r.start)(Unsigned(r.length))
        //case Tap(input2, r2,_) => Tap(input2, (r2.start + r.start) to (r2.start + r.last))
        /*case Concat(signals: Vector[Signal[Unsigned]]@unchecked, _) if signals(0).dt.isInstanceOf[Unsigned] => {
          def trimLeft(in: Vector[Signal[Unsigned]], start: Int): Vector[Signal[Unsigned]] = {
            if (in.head.busSize <= start)
              trimLeft(in.tail, start - in.head.busSize)
            else
              Tap(in.head, 0 until (in.head.busSize - start)) +: in.tail
          }

          def trimRight(in: Vector[Signal[Unsigned]], end: Int): Vector[Signal[Unsigned]] = {
            if (in.last.busSize <= end)
              trimRight(in.take(in.size - 1), end - in.last.busSize)
            else
              in.take(in.size - 1) :+ Tap(in.last, end until in.last.busSize)
          }

          (trimRight(trimLeft(signals, input.busSize - r.last - 1), r.start)).combine
        }*/
        case _ => new Tap(input, r,Unsigned(r.size))
      }
    }
  }

//def apply(input: Signal[FxP], dt: FxP): Signal[FxP] = Tap(input, (input.dt.fractional - dt.fractional) until (input.dt.fractional - dt.fractional + dt.size), dt)
}

case class Concat[T] private(inputs: Vector[Sig[_]], _dt: HW[T]) extends Sig()(_dt) {
  override val availableAt: Option[Instant] = inputs.availableAt
  override def implement(implicit nl: Netlist) = nl.addComb("assign " + name + " = {" + inputs.map(_.name).mkString(", ") + "};")
}

object Concat{
  private def apply[T](inputs: Vector[Sig[_]], dt: HW[T]) = new Concat(inputs, dt)
  def apply(inputs: Vector[Sig[Int]]):Sig[Int] ={
    require(!inputs.isEmpty)
    require(inputs(0).dt.isInstanceOf[Unsigned])
    inputs.reduceLeft(_ :: _)
  }
  def apply(lhs: Sig[Int], rhs: Sig[Int]): Sig[Int] = {
//    require(lhs.dt==rhs.dt)
    require(lhs.dt.isInstanceOf[Unsigned])
    require(rhs.dt.isInstanceOf[Unsigned])
    //def create(inputs: Vector[Signal[Unsigned]]): Signal[Unsigned] = if (inputs.size == 1) inputs(0) else new Concat(inputs.synch, Unsigned(inputs.map(_.dt.size).sum))

    (lhs, rhs) match {
      case (Empty(), _) => rhs
      case (_, Empty()) => lhs

      case (Const(value1), Const(value2)) => Const((value1 << rhs.dt.size) + value2)(Unsigned(lhs.dt.size + rhs.dt.size))
      //case (Tap(lhs, lr,_), Tap(rhs, rr,_)) if lhs == rhs && rr.last + 1 == lr.start => lhs(rr.start to lr.last)

/*      case (Concat((lhsl: Vector[Signal[Unsigned]]@unchecked) :+ Const(value1, dt1: Unsigned), _), Const(value2, dt2)) => create(lhsl :+ Const[Unsigned]((value1 << dt2.size) + value2, Unsigned(dt1.size + dt2.size)))
      case (Concat((lhsl: Vector[Signal[Unsigned]]@unchecked) :+ Tap(lhs: Signal[Unsigned]@unchecked, lr, _), _), Tap(rhs, rr: Signal[Unsigned]@unchecked, _)) if lhs.dt.isInstanceOf[Unsigned] && lhs == rhs && rr.last + 1 == lr.start => create(lhsl :+ lhs(rr.start to lr.last))

      case (_, Concat((rhsH: Signal[Unsigned]@unchecked) +: (rhsT: Vector[Signal[Unsigned]]@unchecked), _)) if rhsH.dt.isInstanceOf[Unsigned] => Concat(Concat(lhs, rhsH), create(rhsT))
      case (Concat(values: Vector[Signal[Unsigned]]@unchecked, _), _) if (values(0).dt.isInstanceOf[Unsigned]) => create(values :+ rhs)
*/
      case _ => Concat(Vector(lhs, rhs),Unsigned(lhs.dt.size+rhs.dt.size))
    }
  }
}