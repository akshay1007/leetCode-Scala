package dsa

object RemoveDuplicateCharacters extends  App {

  def removeDuplicates(s:String):String={
    var charArray = s.toCharArray
    var remDup = charArray.distinct
    var uniqueStr = remDup.mkString("")
    uniqueStr
  }

  println(removeDuplicates("aabscs"))
}
