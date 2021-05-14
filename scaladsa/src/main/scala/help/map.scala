package help

object map extends App {

  //Map Creation
  val myMap:Map[Int,String] = Map(801->"Max",802->"Limka",803->"Martin",804->"Sandy")

  //Print map
  println(myMap)

  //Print only keys
  println(myMap.keys)

  //Print only Values
  println(myMap.values)

  //Print value of specific key
  println(myMap(803))

  //looping with map
  myMap.keys.foreach(key => {
    println("Key : "+ key + " -> "+ myMap(key) )
  })

  //print last key from map
 println(myMap.keys.last)

}
