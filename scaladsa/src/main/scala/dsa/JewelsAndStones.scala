package dsa

object JewelsAndStones extends  App {

  def numJewelsInStones(jewels:String,stones: String): Int = {
    stones.filter(c => jewels.contains(c)).length

  }

  val jewels = "aA"
  val stones = "aAAbbbb"
  println(numJewelsInStones(jewels,stones))
  val jewels1 = "z"
  val stones1 = "ZZ"

  println(numJewelsInStones(jewels1,stones1))
  }
