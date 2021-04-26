package dsa

object GoalParserInterpretation extends App {

  def interpret(command:String): String ={
    var i = 0
    var sb = new StringBuilder()
    for(c <- command){
        if (c == 'G'){
          sb += c
        }
        else if (c == '('){
          if(command.charAt(i +1) == ')') {
            sb ++= "o"
          }
            else sb++="al"
          }
          i +=1
    }
        sb.toString()
  }

  val s = "G()()()()(al)"
  println(interpret(s))
}
