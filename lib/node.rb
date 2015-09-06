require_relative 'null_node'  # => true

class Node
  attr_accessor :data, :right, :left  # => nil

  def initialize(data, left = NullNode::DEFAULT, right = NullNode::DEFAULT)
    @data = data                                                             # => "hi"
    @left = left                                                             # => #<NullNode:0x007f9874889c58>
    @right = right                                                           # => #<NullNode:0x007f9874889c58>
  end                                                                        # => :initialize

end  # => :initialize



node = Node.new("hi")  # => #<Node:0x007f9874888ee8 @data="hi", @left=#<NullNode:0x007f9874889c58>, @right=#<NullNode:0x007f9874889c58>>
node.right             # => #<NullNode:0x007f9874889c58>
