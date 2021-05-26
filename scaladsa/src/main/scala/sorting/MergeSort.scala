package sorting

object MergeSort extends App {


    def merge(arr: Array[Int], left: Int, mid: Int, right: Int): Unit ={
      println("Left : "+ left + "     " + "Right : " + right + " Mid :  "+ mid)

      //get the length of two sub array
      var n1 = mid-left+1
      var n2 =right-mid

      //Get two temp array
      var leftArray = new Array[Int](n1)
      var rithtArray = new Array[Int](n2)

      //fill the data
      for(i<-0 until n1){
        leftArray(i) = arr(left+i)
      }

      for(j<-0 until n2){
        rithtArray(j)= arr(mid+1+j)
      }

      //sort the elements of two array

      // Merge the temp arrays back into arr[l..r]

      // Initial index of first subarray
      var i = 0;

      // Initial index of second subarray
      var j = 0;

      // Initial index of merged subarray
      var k = left;

      while(i<n1 && j<n2){
        if(leftArray(i)<=rithtArray(j)){
          arr(k)= leftArray(i)
         i+=1
        }
        else{
          arr(k)= rithtArray(j)
          j+=1
        }
        k+=1

      }
      //fill remaining elements
      while(i<n1){
        arr(k) = leftArray(i)
        i+=1
        k += 1
      }
      while(j<n2){
        arr(k) = rithtArray(j)
        j+=1
        k += 1
      }

    }

  def merge2(arr: Array[Int], l: Int, m: Int, r: Int): Unit = {
    var n1 = m - l + 1;
    var n2 = r - m;

    // Create temp arrays
    var L = new Array[Int](n1)
    var R = new Array[Int](n2)

    // Copy data to temp arrays L[] and R[]
    for (i <- 0 until n1) {
      L(i) = arr(l + i)
    }

    for (j <- 0 until n2) {
      R(j) = arr(m + 1 + j);
    }



  // Merge the temp arrays back into arr[l..r]

  // Initial index of first subarray
  var i = 0;

  // Initial index of second subarray
  var j = 0;

  // Initial index of merged subarray
  var k = l;

  while (i < n1 && j < n2) {
    if (L(i) <= R(j)) {
      arr(k) = L(i);
      i += 1
    }
    else {
      arr(k) = R(j);
      j += 1
    }
    k += 1
  }

  // Copy the remaining elements of
  // L[], if there are any
  while (i < n1) {
    arr(k) = L(i);
    i += 1
    k += 1
  }

  // Copy the remaining elements of
  // R[], if there are any
  while (j < n2) {
    arr(k) = R(j);
    j += 1
    k += 1
  }
}



  def sort(arr:Array[Int],left:Int, right:Int): Unit ={

    if(left<right){

      var mid = (left+right)/2
      println(left + "     " + right + " Mid :  "+ mid)
      sort(arr,left,mid)
      sort(arr,mid+1,right)
      println("-----------start-----------------")
      merge(arr, left, mid, right);
      println("------------end----------------")

    }
  }


  var arr = Array(12, 11, 13, 5, 6, 7)
  sort(arr,0,arr.length-1)

  arr.map(x=> println("-----"+x))

}
