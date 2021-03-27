package dsa

import scala.collection.mutable.HashSet

object FindPair extends App {

  def printPairsUsingSet(arr:Array[Int], target:Int): Unit ={

    if(arr.length<2 ){
      println(" Array is too small to perform ")
      return
    }
      val set = new HashSet[Int]()
      for(elem <- arr){
        var res = target-elem
        // if target number is not in set then add
        if(!(set contains(res))){
          set.add(elem)
        }
        else {
          println("Your pair is : "+ res + " , " + elem)
        }

      }

  }

  val arr = Array(0, 14, 0, 4, 7, 8, 3, 5, 7)
  val sum = 11
  printPairsUsingSet(arr, sum)



}
