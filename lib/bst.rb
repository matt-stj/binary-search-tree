require_relative 'null_node'
require_relative 'node'

class BinarySearchTree
public
attr_accessor :root_node

  def initialize(root_node = nil)
    @root_node = root_node
  end

  def insert(data)
       new_node = Node.new(data)
       if @root_node.nil?
         @root_node = new_node
       elsif @root_node != nil
           current_node = @root_node
         while current_node != NullNode::DEFAULT
             if data < current_node.data && current_node.left == NullNode::DEFAULT
                 current_node.left = new_node
             elsif  data > current_node.data && current_node.right == NullNode::DEFAULT
                 current_node.right = new_node
             elsif data < current_node.data
                 current_node = current_node.left
             elsif data > current_node.data
                 current_node = current_node.right
             else
                 return
             end
         end
       end
   end

end
bst = BinarySearchTree.new
bst.insert("d")
bst
bst.insert("b")
bst
bst.insert("a")
bst
