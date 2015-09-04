require_relative 'null_node'
require_relative 'node'

class BinarySearchTree

attr_accessor :root_node

  def initialize(root_node = nil)
    @root_node = root_node
  end

  def insert(data)
    if @root_node.nil?
      @root_node = Node.new(data)
    end
  end
    # elsif data < current_node
    #   current_node = @root_node
    #   until current_node.left.data
    #
    #   @root_node.left = current_position
    #   until current_position.nil?
    #
    # else
    #   @root_node.right
    # end

  # def search(data)
  #   return nil if root_node == nil
  #   return search_at_node(@root_node, data)
  # end
  #
  # def search_at_node(tree_node, data)
  #   return nil if tree_node.nil?
  #
  #   return tree_node if data == tree_node.data
  #     return search_at_node(tree_node.left, data) if data < tree_node.data
  #     return search_at_node(tree_node.right, data)
  # end
  #
  # def insert(data)
  #      new_node = Node.new(data)
  #      @root_node = new_node and return if @root_node.nil?
  #
  #      insert_at_node(@root_node, new_node)
  #    end
  #
  #    def insert_at_node(tree_node, new_node)
  #   tree_node = new_node and return if tree_node.nil?
  #
  #   return tree_node if tree_node.data == new_node.data
  #
  #   if new_node.data < tree_node.data
  #     return insert_at_node(tree_node.left, new_node) unless tree_node.left.nil?
  #     return tree_node.left = new_node
  #   end
  #
  #   return insert_at_node(tree_node.right, new_node) unless tree_node.right.nil?
  #   tree_node.right = new_node
  # end


end

bst = BinarySearchTree.new
bst.insert("a")
bst
bst.root_node.data
# bst.search("a")
# bst.insert("b")
# bst.insert("c")
# bst.insert("d")
# bst.insert("e")
# bst.insert("f")
# bst.insert("g")
# bst
