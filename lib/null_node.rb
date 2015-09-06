class NullNode

  attr_accessor :data, :right, :left  # => nil


  def delete(data)
  end               # => :delete

  DEFAULT = NullNode.new  # => #<NullNode:0x007ff482896330>


  def initialize(data = NullNode::DEFAULT, left = NullNode::DEFAULT, right = NullNode::DEFAULT)
    @data = data                                                                   # => nil
    @left = left                                                                   # => #<NullNode:0x007ff482896330>
    @right = right                                                                 # => #<NullNode:0x007ff482896330>
  end

  def data
    @data
  end                                                                              # => :initialize


end  # => :initialize

NullNode.new  # => #<NullNode:0x007ff482895c78 @data=nil, @left=#<NullNode:0x007ff482896330>, @right=#<NullNode:0x007ff482896330>>
