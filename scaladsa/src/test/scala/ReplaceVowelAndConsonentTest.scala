import org.scalatest.FunSuite
import  dsa.ReplaceVowelAndConsonents

class ReplaceVowelAndConsonentTest extends FunSuite{

  var k = 3
  var input = "abcdefgh"
  val result = ReplaceVowelAndConsonents.replaceVowel(input)
  val expected = "bcdfgh"

  val consonants_result = ReplaceVowelAndConsonents.replaceConsonent(input)
  val expected_result = "ae"
  test("Replace vowel ")
  {
    assert(result === expected)
  }
  test("Replace consonants ")
  {
    assert(consonants_result === expected_result)
  }
}
