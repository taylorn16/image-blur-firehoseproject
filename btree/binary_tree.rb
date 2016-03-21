require_relative 'binary_tree_node'
require_relative '../tree/array_stack'

class BinaryTree
  def initialize(root = nil)
    @root = root
  end

  def push(value)
    new_node = BinaryTree::Node.new(value)

    if @root.nil?
      @root = new_node
    else
      in_place = false
      parent_node = @root
      until in_place do
        if new_node.greater_than? parent_node
          if ! parent_node.has_right_child?
            parent_node.right = new_node
            in_place = true
          else
            parent_node = parent_node.right
          end

        elsif new_node.less_than? parent_node
          if ! parent_node.has_left_child?
            parent_node.left = new_node
            in_place = true
          else
            parent_node = parent_node.left
          end

        else # Nodes are equal
          puts "Nodes are equal."
          raise StandardError, "Can't add identical items to *this* binary tree!"
        end
      end
    end

    return self
  end

  def to_a(node = @root)
    return [] if @root.nil?

    if node.has_left_child? && node.has_right_child?
      return to_a(node.left) + [node.payload] + to_a(node.right)
    elsif node.has_left_child?
      return to_a(node.left) + [node.payload]
    elsif node.has_right_child?
      return [node.payload] + to_a(node.right)
    else
      return [node.payload]
    end
  end

  def self.sort(arr)
    tree = BinaryTree.new
    arr.each {|i| tree.push(i)}
    return tree.to_a
  end
end
