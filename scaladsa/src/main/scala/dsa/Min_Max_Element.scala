/*
 //Time Complexity:O(n)
*/



package dsa

object Min_Max_Element  extends  App{

  def min_element(arr:Array[Int],n:Int):Int={
    var res = arr(0)
    for(i<-0 until arr.length){
      res = res.min(arr(i))
    }
    res
  }

  def max_element(arr:Array[Int],n:Int):Int={
    var res = arr(0)
    for(i<-0 until arr.length){
      res = res.max(arr(i))
    }
    res
  }


  // Recursive Solution

  def recursive_min_element(arr:Array[Int],i:Int, n:Int):Int={

    if(n==1){
      return arr(i)
    }
    arr(i).min(recursive_min_element(arr,i+1,n-1))

  }

  def recursive_max_element(arr:Array[Int],i:Int, n:Int):Int={

    if(n==1){
      return arr(i)
    }
    arr(i).max(recursive_max_element(arr,i+1,n-1))

  }

  var arr = Array(12, 1234, 45, 67, 1)
  var n = arr.length

  println("Min element : "+ min_element(arr,n))
  println("max element : "+ max_element(arr,n))

  println("Recursive  element Min : "+ recursive_min_element(arr,0,n))
  println("Recursive  element Max : "+ recursive_max_element(arr,0,n))


  println("Find the minimum element in a sorted and rotated array")

  //Find the minimum element in a sorted and rotated array
  // Time Complexity O(Logn)
def findMin(arr:Array[Int],low:Int,high:Int ):Int={
   var res = arr(0)
  // This condition is needed to handle the case when array is not rotated at all
  if(high<low)
    {
       res = arr(0)
      return res
    }
  res
  // If there is only one element left
  if (high == low)
    {
      res = arr(low);
      return res
    }



  // Find mid
  val mid = low + (high - low)/2; /*(low + high)/2;*/

  if(mid< high && arr(mid+1)< arr(mid))
  {
      res = arr(mid+1)
      return res
    }




  // Check if mid itself is minimum element

  if(mid > low && arr(mid)< arr(mid-1)){
   res =  arr(mid)
    return res
  }

  // Decide whether we need to go to left half or right half

  if (arr(high) > arr(mid)) {
    return findMin(arr, low, mid - 1);
  }
  else
    return findMin(arr, mid+1, high);


}

  var arr1 =  Array(5, 6, 1, 2, 3, 4)
  var n1 = arr1.length;
  println(n1, arr1(n1-1))
  System.out.println("The minimum element is "+ findMin(arr1, 0, n1-1));

  var arr2 =  Array( 1, 2, 3, 4)
  var n2 = arr2.length;
  System.out.println("The minimum element is "+ findMin(arr2, 0, n2-1));

  var arr3 =  Array( 1)
  var n3 = arr3.length;
  System.out.println("The minimum element is "+ findMin(arr3, 0, n3-1));

  var arr4 =  Array(1, 2);
  var n4 = arr4.length;
  System.out.println("The minimum element is "+ findMin(arr4, 0, n4-1));

  var arr5 =  Array(2, 1);
  var n5 = arr5.length;
  System.out.println("The minimum element is "+ findMin(arr5, 0, n5-1));

  var arr6 =  Array(5, 6, 7, 1, 2, 3, 4);
  var n6 = arr6.length;
  System.out.println("The minimum element is "+ findMin(arr6, 0, n6-1));

  var arr7 =  Array(1, 2, 3, 4, 5, 6, 7);
  var n7 = arr7.length;
  System.out.println("The minimum element is "+ findMin(arr7, 0, n7-1));

  var arr8 =  Array(2, 3, 4, 5, 6, 7, 8, 1);
  var n8 = arr8.length;
  System.out.println("The minimum element is "+ findMin(arr8, 0, n8-1));

  var arr9 =  Array(3, 4, 5, 1, 2);
  var n9 = arr9.length;
  System.out.println("The minimum element is "+ findMin(arr9, 0, n9-1));



    /*
    How to handle duplicates?
    The above approach in the worst case(If all the elements are the same) takes O(N).
    Below is the code to handle duplicates in O(log n) time.
     */

  def findMidDup(arr:Array[Int], l:Int, h:Int):Int ={
    var high = h
    var low = l
    while (low<high){
      var mid = low + (high-low)/2
      if(arr(mid) == arr(high)) {
        high = high - 1;
      }
      else if (arr(mid)> arr(high)) {
          low = mid +1
        }
      else {
        high = mid
      }
      }

    return arr (high);
  }

  println ("The above approach in the worst case(If all the elements are the same) takes O(N).  Below is the code to handle duplicates in O(log n) time.")

  var arr11 = Array( 5, 6, 1, 2, 3, 4 );
    var n11 = arr11.length;
    System.out.println("The minimum element is " +
      findMidDup(arr11, 0, n11 - 1));

    var arr21 = Array(1, 2, 3, 4 );
      var n21 = arr21.length;
      System.out.println("The minimum element is " +
        findMidDup(arr21, 0, n21 - 1));

      var arr31 = Array(1);
      var n31 = arr31.length;
      System.out.println("The minimum element is " +
        findMidDup(arr31, 0, n31 - 1));

      var arr41 = Array( 1, 2 );
      var n41 = arr41.length;
      System.out.println("The minimum element is " +
        findMidDup(arr41, 0, n41 - 1));

      var arr51 = Array( 2, 1 );
      var n51 = arr51.length;
      System.out.println("The minimum element is " +
        findMidDup(arr51, 0, n51 - 1));

      var arr61 = Array( 5, 6, 7, 1, 2, 3, 4 );
      var n61 = arr61.length;
      System.out.println("The minimum element is " +
        findMidDup(arr61, 0, n61 - 1));

      var arr71 = Array( 1, 2, 3, 4, 5, 6, 7 );
      var n71 = arr71.length;
      System.out.println("The minimum element is " +
        findMidDup(arr71, 0, n71 - 1));

      var arr81 = Array( 2, 3, 4, 5, 6, 7, 8, 1 );
      var n81 = arr81.length;
      System.out.println("The minimum element is " +
        findMidDup(arr81, 0, n81 - 1));

      var arr91 = Array( 3, 4, 5, 1, 2 );
      var n91 = arr91.length;
      System.out.println("The minimum element is " +
        findMidDup(arr91, 0, n91 - 1));

      def findMax(arr:Array[Int], low:Int, high:Int):Int ={

        // if only one element
        if(low==high) return arr(low)

        //find mid
        var mid = low + (high -low )/2

        //if mid is == 0 and mid+1 is greater element
        if (mid == 0 && arr(mid)>arr(mid+1)){
          return arr(mid)
        }

        // Decide whether we need to go to
        // the left half or the right half
        if(arr(low) > arr(mid) ){
          return findMax(arr, low , mid-1)
        }
        else {
          return findMax(arr, mid+1, high)
        }

      }
    println("Finding max element in an array using binary search ")
  var  arr_max = Array(6,5,4,3,2,1 )
  var n_max = arr_max.length;
  System.out.println("The Maximum element is : " +findMax(arr_max, 0, n_max - 1));

}
