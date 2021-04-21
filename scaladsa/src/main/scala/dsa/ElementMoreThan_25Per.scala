package dsa

object ElementMoreThan_25Per  extends App {

  def frequencyOfElement(arr:Array[Int]):Map[Int,Int]={
    arr.groupBy(e=> e).map(x=> (x._1,x._2.length))
  }

  def elementMoreThan_25Per(arr:Array[Int]): Int ={

    val freqMap = frequencyOfElement(arr)
    val uniqueElement = arr.distinct
    val totalLen = arr.length
    var output = 0;
    for(i<-0 until(uniqueElement.length)){
      var result:Float = percentage(freqMap.get(uniqueElement(i)).get, totalLen)
      if(result>25.0){
        output= uniqueElement(i)
      }
    }
    output
  }

  def percentage(value:Int, totalElement:Float):Float = {
    (value/totalElement)*100

  }
  val input = Array(1,2,2,6,6,6,6,7,10)
  println(elementMoreThan_25Per(input))
}
