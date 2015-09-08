require_relative 'null_node'
require_relative 'node'

class BinarySearchTree
public
attr_accessor :root_node

  def initialize(root_node = nil)
    @root_node = root_node
  end

  # def import_data
  #   @input_values = []
  #   input_file = File.open(ARGV[0], "r")
  #   input_file.each_line do |line|
  #     line = line.chomp
  #       if line.class != String
  #       line = line.to_i
  #       end
  #     @input_values.push(line)
  #     @tree = BinarySearchTree.new
  #   @input_values.each do |data|
  #     @tree.insert(data)
  #   end
  #   end
  # end
  #
  # def export_data
  #   writer = File.open(ARGV[1], "w")
  #   sorted = @tree.sort
  #   writer.write(@push_to_array)
  #   sorted.each do |data|
  #     writer.write("#{data}\n")
  #   end
  #   writer.flush
  #   writer.close
  # end

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
      sorted_data = []
      if node.left != NullNode::DEFAULT
        sorted_data.push(sort(node.left))
      end
        sorted_data.push(node.data)
      if node.right != NullNode::DEFAULT
        sorted_data.push(sort(node.right))
      end
      @push_to_array = sorted_data.flatten
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
     deleted_node = find_node(data); deleted_node_right_child = find_node(data).right
     replacer = deleted_node.left; parent = find_parent(data); subtree_minimum = minimum_node(deleted_node_right_child)
     delete_conditionals(deleted_node, deleted_node_right_child, replacer, parent, subtree_minimum)
     if delete_conditionals(deleted_node, deleted_node_right_child, replacer, parent, subtree_minimum) == false
       parent.left = replacer
       subtree_minimum.left = replacer.right if subtree_minimum != nil
       replacer.right = deleted_node.right.left if deleted_node.right.left == nil
       replacer.right = deleted_node.right
     end
   end

   def delete_conditionals(deleted_node, deleted_node_right_child, replacer, parent, subtree_minimum)
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
       return false
     end
   end

   def delete_right(data)
     deleted_node = find_node(data); deleted_node_right_child = find_node(data).right
     replacer = deleted_node.left; parent = find_parent(data); subtree_minimum = minimum_node(deleted_node_right_child)
     delete_conditionals(deleted_node, deleted_node_right_child, replacer, parent, subtree_minimum)
     if delete_conditionals(deleted_node, deleted_node_right_child, replacer, parent, subtree_minimum) == false
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

   def minimum_node(node)
    current_node = node
    while current_node != NullNode::DEFAULT
      current_node = current_node.left
      if current_node.left == NullNode::DEFAULT
        return current_node
      end
    end
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

private :minimum_node, :find_node, :right_parent, :left_parent, :find_parent, :delete_right, :delete_conditionals, :delete_left, :insert_loop

end

# @tree = BinarySearchTree.new
# @tree.import_data
# @tree.export_data
