package dsa

object SubtractProductAndSum extends  App{

  def subtractProductAndSum(t: Int): Int = {
    var n = t
    var product = 1
    var sum = 0
    while(n>0){
      product = product * (n%10)
      println("Product : "+ product)
      sum = sum + (n%10)
      println(("Sum : "+ sum))
      n= n/10
    }

    println("=======" + (product-sum) + " "+ product +" " + sum)

    product-sum

  }

val t = 234
  subtractProductAndSum(t)
}
