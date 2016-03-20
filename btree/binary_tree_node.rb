class BinaryTree
  class Node
    attr_accessor :payload, :left, :right

    def initialize(payload, left = nil, right = nil)
      @payload = payload
      @left = left
      @right = right
    end

    def has_left_child?
      ! @left.nil?
    end

    def has_right_child?
      ! @right.nil?
    end

    def greater_than? other_node
      @payload > other_node.payload
    end

    def less_than? other_node
      ! greater_than? other_node
    end
  end
end
