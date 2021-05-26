package sorting

/*
Time Complexity: O(n2) as there are two nested loops.
Auxiliary Space: O(1)
*/

object SelectionSort extends App(){


  var arr = Array(1,65,25,12,22,11)
  var n = arr.length

  for(i<-0 until n-1; j<- i+1 until n){
    var min_index = i
    if(arr(j) < arr(min_index) ) {
      min_index = j
    }
    // Swap the found minimum element with the first element
    var temp = arr(i)
    arr(i)= arr(min_index)
    arr(min_index) = temp

  }

  for(ele <- arr)
  println(ele)


}
