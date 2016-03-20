class Tree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  # left-hand-first search (i.e. looks for value in left children first)
  # iterative, non-recursive
  # uses a stack
  def df_search_for(value)
    stack = ArrayStack.new([@root])
    current_node = stack.pop

    until current_node.payload == value do
      # Push all the children into the stack in order from left to right
      unless current_node.children.empty?
        current_node.children.reverse.each do |child|
          stack.push(child)
        end
      end
      # If the stack is empty, we've searched all the nodes in the list and we can return nil
      # If not, pop it and keep going
      current_node = nil
      break if stack.empty?
      current_node = stack.pop
    end

    return current_node
  end

  # left-hand-first search (i.e. looks for value in left children first)
  # iterative, non-recursive
  # uses a queue
  def bf_search_for(value)
    queue = ArrayQueue.new([@root])
    current_node = queue.dequeue

    until current_node.payload == value do
      unless current_node.children.empty?
        current_node.children.reverse.each do |child|
          queue.enqueue(child)
        end
      end

      current_node = nil
      break if queue.empty?
      current_node = queue.dequeue
    end

    return current_node
  end
end
