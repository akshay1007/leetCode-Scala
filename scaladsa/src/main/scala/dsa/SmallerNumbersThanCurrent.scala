package dsa

object SmallerNumbersThanCurrent extends App {

  def smallerNumbersThanCurrent(nums: Array[Int]): Array[Int] = {
        nums.map(x => nums.count(y => y<x))
  }

  val nums = Array(8,1,2,2,3)
  println(smallerNumbersThanCurrent(nums).toList)
}

