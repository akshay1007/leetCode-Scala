package dsa

object CanSum extends App {

  def canSum(target:Int,arr:Array[Int]):Boolean ={

    if(target==0) return true;
    if(target<=0) return  false;

    for(i<-0 to arr.length){
      var reminder = target- arr(i)
      if(canSum(reminder,arr)== true){
        return true
      }
    }
    return false


  }

  println(canSum(18,Array(2,7,11,15)))

}
