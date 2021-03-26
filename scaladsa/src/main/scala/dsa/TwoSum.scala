package dsa
import scala.collection.mutable

object TwoSum extends App {


  def twoSum(arr:Array[Int],target:Int):Array[Int]={

    var lookup = mutable.HashMap[Int,Int]()

    for(i<-0 until arr.length){
      var rem = target - arr(i)

      if(lookup contains rem){
        println("Index position of combination is : "+ (lookup(rem), i))
        return(Array(lookup(rem),i))
      }
      else
        lookup(arr(i)) = i
    }
    Array(-1,-1)
  }

  val result = twoSum(Array(2,7,11,15), 18)
  println("Array index's are : ")
  result.foreach(println)

}
