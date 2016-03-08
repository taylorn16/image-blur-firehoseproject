class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def self.print_values(head_node)
    until head_node.nil?
      print "#{head_node.value} --> "
      head_node = head_node.next_node
    end
    print "nil\n"

    return
  end

  # Ask Seth; this could use some work
  def self.reverse_list(head_node)
    unless head_node.nil?
      first_node = nil
      new_node = nil
      current_node = nil
      stack = Stack.new

      until head_node.nil?                        # Push all the values into a stack
        stack.push(head_node.value)
        head_node = head_node.next_node
      end

      # OPTIMIZATION: just return @data from stack

      current_pop_value = stack.pop
      first_node = LinkedListNode.new(current_pop_value)
      current_node = first_node
      until current_pop_value.nil?                        # Pop all the values into a new head node list
        current_pop_value = stack.pop
        break if current_pop_value.nil?

        current_node.next_node = LinkedListNode.new(current_pop_value)
        current_node = current_node.next_node
      end

      first_node
    else
      nil
    end
  end

end

class Stack
  attr_reader :data

  # Data will hold the head node of the list, which is the list in effect
  def initialize
    @data = nil
  end

  def push(value)
    if @data.nil?
      @data = LinkedListNode.new(value)
    else
      get_tail.next_node = LinkedListNode.new(value)
    end

    return self
  end

  def pop
    tail = get_tail()

    if ! tail.nil? && @data == tail     # Last item
      value = @data.value
      @data = nil
    elsif ! @data.nil?                  # Not empty and not the last item
      value = tail.value
      delete_tail()
    else                                # Empty
      value = nil
    end

    value
  end

  private

  def get_tail
    unless @data.nil?
      node = @data
      until node.next_node.nil?
        node = node.next_node
      end

      return node
    else
      return nil
    end
  end

  def get_before_tail
    tail = get_tail()

    unless @data.nil? || @data == get_tail
      node = @data
      until node.next_node == tail
        node = node.next_node
      end

      node
    else
      nil
    end
  end

  def delete_tail
    before_tail = get_before_tail

    unless before_tail.nil?
      before_tail.next_node = nil
    else
      return false
    end
  end

end
