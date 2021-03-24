package dsa
import scala.collection.mutable
object LongestSubString extends App{

  def longestSubstring(s:String):Int= {

    var start = 0
    var length = 0

    if(s.isEmpty) 0
    else {
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

      println( s.substring((s.length-1 - start),length))
      Math.max(length, (s.length - start))
    }
  }

  println(longestSubstring("abcabcbb"))
}
