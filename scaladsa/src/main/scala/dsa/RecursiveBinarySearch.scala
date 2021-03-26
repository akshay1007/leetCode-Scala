package dsa

object RecursiveBinarySearch extends App {

  def recursiveBinarySearch(arr:Array[Int],
                            Element_to_Search:Int)
                            (low:Int =0,
                            high:Int = arr.length-1):Int={

    // If element not found
    if(low>high) return -1

    // Getting the middle element
      var middle = (low + (high - low)/2)
    // If element found
    if(arr(middle)== Element_to_Search) {
      return middle
    }

    // Searching in the left half
    else if(arr(middle)> Element_to_Search) {

      return recursiveBinarySearch(arr, Element_to_Search)(low , middle-1)
    }
    // Searching in the right half
    else
    return recursiveBinarySearch(arr, Element_to_Search)(middle + 1, high)
    }

  // storing its result in index variable
  var index = recursiveBinarySearch(Array(1, 2, 3, 4, 55, 65, 75), 4)(0, 6);

  // If value not found
  if(index == -1)  print("Not Found")

  // Else print the index where
  // the value is found
  else
  print("Element found at Index " + index)



}
