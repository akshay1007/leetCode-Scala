package help

object forLoop extends   App {

  //Nested for loop
  for (i<- 1 to 9 ; j<- 1 to 3){
    println("Value of i : " + i + " and value of j :" + j)
  }

  //Using list
  val lst = List(1,2,3,4,5,5,6,7,8,9,10)
  for(i<- lst){
    println("List values are :" + i)
  }

  //using filter
  for(i<- lst ; if i <6){
    println("List values are :" + i)
  }

  //using expression

  val result = for{ i<- lst } yield {
    i*i
  }
  println("Square of elements are " + result)

}


