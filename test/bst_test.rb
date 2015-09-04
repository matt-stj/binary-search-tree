require 'minitest'
require_relative '../lib/node'
require_relative '../lib/bst'

class BinarySearchTreeTest < Minitest::Test

  def test_assert_head_is_nil_for_empty_tree
    assert_nil BinarySearchTree.new.root_node
  end

  def test_we_can_add_a_node_to_the_root_of_an_empty_tree
    tree = BinarySearchTree.new
    assert_nil BinarySearchTree.new.root_node
    tree.insert("hi")
    assert_equal "hi", tree.root_node.data
  end

end
