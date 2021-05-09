package dsa

object ReplaceVowelAndConsonents extends App  {

  def isVowel(c:Char):Boolean={
    val vowels = Array('a','e','i','o','u')
    if (vowels.contains(c)){

      return true
    }
    else return false
  }
  def replaceVowel(s:String):String={
    var output:String =  s.replaceAll("a|e|i|o|u|A|E|I|O|U","")
    output
  }

  def replaceConsonent(s:String):String={
    var str =""

    s.toCharArray.map(x => {
      if (isVowel(x) == true) {
        str += x
      }
    })
    str
  }
  val input = "aheloweioene"
  println(replaceVowel(input))
  println(replaceConsonent(input))

}
