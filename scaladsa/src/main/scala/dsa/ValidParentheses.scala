package dsa

/*
In PreOrder traversal, the root is visited first,
 followed by left subtree and the right subtree,
 hence it is also known as NLR (nod-left-right) algorithm as well.

 Steps on PreOrder traversal algorithm
  1. visit the node
  2. visit the left subtree
  3. visit the right subtree

*/
object PreOrderTraversal  extends  App{

}

import scala.collection.immutable.Queue

/**
 *
 *               1
 *             / |  \
 *           /   |   \
 *         /     |    \
 *        2      3     8
 *      /  \    / \   / \
 *     4    5  6   7 9  10
 * Preorder: 1,2,4,5,3,6,7,8,9,10
 * InOrder: 4,2,5,1,6,3,7,9,8,10
 * PostOrder: 4,5,2,6,7,3,9,10,8,1
 *
 **/


case class Tree[T](value: T, children: List[Tree[T]])

val tree = Tree(1,List(
Tree(2,List(Tree(4,Nil), Tree(5,Nil))),
Tree(3,List(Tree(6,Nil), Tree(7,Nil))),
Tree(8,List(Tree(9,Nil), Tree(10,Nil)))
))

def preOrder[T,S](tree: Tree[T], f: T => S): Queue[S] = {
def loop(g: Tree[T], output: Queue[S]): Queue[S] = g match {
case Tree(v,c) =>   c.foldLeft(output.enqueue(f(v))){case (acc,n) => loop(n,acc)}
}
loop(tree,Queue.empty[S])
}

def postOrder[T,S](tree: Tree[T], f: T => S): Queue[S] = {
def loop(g: Tree[T], output: Queue[S]): Queue[S] = g match {
case Tree(v,rest) => rest.foldLeft(output){case (agg,node) => loop(node,agg)}.enqueue(f(v))
}
loop(tree,Queue.empty)
}

def inOrder[T,S](tree: Tree[T], f: T => S): Queue[S] = {
def loop(g: Tree[T], output: Queue[S]): Queue[S] = g match {
case Tree(v,l::ls) => ls.foldLeft(loop(l,output).enqueue(f(v))){case (acc,n) => loop(n,acc)}
case Tree(v,Nil) => output.enqueue(f(v))
}
loop(tree, Queue.empty)
}

val preO = preOrder(tree,identity[Int])
val postO = postOrder(tree,identity[Int])
val inO = inOrder(tree,identity[Int])

println(s"pre-order: $preO")
println(s"post-order: $postO")
println(s"in-order: $inO")
