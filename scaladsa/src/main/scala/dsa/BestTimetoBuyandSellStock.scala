package dsa

object BestTimetoBuyandSellStock  extends  App {

def maxProfit(prices:Array[Int]):Int ={

  var total_profit = 0

  for(i<- 0 until prices.length){
    if(  (i+1 < prices.length) && (prices(i) < prices(i+1))){
      total_profit = total_profit + (prices(i+1) - prices(i))
    }
  }
  total_profit
}



  val  prices = Array(7,1,5,3,6,4)
  println(maxProfit(prices))
//  Output: 7
//  Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
//  Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
//
}
