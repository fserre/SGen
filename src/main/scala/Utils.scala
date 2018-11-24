package object Utils {
  def ceilDiv(lhs:Int,rhs:Int)=lhs/rhs+(if(lhs%rhs==0) 0 else 1)
}
