require 'minitest'
require_relative '../lib/node'
require_relative '../lib/bst'

class NullNodeTest < Minitest::Test

  def test_a_NullNode_points_to_Null_node
    node = NullNode.new
    assert_equal NullNode::DEFAULT, node.left
    assert_equal NullNode::DEFAULT, node.right
  end

  def test_the_last_elements_in_a_tree_point_to_Null_Node
    tree = BinarySearchTree.new
    tree.insert("b")
    tree.insert("a")
    tree.insert("c")
    assert_equal NullNode::DEFAULT, tree.root_node.left.left
  end

end
