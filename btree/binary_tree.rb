require_relative 'binary_tree_node'
require_relative '../tree/array_stack'

class BinaryTree
  attr_accessor :root

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

        elsif parent_node.less_than? parent_node
          if ! parent_node.has_left_child?
            parent_node.left = new_node
            in_place = true
          else
            parent_node = parent_node.left
          end

        else # Nodes are equal
          raise "Can't add identical items to this binary tree!"
        end
      end
    end

    return self
  end

  def to_a
    stack = ArrayStack.new([@root])
    out = Array.new
    parent_node = @root
    current = {node: @root, relation: nil}

    until current[:node].nil? do
      if current.has_children?
        if current.has_right_child?
          stack.push(current.right)
          current[:relation] = :right
        end
        if current.has_left_child?
          stack.push(current.left)
          current[:relation] = :left
        end

        parent_node  = current
        current = stack.pop
      else
        out << current[:node].payload
        parent_node.del_child(current[:relation])

        current[:node] = @root
        current[:relation] = nil
      end
    end

    return out
  end
end
