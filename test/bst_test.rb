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

  def test_we_can_properly_insert_integers_with_negative_values_into_tree
    tree = BinarySearchTree.new
    tree.insert("50")
    assert_equal "50", tree.root_node.data
    assert_equal NullNode::DEFAULT, tree.root_node.right
    tree.insert("-1")
    assert_equal "-1", tree.root_node.left.data
    tree.insert("100")
    assert_equal "100", tree.root_node.left.right.data
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

  def test_sort_works_for_integers
    tree = BinarySearchTree.new
    tree.insert(50)
    tree.insert(45)
    tree.insert(30)
    tree.insert(60)
    tree.insert(80)
    tree.insert(20)
    tree.insert(15)
    tree.insert(200)
    sorted_array = []
    assert_equal [15, 20, 30, 45, 50, 60, 80, 200], tree.sort
  end

  def test_sort_works_for_strings
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("c")
    tree.insert("b")
    tree.insert("a")
    tree.insert("f")
    tree.insert("g")
    tree.insert("h")
    tree.insert("k")
    assert_equal ["a", "b", "c", "d", "f", "g", "h", "k"], tree.sort
  end

  def test_delete_will_notify_if_value_doesnt_exist
    tree = BinarySearchTree.new
    tree.insert("d")
    tree.insert("c")
    assert_equal "the value doesn't exist", tree.delete("z")
  end

  def test_delete_works_on_left_side_of_root_for_node_with_2_child_nodes
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("d")
    tree.insert("e")
    tree.insert("c")
    tree.insert("ba")
    tree.insert("ca")
    tree.insert("da")
    tree.insert("ea")
    assert_equal "d", tree.root_node.left.data
    assert_equal "e", tree.root_node.left.right.data
    assert_equal "c", tree.root_node.left.left.data
    tree.delete("d")
    assert_equal "c", tree.root_node.left.data
    assert_equal "e", tree.root_node.left.right.data
    assert_equal "ba", tree.root_node.left.left.data
    assert_equal "ca", tree.root_node.left.right.left.left.data
  end

  def test_delete_works_on_right_side_of_root_for_node_with_2_child_nodes
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("g")
    tree.insert("fb")
    tree.insert("fa")
    tree.insert("fc")
    tree.insert("gb")
    tree.insert("ga")
    tree.insert("gc")
    assert_equal "g", tree.root_node.right.data
    assert_equal "gb", tree.root_node.right.right.data
    assert_equal "fb", tree.root_node.right.left.data
    tree.delete("g")
    assert_equal "fb", tree.root_node.right.data
    assert_equal "gb", tree.root_node.right.right.data
    assert_equal "fa", tree.root_node.right.left.data
    assert_equal "fc", tree.root_node.right.right.left.left.data
  end

  def test_delete_works_for_nodes_with_one_left_child
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("d")
    tree.insert("c")
    assert_equal "d", tree.root_node.left.data
    assert_nil tree.root_node.left.right.data
    assert_equal "c", tree.root_node.left.left.data
    tree.delete("d")
    assert_equal "c", tree.root_node.left.data
    assert_nil tree.root_node.left.right.data
  end

  def test_delete_works_for_nodes_with_one_right_child
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("d")
    tree.insert("e")
    assert_equal "d", tree.root_node.left.data
    assert_nil tree.root_node.left.left.data
    assert_equal "e", tree.root_node.left.right.data
    tree.delete("d")
    assert_equal "e", tree.root_node.left.data
    assert_nil tree.root_node.left.left.data
  end

  def test_delete_works_for_nodes_with_no_children
    tree = BinarySearchTree.new
    tree.insert("f")
    tree.insert("d")
    tree.insert("c")
    assert_equal "d", tree.root_node.left.data
    assert_nil tree.root_node.left.right.data
    assert_nil tree.root_node.left.left.left.data
    assert_equal "c", tree.root_node.left.left.data
    tree.delete("c")
    assert_nil tree.root_node.left.left.data
    assert_nil tree.root_node.left.right.data
  end

end
