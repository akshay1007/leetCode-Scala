package dsa


object PermutationOfWord extends App {

  def permutation(word:String): Unit ={
    permutationOfString("",word)

  }

  def permutationOfString(perm:String,word:String): Unit ={
    if(word.isEmpty) {
      println("your permutations are : " + perm +word)
    }
    else {
      for(i<-0 to word.length-1){

        permutationOfString(perm + word.charAt(i), word.substring(0, i) + word.substring(i + 1, word.length()))

      }
    }
  }
  permutation("123")

}
