package dsa
import scala.collection.mutable

object FirstNonRepeating extends App {

  def firstNonRepeating(s:String):Unit = {
    val lookupTable = s.foldLeft(mutable.HashMap[Char, Int]())((m, c) => m ++ mutable.HashMap(c -> (if (m contains c) m(c) + 1 else 1)))
    for (i <- 0 until s.length) {
      if (lookupTable(s.charAt(i)) == 1) {
        println("First non repeating character is : " + s.charAt(i))
        return
      }


    }
  }

  firstNonRepeating("geeksforgeeks")

}
