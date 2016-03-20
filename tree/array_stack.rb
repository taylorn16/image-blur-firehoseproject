class ArrayStack
  def initialize(stack = nil)
    @stack = stack.nil? ? [] : stack
  end

  def push(item)
    @stack.push(item)
  end

  def pop
    @stack.pop
  end

  def empty?
    @stack.size == 0
  end
end
