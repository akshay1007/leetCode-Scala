package dsa

object FlipCoin extends App {

  def reverse(i:Int):Int={
    var digit = i
    if(digit==0) {
      digit = 1

    }
    else {
      digit = 0
    }
    digit


  }

  def getReversals(arr:Array[Int],expected:Int) :Int = {
    var digit = expected
    var reversals = 0
    for (i<-0 until arr.length){
      println("====="+ digit)
      if(digit != arr(i)){ //1, i = 1,0
        reversals+=1
      }
      digit = reverse(digit);
    }

    return reversals;
  }
  var arr = Array(1,0,1,1,1,1)

    val a =  getReversals(arr, 1)
     val b =  getReversals(arr, 0)

        println ("Total flips are " + Math.min(a,b))

  }

