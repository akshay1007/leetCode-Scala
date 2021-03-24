package dsa

object CheckRotatation extends App {

  def checkRotatation(s1:String,s2:String):Boolean ={
    if(s1.length != s2.length) return false

     val res = (s1+s1).indexOf(s2)
    if(res > -1 ){
      return  true
    }
    else {return false }



  }

  println(checkRotatation("IndiaVsEngland","EnglandIndiaVs"))
}
