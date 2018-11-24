package RTL


/**
  * Created by Bastos on 03.12.2017.
  */
case class RollingTimer(limit: Int, reset: Instant) extends Sig()(Unsigned(BigInt(limit - 1).bitLength)) {
  override val availableAt: Option[Instant] = Some(reset+1)
  override def declaration(implicit nl: Netlist) = Some("reg " + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
      nl.addSeq("if (" + reset.name + ")")
    nl.addSeq("  " + name + " <= 0;")
    nl.addSeq("else")
    nl.addSeq("  " + name + " <= " + name + " + 1;")
  }

}
object RollingTimer {
  def apply(limit: Int): Sig[Int] = if (limit == 1) Const(0)(Unsigned(0)) else new RollingTimer(limit, Instant(new FloatingTL, 0))
}

case class Timer private(size: Int, trigger: Instant) extends Sig()(Unsigned(size)) {
  assert(size>=1)
  override val availableAt: Option[Instant] = Some(trigger)
  override def declaration(implicit nl: Netlist) = Some("reg " + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
    nl.addSeq("if (reset)")
    nl.addSeq("  " + name + " <= 0;")
    nl.addSeq("else if ("+name+" == 0)")
    nl.addSeq("  " + name + " <= " + trigger.name + ";")
    nl.addSeq("else")
    nl.addSeq("  " + name + " <= " + name + " + 1;")
  }

}

object Timer {
  def apply(size: Int, trigger: Instant) = if (size == 1) Register(trigger, true) else new Timer(size, trigger)
}