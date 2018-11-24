package RTL

import RTL.Sig._

/**
  * Created by Bastos on 03.12.2017.
  */
class ROM private(val values: Vector[BigInt], val addr: Sig[Int], val size: Int, val block: Boolean) extends Sig()(Unsigned(size)) {
  override val availableAt = addr.availableAt

  override def declaration(implicit nl: Netlist) = Some("reg " + (if (size != 1) "[" + (size - 1) + ":0] " else "") + name + ";")

  override def implement(implicit nl: Netlist) = {
    nl.addComb("always @(*)")
    nl.addComb("  case(" + addr.name + ")")
    (0 until values.size).foreach(i => nl.addComb(if (i == (values.size - 1) && BigInt(values.size).bitCount != 1)
      "    default:" + name + " <= "+size+"'d"+ values(i) + ";"
    else
      "    " + i + ":" + name + " <= " + size+"'d"+values(i) + ";"))
    nl.addComb("  endcase")
  }

  override def equals(obj: scala.Any): Boolean = obj match{
    case obj:ROM => obj.values==values && obj.addr==addr && obj.size==size && obj.block==block
    case _ => false
  }

  override def hashCode(): Int = values.hashCode()
}
object ROM {
  def FxPROM(values: Vector[Double], addr: Sig[Int], twiddleSize:Int, block: Boolean = false): Sig[Double]={
    val digits = math.max(math.min(twiddleSize - 1, twiddleSize - 2 - math.floor(math.log(values.map(_.abs).max) / math.log(2)).toInt), 0)
    val twiddleType=FxP(twiddleSize-digits,digits)
    apply(values,addr,block)(twiddleType)
  }
  private def apply(values: Vector[BigInt], addr: Sig[Int], size:Int, block: Boolean): Sig[Int] = {
    assert(addr.dt.isInstanceOf[Unsigned])
    assert((1<<addr.busSize)>=values.size)
    implicit val rType=Unsigned(size)
    addr match {
      case _ if (values.toSet.size == 1) => Const(values(0))
      case Const(value) => Const(values(value))
      case _ => {
        (0 until addr.busSize).find(pos => (0 until values.size).forall(i => {
          val j = i | (1 << pos)
          j >= values.size || values(i) == values(i | (1 << pos))
        })) match {
          case Some(pos) => {
            val control = if (pos == 0)
              addr(1 until addr.busSize)
            else if (pos == addr.busSize - 1)
              addr(0 until addr.busSize - 1)
            else
              addr(pos + 1 until addr.busSize) :: addr(0 until pos)
            ROM((0 until values.size).filter(i => (i & (1 << pos)) == 0).map(values(_)).toVector, control, size, block)
          }



          /*case _ if 2*values.distinct.size<values.size && 2*BigInt(values.distinct.size).bitLength<_busSize =>{
            val vals=values.distinct
            ROM(ROM(address,values.map(v=>BigInt(vals.indexOf(v))),BigInt(vals.size).bitLength,false),vals,_busSize,signed)
          }*/

          case _ => if (size==addr.dt.size && values.zipWithIndex.forall(i => i._1 == i._2))
            addr
          else
            new ROM(values, addr, size, block).delay(if(addr.busSize>7)2 else 1)
        }
      }
    }
  }
  def apply[T:HW](values: Vector[T], addr: Sig[Int], block: Boolean = false): Sig[T] = {
    Cast[T](ROM(values.map(implicitly[HW[T]].TtoBigInt),addr,implicitly[HW[T]].size,block))
  }

  def unapply[T](arg: Sig[T]): Option[(Vector[T], Sig[Int], Boolean)] = arg match {
    case Cast(Register(Register(x:ROM))) =>Some((x.values.map(v=>arg.dt.BigInttoT(v)),x.addr,x.block))
    case Cast(Register(x:ROM)) =>Some((x.values.map(v=>arg.dt.BigInttoT(v)),x.addr,x.block))
    case Register(Register(x:ROM)) =>Some((x.values.map(v=>arg.dt.BigInttoT(v)),x.addr,x.block))
    case Register(x:ROM) =>Some((x.values.map(v=>arg.dt.BigInttoT(v)),x.addr,x.block))
    case x:ROM => Some((x.values.map(v=>arg.dt.BigInttoT(v)),x.addr,x.block))
    case _  => None
  }
}