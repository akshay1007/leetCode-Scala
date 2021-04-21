package dsa

/*
A pangram is a sentence where every letter of the English alphabet appears at least once.

Given a string sentence containing only lowercase English letters, return true if sentence is a pangram, or false otherwise.
 */

object Pangram  extends App {

  def checkIfPangram(sentence: String): Boolean = {
    sentence.distinct.length==26

  }

  val sentence1 = "thequickbrownfoxjumpsoverthelazydog"
 val sentence2 = "leetcode"

  println(checkIfPangram(sentence1))
  println(checkIfPangram(sentence2))
}


