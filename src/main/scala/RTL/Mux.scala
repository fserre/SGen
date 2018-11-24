package RTL


/**
  * Created by Bastos on 02.12.2017.
  */
case class Mux[T] private(control: Sig[Int], inputs: Vector[Sig[T]]) extends Sig()(inputs(0).dt) {
  assert(inputs.forall(_.dt == dt))
  assert(inputs.forall(_.busSize==busSize))
  assert(control.dt.isInstanceOf[Unsigned])
  assert((1<<control.busSize)>=inputs.size)
  override val availableAt = (control+:inputs).availableAt

  override def declaration(implicit nl: Netlist) = Some("reg " + (if (dt.isInstanceOf[FxP]) "signed " else "") + (if (busSize != 1) "[" + (busSize - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
    nl.addComb("always @(*)")
      nl.addComb("  case(" + control.name + ")")
    (0 until inputs.size).foreach(i =>nl.addComb("    " + (if(i==inputs.size-1 && ((1<<control.busSize)!=inputs.size))"default" else i) + ": " + name + " <= " + inputs(i).name + ";"))
    nl.addComb("  endcase")
  }
}

object Mux{
  def apply[T](control: Sig[Int], inputs: Vector[Sig[T]]): Sig[T] = inputs match {
    case _ if (inputs.toSet.size==1) => inputs(0)
    /*case Vector(Register(Mux(ctr1,ins1),false),Register(Mux(ctr2,ins2),false)) if ctr1==ctr2 && ins1.size==2 && ins2.size==2 =>{
      Mux(control::ctr1,ins1++ins2)
    }*/
    case _ => {
      //val tmp:Vector[Signal[Any]]=(control+:[Signal[Any,Vector[Any]]inputs)
      val controlS+:inputsS = (control+:inputs).synch
      new Mux(controlS.asInstanceOf[Sig[Int]], inputsS.asInstanceOf[Vector[Sig[T]]]).register
    }
  }

}