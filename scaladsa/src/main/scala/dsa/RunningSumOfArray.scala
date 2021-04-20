package dsa

object RunningSumOfArray extends App {


  def runningSum(nums: Array[Int]): Array[Int] = {
            var previous_val = 0
            var output:Array[Int] = new Array[Int](nums.length)
            for(i<-0 until(nums.length)){
           previous_val = previous_val+nums(i)
              output(i)= previous_val
            }
            output
  }



  val Input:Array[Int] = Array(3,1,2,10,1)
  val output = runningSum(Input)
  output.foreach(x => print(x + " "))


}





