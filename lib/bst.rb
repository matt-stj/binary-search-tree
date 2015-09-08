require_relative 'null_node'
require_relative 'node'

class BinarySearchTree
public
attr_accessor :root_node

  def initialize(root_node = nil)
    @root_node = root_node
  end

  # REFACTOR SEARCHER FOR ALL APPLICABLE METHODS

  def insert(data)
       new_node = Node.new(data)
       if @root_node.nil?
         @root_node = new_node
       elsif @root_node != nil
         insert_loop(data, new_node)
       end
   end

   def insert_loop(data, new_node)
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

   def sort(node = @root_node)
     if node.left != NullNode::DEFAULT
       sort(node.left)
     end
          puts node.data
     if node.right != NullNode::DEFAULT
       sort(node.right)
     end
   end

   def delete(data)
     current_node = @root_node
     if include?(data) == false
       return "the value doesn't exist"
     elsif data < @root_node.data
       delete_left(data)
     elsif data > @root_node.data
       delete_right(data)
     end
   end


   def delete_left(data)
     deleted_node = find_node(data)
     deleted_node_right_child = find_node(data).right
     replacer = deleted_node.left
     parent = find_parent(data)
     subtree_minimum = minimum_node(deleted_node_right_child)
     if deleted_node.left == NullNode::DEFAULT && deleted_node.right != NullNode::DEFAULT
       parent.left = deleted_node.right
     elsif deleted_node.right == NullNode::DEFAULT && deleted_node.left != NullNode::DEFAULT
       parent.left = deleted_node.left
     elsif deleted_node.left == NullNode::DEFAULT && deleted_node.right == NullNode::DEFAULT
       parent.left = NullNode::DEFAULT
     elsif deleted_node.right.left == NullNode::DEFAULT
       parent.left = replacer
       deleted_node.right.left = replacer.right
       replacer.right = deleted_node.right
     else
       parent.left = replacer
       subtree_minimum.left = replacer.right if subtree_minimum != nil
       replacer.right = deleted_node.right.left if deleted_node.right.left == nil
       replacer.right = deleted_node.right
     end
   end

   def delete_right(data)
     deleted_node = find_node(data)
     deleted_node_right_child = find_node(data).right
     replacer = deleted_node.left
     parent = find_parent(data)
     subtree_minimum = minimum_node(deleted_node_right_child)
     if deleted_node.left == NullNode::DEFAULT && deleted_node.right != NullNode::DEFAULT
       parent.left = deleted_node.right
     elsif deleted_node.right == NullNode::DEFAULT && deleted_node.left != NullNode::DEFAULT
       parent.left = deleted_node.left
     elsif deleted_node.left == NullNode::DEFAULT && deleted_node.right == NullNode::DEFAULT
       parent.left = NullNode::DEFAULT
     else
       parent.right = replacer
       subtree_minimum.left = replacer.right if subtree_minimum != nil
       replacer.right = deleted_node.right.left if deleted_node.right.left == nil
       replacer.right = deleted_node.right
     end
   end

   def find_parent(data)
     if data < @root_node.data
       left_parent(data)
     else
       right_parent(data)
     end
   end

   def left_parent(data)
     current_node = @root_node
     depth_of(data)
     (depth_of(data)-1).times do
       current_node = current_node.left
     end
       return current_node
   end

   def right_parent(data)
     current_node = @root_node
     depth_of(data)
     (depth_of(data)-1).times do
       current_node = current_node.right
     end
       return current_node
   end

   def find_node(data)
     current_node = @root_node
     while current_node != NullNode::DEFAULT
        if data == current_node.data
          return current_node
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

   def minimum_node(node)
    current_node = node
    while current_node != NullNode::DEFAULT
      current_node = current_node.left
      if current_node.left == NullNode::DEFAULT
        return current_node
      end
    end
  end


end

bst = BinarySearchTree.new


bst.maximum

# bst.insert("f")
# bst.insert("g")
# bst.insert("d")
# bst.insert("e")
# bst.insert("c")
# bst.insert("ba")
# bst.insert("ca")
# bst.insert("da")
# bst.insert("ea")

bst.insert("f")
bst.insert("d")
bst.insert("g")
bst.insert("fb")
bst.insert("fa")
bst.insert("fc")
bst.insert("gb")
bst.insert("ga")
bst.insert("gc")

bst

bst.delete("g")
bst
