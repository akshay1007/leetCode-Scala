package example
import scala.collection.mutable._

object Hello extends Greeting with App {
  println(greeting)
  def abs(x: Double) = if (x >= 0) x else -x
  println(abs(10))

  def fac(n : Int) = {
    var r = 1
    for (i <- 1 to n) r = r * i
    r
  }

  def fac2(n: Int): Int =
    {
      if (n <= 0) 1
      else n * fac(n - 1)
    }


  val s = new ArrayBuffer[Int]()
  s += 10
  println(s)
  s += (11,12,13)
  println(s)
  s ++= Array(14,15,16)
  println(s)
  s(0) = 40
  println(s(1))
  println(s)

s.toArray

  for(i<-0 until s.length) println(i + ": " +(s(i)))
  //To visit every second element, let i traverse
println("================")
  for(i<-0 until (s.length,3))println(i + ": " +(s(i)))
  println("================1")

  for(elm <- s) println(elm)
  println("================2")

  val a = Array(2, 3, 5, 7, 11,12)

  var result = for(elm <- a) yield 2 * elm
   for(ele <- result) println(ele)

  println("================3")
  var result2 = for (elem <- a if elem % 2 == 0) yield 2 * elem
  for(ele <- result2) println(ele)

  println("================4")

  val result3 = a.filter(_ %2 == 0).map(2 * _)
  for(ele <- result3) println(ele)
  println("================5")
  for(i<- (0 until s.length).reverse if i< 2) {
    println("Reverse : " + i + " :  " + s(i))
  }
}




trait Greeting {
  lazy val greeting: String = "hello"
}
