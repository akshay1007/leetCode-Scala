package dsa

object SubtractProductAndSum extends  App{

  def subtractProductAndSum(t: Int): Int = {
    var n = t
    var product = 1
    var sum = 0
    while(n>0){
      product = product * (n%10)
      sum = sum + (n%10)
      n= n/10
    }
    product-sum

  }
//Given an integer number n, return the difference between the product of its digits and the sum of its digits.
val t = 234
  subtractProductAndSum(t)
}
