require_relative 'null_node'  # => true

class Node
  attr_accessor :data, :right, :left  # => nil

  def initialize(data, left = nil, right = nil)
    @data = data                                 # => "hi"
    @left = left                                 # => nil
    @right = right                               # => nil
  end                                            # => :initialize

end  # => :initialize


node = Node.new("hi")  # => #<Node:0x007f9d7c0ac500 @data="hi", @left=nil, @right=nil>
node.right             # => nil
