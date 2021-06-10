
 // Definition for a binary tree node.
  class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
   var value: Int = _value
    var left: TreeNode = _left
    var right: TreeNode = _right
  }

object BinaryTree extends App {

  def maxDepth(root: TreeNode): Int = {

    if(root == null) return 0
    else {
      var lDepth = maxDepth(root.left)
      var rDepth = maxDepth(root.right)
      if(lDepth>rDepth){
        return (lDepth + 1);
      }
      else {
        return (rDepth + 1);
      }
    }

  }

  def printLevelOrder(root: TreeNode): Unit ={
    var h = maxDepth(root)
    for (i<-1 until h){
      printCurrentLevel(root, i);
    }
  }

  def printCurrentLevel(root: TreeNode, level:Int): Unit ={
    if (root == null)
      return null ;
    if (level == 1)
      println("Level order "+root.value + " ");
    else if (level > 1)
    {
      printCurrentLevel(root.left, level-1);
      printCurrentLevel(root.right, level-1);
    }

  }



//3,9,20,null,null,15,7
  var tree = new TreeNode(3)
  tree.left = new TreeNode(9)
  tree.right = new TreeNode(20)
  tree.left.right = new TreeNode(21)
  tree.left.left = new TreeNode(22)
  tree.right.left = new TreeNode(15)
  tree.right.right = new TreeNode(7)


  println("Height of tree is : " + maxDepth(tree))

  println("Level order traversal of binary tree is " +printLevelOrder(tree));


}