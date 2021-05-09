package example

object testJupyter extends App {

  def result(i:Int, j:Int):(Int,Int)={
    print(i ,j)
      if(i > j) {
        (i,j)
      } else {
        (j,i)
      }


  }

  def min_max(arr:Array[Int]):(Int, Int)={
      var j =1
      var i = 0
    var min = 1
    var max = 0
    for(k<-0 until arr.length){

      if(j < arr.length) {
        var res = result(arr(i), arr(j))
        if (res._1 < min) {
          min = res._1
        }
        if (res._2 > min) {
          max = res._2
        }
        j = j + 2
        i = i + 2
      }

    }
    (min,max)
  }


  val input = Array(2,3,6,88,7,8,9,1,44)
  println ("Result : " + min_max(input))

}
