import scala.annotation.tailrec

@main
def main=
  given FixedPoint(1,1)
  val i = Input("test")(TimedDataset(3,0))
  println(i)
  def f[T,V](x:Sig[T]):Seq[Sig[V]]=x match
    case x:Expandable[T] => x.asInstanceOf[Expandable[T]{type U = V}].expand(f)

  @tailrec
  def getImplementable[T](x: Seq[Sig[T]]):Seq[Implementable[BigInt]] =
    val res=x.flatMap(f)
    if(res.map(_.hw.abstractionLevel).max>0)
      getImplementable(res)
    else
      x.map(_ match
        case x:Implementable[BigInt@unchecked] => x
        case _ => throw Exception("Internal error..."))

  def g(x:Sig[BigInt]):rtl.Component=x match
    case x:Implementable[BigInt] => x.implement(g)

  val res=getImplementable(Seq(i))
  println(res.map(g))

