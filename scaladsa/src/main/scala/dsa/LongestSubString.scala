package dsa
import scala.collection.mutable
/*
 How do you find the length of the longest substring without repeating characters?
 Scala program to find and print longest substring without repeating characters.
 Function to find and print longest substring without repeating characters.
*/

object LongestSubString extends App{

  def longestSubstring(s:String):Int= {
    //starting point of current substring.
    var start = 0
    // maximum length substring without  repeating characters.
    var length = 0

    if(s.isEmpty) 0
    else {
      //Hash Map to store last occurrence of each already visited character.
      var lookup = mutable.HashMap[Char,Int]()

      for((c,i) <- s.zipWithIndex) {
        if (!(lookup contains c)) {
          lookup(c) = i
        }
        else {
          var newLength = i - start
          if (newLength > length) length = newLength
          start = lookup(c) + 1
          lookup.retain((c, i) => i >= start)
          lookup(c) = i
        }
      }

      Math.max(length, (s.length - start))
    }
  }

  println(longestSubstring("ababacd"))
}
