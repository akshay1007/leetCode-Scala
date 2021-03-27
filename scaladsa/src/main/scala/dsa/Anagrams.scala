package dsa

object Anagrams extends App {

  def isAnagrams(s1:String, s2:String): Boolean ={

    if(s1.sorted == s2.sorted) return  true
    false

  }

  if(isAnagrams("abcd", "dacb")){
    println(" Strings are Anagrams of each other ")
  }
  else  println("Sorry ! strings are not anagram")
}
