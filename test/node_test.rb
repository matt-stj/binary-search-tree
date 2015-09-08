require 'minitest'
require_relative '../lib/node'
require_relative '../lib/bst'

class NodeTest < Minitest::Test

  def test_assert_a_node_has_data
    node = Node.new("a")
    assert "a", node.data
  end

  def test_a_new_node_points_to_Null_node
    node = Node.new("a")
    assert_equal NullNode::DEFAULT, node.left
    assert_equal NullNode::DEFAULT, node.right
  end

end
