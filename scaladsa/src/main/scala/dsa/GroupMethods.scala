package dsa

object GroupMethods extends App {

  val input = Array(1, 2, 2, 6, 6, 6, 6, 7, 10)
  val res = input.grouped(3)
  while (res.hasNext) {
    println(res.next().toList)
  }

  val accounts = Array(Array(2,8,7),Array(7,1,3),Array(1,9,5))
  accounts.map(account => account.reduce((a,b) => a + b)).max

}

