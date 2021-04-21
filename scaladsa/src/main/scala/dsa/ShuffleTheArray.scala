package dsa

object ShuffleTheArray extends App {

  def shuffle(arr:Array[Int], n:Int): Array[Int] ={
    val (x,y) = arr.splitAt(n)
    (x zip y).flatMap(value => List(value._1,value._2))
    }




  val input = Array(2, 5, 1, 3, 4, 7)
  val n = 3
  print(shuffle(input,n).toList)


}
