package dsa

object RemoveDupliocateFromArrayInPlace extends App {

  def removeDuplicate(nums:Array[Int]):Int = {

    var i:Int =0
    for(j <-0 until nums.length){
      if(nums(j) != nums(i)){
        i = i +1
        nums(i) = nums(j)
      }

    }
    return i +1

  }

  val nums = Array(0,0,1,1,1,2,2,3,3,4)
  println(removeDuplicate(nums))

}
