class Tree
  class Node
    attr_accessor :payload, :children

    def initialize(payload = nil, children = [])
      @payload = payload
      @children = children
    end

  end
end
