package dsa

object MaximumWealthInGrid_mXn  extends App {

  def maximumWealth(accounts:Array[Array[Int]]):Int={

    accounts.map(row => row.reduce((a,b)=> a+b)).max

  }

  val accounts1 = Array(Array(2,8,7),Array(7,1,3),Array(1,9,5))
  val accounts2 = Array(Array(1,5),Array(7,3),Array(3,5))
  val accounts3 = Array(Array(1,2,3),Array(3,2,1))

  println(maximumWealth(accounts1))
  println(maximumWealth(accounts2))
  println(maximumWealth(accounts3))


}
