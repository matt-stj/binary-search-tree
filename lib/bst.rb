require_relative 'null_node'  # => true
require_relative 'node'       # => true

class BinarySearchTree

attr_accessor :root_node  # => nil

  def initialize(root_node = nil)
    @root_node = root_node         # => nil
  end                              # => :initialize

  def insert(data)
    if @root_node.nil?                                         # => true, false
      @root_node = Node.new(data)                              # => #<Node:0x007f8aaa80e260 @data="a", @left=nil, @right=nil>
    elsif @root_node != nil
      @root_node.left = Node.new(data) if data < @root_node.data
      @root_node.right = Node.new(data) if data > @root_node.data
    end
  end
  #     current_node = @root_node                                # => #<Node:0x007f8aaa80e260 @data="a", @left=nil, @right=nil>
  #     until current_node.left.nil? or current_node.right.nil?  # => true
  #       if data < current_node.data
  #         current_node.left = Node.new(data)
  #       elsif data > current_node.data
  #         current_node.right = Node.new(data)
  #       end
  #     end                                                      # => nil
  #   end                                                        # => #<Node:0x007f8aaa80e260 @data="a", @left=nil, @right=nil>, nil
  # end                                                          # => :insert

  # def search(data)
  #   return nil if root_node == nil
  #   return search_at_node(@root_node, data)
  # end
  #
  # def search_at_node(tree_node, data)
  #   return nil if tree_node.nil?
  #
  #   return tree_node if data == tree_node.data
  #     return search_at_node(tree_node.left, data) if data < tree_node.data
  #     return search_at_node(tree_node.right, data)
  # end
  #
  # def insert(data)
  #      new_node = Node.new(data)
  #      @root_node = new_node and return if @root_node.nil?
  #
  #      insert_at_node(@root_node, new_node)
  #    end
  #
  #    def insert_at_node(tree_node, new_node)
  #   tree_node = new_node and return if tree_node.nil?
  #
  #   return tree_node if tree_node.data == new_node.data
  #
  #   if new_node.data < tree_node.data
  #     return insert_at_node(tree_node.left, new_node) unless tree_node.left.nil?
  #     return tree_node.left = new_node
  #   end
  #
  #   return insert_at_node(tree_node.right, new_node) unless tree_node.right.nil?
  #   tree_node.right = new_node
  # end


end  # => :insert

bst = BinarySearchTree.new  # => #<BinarySearchTree:0x007f8aaa80e828 @root_node=nil>
bst.insert("a")             # => #<Node:0x007f8aaa80e260 @data="a", @left=nil, @right=nil>
bst.insert("b")             # => nil
bst                         # => #<BinarySearchTree:0x007f8aaa80e828 @root_node=#<Node:0x007f8aaa80e260 @data="a", @left=nil, @right=nil>>
bst.root_node.left          # => nil
# bst.search("a")

# bst.insert("c")
# bst.insert("d")
# bst.insert("e")
# bst.insert("f")
# bst.insert("g")
# bst
