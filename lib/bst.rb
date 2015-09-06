require_relative 'null_node'  # => true
require_relative 'node'       # => true

class BinarySearchTree
public                    # => BinarySearchTree
attr_accessor :root_node  # => nil

end  # => nil

  def initialize(root_node = nil)
    @root_node = root_ node        # ~> NameError: undefined local variable or method `node' for #<BinarySearchTree:0x007f99940e5a58>
  end                              # => :initialize

  # def insert(data)
  #   if @root_node.nil?                                                # => true, false
  #     @root_node = Node.new(data)                                     # => #<Node:0x007ffc15022a88 @data="d", @left=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>, @right=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>>
  #   else
  #     current_node = @root_node                                       # => #<Node:0x007ffc15022a88 @data="d", @left=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>, @right=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>>
  #     loop do
  #       if data < current_node.data                                   # ~> ArgumentError: comparison of String with Class failed
  #         current_node = current_node.left                            # => #<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>
  #         break if current_node.right.nil? || current_node.left.nil?  # => false
  #       end
  #       current_node.left = Node.new(data)                            # => #<Node:0x007ffc15020558 @data="b", @left=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=#<Node:0x007ffc15020558 ...>, @right=NullNode>, @right=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=#<Node:0x007ffc15020558 ...>, @right=NullNode>>
  #       # # elsif data > current_node.data
  #       # #   current_node.right = Node.new(data)
  #       # break if current_node.right.nil? || current_node.left.nil?
  #       # end
  #     end
  #   end                                                               # => #<Node:0x007ffc15022a88 @data="d", @left=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>, @right=#<NullNode:0x007ffc150338d8 @data=NullNode, @left=NullNode, @right=NullNode>>
  # end                                                                 # => :insert

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
  def insert(data)
    new_node = Node.new(data)
    @root_node = new_node if @root_node.nil?
    tree_node = new_node if tree_node == NullNode::DEFALT

    return tree_node if tree_node.data == new_node.data

    if new_node.data < tree_node.data
      return insert_at_node(tree_node.left, new_node) unless tree_node.left == NullNode::Default
      return tree_node.left = new_node
    end
  end                                                                                             # => :insert_at_node




    def matts_insert(data)
      new_node = Node.new
      if @root_node.nil?
        @root_node = new_node
      end
    end                        # => :matts_insert

    def matts_insert_at(existing_node, new_node)
      if existing_node.nil?
        existing_node = new_node
      elsif existing_node.data == new_node.data
        return existing_node
      else
        return insert_at_node()
      end
    end                                           # => :matts_insert_at

  #
  #   return insert_at_node(tree_node.right, new_node) unless tree_node.right.nil?
  #   tree_node.right = new_node
  # end



bst = BinarySearchTree.new
bst.insert("d")
bst
bst.insert("b")
bst.insert("a")
bst
bst
# bst.search("a")

# bst.insert("c")
# bst.insert("d")
# bst.insert("e")
# bst.insert("f")
# bst.insert("g")
# bst

# ~> NameError
# ~> undefined local variable or method `node' for #<BinarySearchTree:0x007f99940e5a58>
# ~>
# ~> /Users/Matt/Turing/1 Modual/Projects/binary_search_tree/lib/bst.rb:11:in `initialize'
# ~> /Users/Matt/Turing/1 Modual/Projects/binary_search_tree/lib/bst.rb:92:in `new'
# ~> /Users/Matt/Turing/1 Modual/Projects/binary_search_tree/lib/bst.rb:92:in `<main>'
