package dsa

object ArrayRotationBy extends App {


  def rotationBy1Line(arr:Array[Int], k :Int)={

      var kmod = k%arr.length
      var res = arr.reverse.take(kmod).reverse ++ arr.take(arr.length-kmod)
      res.foreach(x => print(x))
      res


  }

  def rotationBy(arr:Array[Int], k :Int)={

    def swap(nums: Array[Int], i: Int, j: Int) = {
      val temp = nums(i)
      nums(i) = nums(j)
      nums(j) = temp
      nums
    }

    for(_ <- 0 until k) {
      for (i <- 1 until arr.length) {
        swap(arr, 0, i)
      }

    }
    arr

  }

  def singleLoop(arr:Array[Int], k :Int): Array[Int]={
    var ouptput = new Array[Int](arr.length)
    for(i<-0 until arr.length){
      ouptput((i+k)%arr.length) = arr(i)
    }
    ouptput

  }
  var input = Array(1,2,3,4,5,6,7)
  val k = 3
  rotationBy(input,k).foreach(x => print(x))
  println("============")
  singleLoop(input,k).foreach(x => print(x))



}
