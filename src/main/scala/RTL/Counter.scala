package RTL


/**
  * Created by Bastos on 03.12.2017.
  */
case class Counter private(limit: Int, trigger: Instant, lateUpdate: Option[Int]) extends Sig()(Unsigned(BigInt(limit - 1).bitLength)) {
  assert(trigger.dt == Unsigned(1))
  override val availableAt: Option[Instant] = trigger.availableAt.map(_ + 1)
  override def declaration(implicit nl: Netlist) = Some("reg " + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
    nl.addSeq("if (reset)")
    nl.addSeq("  " + name + " <= " + (if(lateUpdate==None)(limit - 1)else 0) + ";")
    nl.addSeq("else")
    nl.addSeq("  if (" + (trigger+lateUpdate.getOrElse(0)).name + ")")
    nl.addSeq("    " + name + " <= " + (if (BigInt(limit).bitCount > 1) "(" + name + " == " + (limit - 1) + ") ? 0 : " else "") + name + " + 1" + ";")
  }
}

object Counter {
  def apply(limit: Int, lateUpdate: Option[Int] = None): Sig[Int] = if (limit == 1) Const(0)(Unsigned(0)) else new Counter(limit, Instant(new FloatingTL, 0), lateUpdate)
}

case class ShiftCounter(size: Int, trigger: Instant) extends Sig()(Unsigned(size)) {
  override lazy val availableAt = Some(trigger+1)
  override def declaration(implicit nl: Netlist) = Some("reg " + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")
  override def implement(implicit nl: Netlist) = {
    nl.addSeq("if (reset)")
    nl.addSeq("  " + name + " <= " + size + "'b" + ("0" * size) + ";")
    nl.addSeq("else")
    nl.addSeq("  if (" + trigger.name + ")")
    nl.addSeq(if(size==1)
        "    " + name + " <= ~"+ name +";"
      else
        "    " + name + " <= (" + name + "[" + (size - 1) + "]) ? {" + name + "[" + (size - 2) + ":0],1'b0} : " + size + "'b" + ("1" * size) + ";")
  }

}
object ShiftCounter {
  def apply(size: Int): Sig[Int] = if (size == 0) Const(0)(Unsigned(0)) else new ShiftCounter(size, Instant(new FloatingTL, 0))
}
