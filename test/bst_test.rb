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

  def test_new_nodes_are_inserted_pointing_to_the_NullNode_instead_of_nil
    tree = BinarySearchTree.new
    assert_nil BinarySearchTree.new.root_node
    tree.insert("hi")
    assert_equal "hi", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.left
    assert_equal NullNode::DEFAULT, tree.root_node.right
  end

  def test_values_less_than_the_tree_root_will_be_inserted_to_the_left
    tree = BinarySearchTree.new
    tree.insert("f")
    assert_equal "f", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.left
    tree.insert("d")
    assert_equal "d", tree.root_node.left.data
  end

  def test_values_greater_than_the_tree_root_will_be_inserted_to_the_right
    tree = BinarySearchTree.new
    tree.insert("f")
    assert_equal "f", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.right
    tree.insert("m")
    assert_equal "m", tree.root_node.right.data
  end

  def test_values_less_than_any_given_tree_node_will_be_inserted_to_the_left
    tree = BinarySearchTree.new
    tree.insert("f")
    assert_equal "f", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.left
    tree.insert("d")
    assert_equal "d", tree.root_node.left.data
    tree.insert("b")
    assert_equal "b", tree.root_node.left.left.data
  end

  def test_values_greater_than_any_given_tree_node_will_be_inserted_to_the_right
    tree = BinarySearchTree.new
    tree.insert("f")
    assert_equal "f", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.right
    tree.insert("m")
    assert_equal "m", tree.root_node.right.data
    tree.insert("r")
    assert_equal "r", tree.root_node.right.right.data
  end

end
