package RTL

import scala.collection.mutable

case class Instant(tl: Timeline, cycle: Int) extends Sig()(Unsigned(1)) {
  def +(i: Int) = copy(cycle = cycle + i)

  override val availableAt: Option[Instant] = Some(this)

  override def implement(implicit nl: Netlist): Unit = tl.addInstant(this)
}

object Instant {

  implicit class InstantCol(x: Traversable[Instant]) {
    def latest = {
      def max(lhs: Instant, rhs: Instant) = (lhs.tl, rhs.tl) match {
        case (l, r) if l == r && lhs.cycle > rhs.cycle => lhs
        case (l, r) if l == r => rhs
        case (l: FloatingTL, r) if l.parent == Some(r) || l.parent == None => rhs
        case (l, r: FloatingTL) if r.parent == Some(l) || r.parent == None => lhs
        case _ => throw new Exception("Synch error.")
      }

      x.reduce(max)
    }
  }

}

abstract class Timeline{
  def parent:Option[Timeline]
  def implementInstants(implicit nl:Netlist)
  protected val instants= mutable.Stack[Instant]()
  def addInstant(instant:Instant)={
    assert (instant.tl==this)
    instants push instant
  }
}


class FloatingTL extends Timeline {
  private var _parent: Option[Timeline] = None
  private var _offset:Option[Int]=None
  def parent = _parent

  def parent_=(ref: Timeline) = {
    assert {
      _parent == None
    }
    _parent = Some(ref)
  }
  def offset = _offset

  def offset_=(off: Int) = {
    assert {
      _offset == None
    }
    _offset = Some(off)
  }

  override def implementInstants(implicit nl: Netlist): Unit = ???
}

