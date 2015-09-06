require_relative 'null_node'  # => true
require_relative 'node'       # => true

class BinarySearchTree
public                    # => BinarySearchTree
attr_accessor :root_node  # => nil

  def initialize(root_node = nil)
    @root_node = root_node         # => nil
  end                              # => :initialize

  def insert(data)
       new_node = Node.new(data)                                                         # => #<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09c250 @data="a", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
       if @root_node.nil?                                                                # => true, false, false
         @root_node = new_node                                                           # => #<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
       elsif @root_node != nil                                                           # => true, true
           current_node = @root_node                                                     # => #<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09fec8 @data="d", @left=#<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>
         while current_node != NullNode::DEFAULT                                         # => true, true, true, true, true, true, true
             if data < current_node.data && current_node.left == NullNode::DEFAULT       # => true, false, false, false, true, false, false
                 current_node.left = new_node                                            # => #<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09c250 @data="a", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
             elsif  data > current_node.data && current_node.right == NullNode::DEFAULT  # => false, false, false, false, false
                 current_node.right = new_node
             elsif data < current_node.data                                              # => true, false, true, true, false
                 current_node = current_node.left                                        # => #<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, #<Node:0x007fc9cc09c250 @data="a", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
             elsif data > current_node.data                                              # => false, false
                 current_node = current_node.right
             else
                 return
             end
         end
       end                                                                               # => #<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
   end                                                                                   # => :insert

end                         # => :insert
bst = BinarySearchTree.new  # => #<BinarySearchTree:0x007fc9cc0a41f8 @root_node=nil>
bst.insert("d")             # => #<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>
bst                         # => #<BinarySearchTree:0x007fc9cc0a41f8 @root_node=#<Node:0x007fc9cc09fec8 @data="d", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>>
bst.insert("b")             # => nil
bst                         # => #<BinarySearchTree:0x007fc9cc0a41f8 @root_node=#<Node:0x007fc9cc09fec8 @data="d", @left=#<Node:0x007fc9cc09ee60 @data="b", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>>
bst.insert("a")             # => nil
bst.inspect                 # => "#<BinarySearchTree:0x007fc9cc0a41f8 @root_node=#<Node:0x007fc9cc09fec8 @data=\"d\", @left=#<Node:0x007fc9cc09ee60 @data=\"b\", @left=#<Node:0x007fc9cc09c250 @data=\"a\", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>>"
bst                         # => #<BinarySearchTree:0x007fc9cc0a41f8 @root_node=#<Node:0x007fc9cc09fec8 @data="d", @left=#<Node:0x007fc9cc09ee60 @data="b", @left=#<Node:0x007fc9cc09c250 @data="a", @left=#<NullNode:0x007fc9cc0a7718>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>, @right=#<NullNode:0x007fc9cc0a7718>>>
