package sorting

/*
Worst and Average Case Time Complexity: O(n*n). Worst case occurs when array is reverse sorted.
Best Case Time Complexity: O(n). Best case occurs when array is already sorted.
Auxiliary Space: O(1)
Boundary Cases: Bubble sort takes minimum time (Order of n) when elements are already sorted.
Sorting In Place: Yes
Stable: Yes
 */
object BubbleSort extends App {

  var arr = Array(64, 34, 25, 12, 22, 11, 90)
  var n = arr.length

  for(i<-0 until arr.length; j<-0 until (arr.length)-i-1){
    if(arr(j)>arr(j+1)){
      var temp = arr(j)
      arr(j) = arr(j+1)
      arr(j+1) = temp
    }

  }

  for(ele <- arr)
    println(ele)


}
