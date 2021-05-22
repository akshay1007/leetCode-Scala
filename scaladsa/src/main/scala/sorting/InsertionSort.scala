package sorting

/*
Time Complexity: O(n^2)
Auxiliary Space: O(1)
Boundary Cases: Insertion sort takes maximum time to sort if
elements are sorted in reverse order.
And it takes minimum time (Order of n) when elements are already sorted.
 */

object InsertionSort extends App {

  var arr = Array(12, 11, 13, 5, 6)

 for(i<-1 until arr.length){
   var key = arr(i)
   var j = i-1

   while(j>=0 && arr(j)>key){
     arr(j+1) = arr(j)
     j = j-1
   }
   arr(j+1) = key
 }


  for(ele <- arr)
  println(ele)


}
