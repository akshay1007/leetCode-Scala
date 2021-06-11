package dsa

object SearchElementBinarySearch extends  App {


  def search(arr:Array[Int], l:Int, h:Int, key:Int):Int={
	if (l > h)
		return -1;

	var mid = (l + h) / 2;
	if (arr(mid) == key)
		return mid;

	if (arr(l) <= arr(mid)) {
		if (key >= arr(l) && key <= arr(mid))
			return search(arr, l, mid - 1, key);

		return search(arr, mid + 1, h, key);
	}

	if (key >= arr(mid) && key <= arr(h))
		return search(arr, mid + 1, h, key);

	return search(arr, l, mid - 1, key);
}


  var arr = Array(4, 5, 6, 7, 8, 9, 1, 2, 3 )

  var res = search(arr,0,arr.length-1, 1)
  println("Element found at Index :  " + res)
}
