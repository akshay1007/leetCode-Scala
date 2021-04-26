package dsa

object ToLowerCase extends  App {

  def toLowerCase(S:String):String ={
    S.map(c => {
      if(c >=65 & c<=90){
        (c +32).asInstanceOf[Char]
      }
      else c
    })
  }


  val s = "helloWorld"
  println(toLowerCase(s))
  val s2 = "Hello"
  println(toLowerCase(s2))
}
