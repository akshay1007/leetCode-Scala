package dsa

object RemoveDupliocateFromArrayInPlace extends App {

  def removeDuplicate(nums:Array[Int],length:Int):Int = {
    if(length==0 || length ==1){
      return length
    }

    var j:Int =0 // for next element
    for(i <-0 until nums.length-1){
      if(nums(i) != nums(i+1)){
        nums(j) = nums(i)
        j = j +1
      }

    }

    nums(j) = nums(nums.length-1)
    j +=1;
    return j

  }

  var nums = Array(0,0,1,1,1,2,2,3,3,4)
  var length = nums.length
val len = removeDuplicate(nums, length)
  for(i<-0 until len){
    print (" "+nums(i))
  }

}
