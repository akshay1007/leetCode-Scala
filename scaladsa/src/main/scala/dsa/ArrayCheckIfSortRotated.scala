package dsa

object ArrayCheckIfSortRotated  extends App {


  def minElement(arr:Array[Int]):(Int, Int) = {
    var low = 0
    var high = arr.length-1
    while (low < high) {
      var mid = (low+high)/2
      if(arr(mid) == arr(high))
        high = high-1
      else if (arr(mid)> arr(high))
          low = mid+1
      else
        high = mid

      }
    return (high, arr(high))

  }

  def checkIfSortRotated(arr:Array[Int], n:Int):Boolean = {
    var minData = minElement(arr)
    println("Index : " + minData._1 + "     Min Element : "+ minData._2)

    // Check if all elements before minIndex are in increasing order
    var flag1 = true
    for(i<-1 until minData._1 ){
      if(arr(i)< arr(i-1)) {
        flag1 = false
        return flag1
      }
    }
    // Check if all elements after minIndex are in increasing order
    var flag2 = true
    for(i<- minData._1 +1 until arr.length){
      if(arr(i)< arr(i-1)) {
        flag2 = false
        return flag2

      }
    }

    // check if the minIndex is 0, i.e the first element
    // is the smallest , which is the case when array is
    // sorted but not rotated.

    if (minData._1 == 0) {
      println("NO");
      return false;
    }
    if (flag1 && flag2 && (arr(n - 1) < arr(0)))
      {
        System.out.println("YES")
        return true
      };
    else {
      System.out.print("NO")
      return  false
    };


  }




  var arr = Array(3,4,6,1,2,5)
  var len = arr.length

  println("Is Sorted and Rotated : " +checkIfSortRotated(arr,len))
}
