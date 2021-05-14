package help

object options extends App {

  //Option will provide None
  val lst = List(1,2,3,4,5)
  val myMap = Map(1->"Tom", 2->"Dick")

  println(lst.find(_ > 3))

  //To get the value out of Some use
  println(lst.find(_ > 3).get)

  // When we use get method for map it will also returns some
  println(myMap.get(2))

  // If key is not present it will through error to avoid we can use getOrElse() method
  // Pass the else value inside the bracket

  println(myMap.get(5).getOrElse("Value not found "))


}
