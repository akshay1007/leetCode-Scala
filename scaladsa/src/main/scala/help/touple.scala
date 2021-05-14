package help

object touple extends App {

  // Tuple is a class in scala which can contains non heterogeneous elements
  // Tuple are immutable in nature
  // Tuple can contains 22 max elements

  val mytouple = new Tuple3(1,2,"hello")
  println(mytouple)

  val mytouple2 = new Tuple4(1,2,(3,4,5,6),"Hello")
  println(mytouple2)

  //to print the 3 touple 2nd element

  println(mytouple2._3._2)

  //To iterate the touple use productIterator

  mytouple2.productIterator.foreach(
    i => println(i)
  )






}
