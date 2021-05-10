package help

object match_expression extends App {

  // match as an expression
  val age = 20

    age match {
      case 10 => println(age)
      case 20 => println(age)
      case 30 => println(age)
      case 40 => println(age)
      case _ => println("Default")

    }

  // match as an extractor

  val result =  age match {
    case 10 => age;
    case 20 => age;
    case 30 => age;
    case 40 => age;
    case _ => "default"

  }
  println("Result : " + result)

  // multi match

  val even_odd =  age%2 match {
    case 1|3|5|7|9  => "odd";
    case _ => "even"

  }
  println("The number is  : " + even_odd)

}
