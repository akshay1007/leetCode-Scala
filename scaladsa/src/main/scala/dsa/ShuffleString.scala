package dsa

object ShuffleString extends App {

  def restoreString(s: String, indices: Array[Int]): String = {
    val arr = s.toArray
    val res = new Array[Char](arr.length)
    for(i<-0 until arr.length){
      var position = indices(i) //4
      var char = arr(i) //c
      res(position) = char
    }
    res.mkString("")
  }

  //Example 1:
  val s:String = "codeleet"
  val indices = Array(4,5,6,7,0,2,1,3)
  println(restoreString(s,indices))
  //Output: "leetcode"
  //Explanation: As shown, "codeleet" becomes "leetcode" after shuffling.

  //Example 2:

  val s2 :String= "abc"
  val indices2 = Array(0,1,2)
  println(restoreString(s2,indices2))
  //Output: "abc"
  //Explanation: After shuffling, each character remains in its position.

  //Example 3:

  val s3 :String = "aiohn"
  val indices3 = Array(3,1,4,2,0)
  println(restoreString(s3,indices3))
  //Output: "nihao"

}
