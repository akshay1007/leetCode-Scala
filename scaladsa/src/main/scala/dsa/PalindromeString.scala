package dsa

object PalindromeString extends App {

  def palindrome(s1:String):Boolean ={

    val reverseString = s1.foldLeft(List[Char]())((a,b) => b::a).mkString("")
    println("reverseString " + reverseString)
    if(reverseString==s1) return true
    false
  }
println("Given String is Palindrome " + palindrome("abba"))
}
