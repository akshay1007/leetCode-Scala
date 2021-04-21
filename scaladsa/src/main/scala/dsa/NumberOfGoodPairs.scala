package dsa

object NumberOfGoodPairs extends App{


  def numIdenticalPairs(arr:Array[Int]):Int={
    var count = 0
    for(i<-1 to arr.length-1; j<-0 to i-1){
      if (arr(i) == arr(j)){
        count = count +1
      }
    }
    count
  }
val input = Array(1,2,3,1,1,3)
  println(numIdenticalPairs(input))
}
