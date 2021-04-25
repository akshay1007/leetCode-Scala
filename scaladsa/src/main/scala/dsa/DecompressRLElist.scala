package dsa

import scala.collection.mutable.ArrayBuffer
object DecompressRLElist extends  App{

  def decompressRLElist(nums: Array[Int]): Array[Int] = {
    var res = ArrayBuffer[Int]()
    for(i <- 0 until nums.length by 2){
      res ++= ArrayBuffer.fill(nums(i))(nums(i+1))

    }
    res.toArray
  }


  val nums = Array(1,2,3,4,5,6,7,8)
  println(decompressRLElist(nums).toList)
}
