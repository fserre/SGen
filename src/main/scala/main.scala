import RTL._
import StreamingModule.StreamingModule

object main extends App{
object Test extends StreamingModule(1,1){
  val a= Input[Int]("a",InputTL)(Unsigned(2))
  val b= Input[Int]("b",InputTL)(Unsigned(2))
  val c=RollingTimer(4)
  val diff=a-b-c



  val r= Output("out",diff)
  println( new Netlist(Vector(a,b),Vector(r),"bla",2,2).getVerilog)

  }
Test
}
