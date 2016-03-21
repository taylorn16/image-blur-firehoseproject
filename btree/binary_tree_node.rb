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

    def has_children?
      has_left_child? || has_right_child?
    end

    def greater_than? other_node
      @payload > other_node.payload
    end

    def less_than? other_node
      @payload < other_node.payload
    end

    def del_child(sym)
      if sym == :left
        @left = nil
      elsif sym == :right
        @right = nil
      else
        raise ArgumentError, 'Only :left and :right children can be deleted.'
      end
    end
  end
end
