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
             elsif data > current_node.data && current_node.right == NullNode::DEFAULT
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


   def include?(data)
     current_node = @root_node
     while current_node != NullNode::DEFAULT
        if data == current_node.data
          return true
        elsif data < current_node.data && data != current_node.data
          current_node = current_node.left
        elsif data > current_node.data && data != current_node.data
          current_node = current_node.right
        end
          if current_node == NullNode::DEFAULT
            return false
        end
      end
   end

   def depth_of(data)
     current_node = @root_node
     depth = 0
     while current_node != NullNode::DEFAULT
        if data == current_node.data
          return depth
        elsif data < current_node.data && data != current_node.data
          current_node = current_node.left
          depth += 1
        elsif data > current_node.data && data != current_node.data
          current_node = current_node.right
          depth += 1
        end
          if current_node == NullNode::DEFAULT
            return depth
        end
      end
   end

   def maximum
     return "The tree is empty" if @root_node.nil?
     current_node = @root_node
     while current_node != NullNode::DEFAULT
       current_node = current_node.right
       if current_node.right == NullNode::DEFAULT
         return current_node.data
       end
     end
   end

   def minimum
     return "The tree is empty" if @root_node.nil?
     current_node = @root_node
     while current_node != NullNode::DEFAULT
       current_node = current_node.left
       if current_node.left == NullNode::DEFAULT
         return current_node.data
       end
     end
   end

end
bst = BinarySearchTree.new


bst.maximum
