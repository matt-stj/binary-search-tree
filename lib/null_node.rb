class NullNode
  attr_accessor :data, :right, :left
  def delete(data)
  end

  DEFAULT = NullNode.new

  def initialize(data = NullNode::DEFAULT, left = NullNode::DEFAULT, right = NullNode::DEFAULT)
    @data = data
    @left = left
    @right = right
  end

  def data
    @data
  end

end
