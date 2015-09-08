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

  def test_we_can_check_if_the_tree_includes_a_given_value
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("m")
    tree.insert("r")
    assert_equal "r", tree.root_node.right.right.data
    assert tree.include?("r")
  end

  def test_we_can_determine_if_the_tree_does_not_include_a_given_value
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("m")
    tree.insert("r")
    assert_equal "r", tree.root_node.right.right.data
    refute tree.include?("z")
  end

  def test_we_can_determine__the_depth_of_a_given_value
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("m")
    tree.insert("r")
    tree.insert("p")
    assert_equal 3, tree.depth_of("p")
  end


  def test_the_depth_of_the_root_node_will_be_returned_as_zero
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("m")
    tree.insert("r")
    tree.insert("p")
    assert_equal 0, tree.depth_of("f")
  end

  def test_we_can_find_the_maximum_value_in_a_given_tree
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("c")
    tree.insert("b")
    tree.insert("a")
    tree.insert("f")
    tree.insert("g")
    tree.insert("h")
    tree.insert("k")
    assert_equal "k", tree.maximum
  end

  def test_we_get_notified_if_calling_maximum_on_an_empty_tree
    tree = BinarySearchTree.new
    assert_equal "The tree is empty", tree.maximum
  end

  def test_we_can_find_the_minimum_value_in_a_given_tree
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("c")
    tree.insert("b")
    tree.insert("a")
    tree.insert("f")
    tree.insert("g")
    tree.insert("h")
    tree.insert("k")
    assert_equal "a", tree.minimum
  end

  def test_we_get_notified_if_calling_minimum_on_an_empty_tree
    tree = BinarySearchTree.new
    assert_equal "The tree is empty", tree.minimum
  end

  def test_delete_notify_if_value_doesnt_exist
  end

  def test_delete_left_works
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("c")
    tree.insert("b")
    tree.insert("a")
    tree.insert("f")
    tree.insert("g")
    tree.insert("h")
    tree.insert("k")
  end

end
