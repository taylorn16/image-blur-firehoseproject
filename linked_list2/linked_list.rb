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

  def self.reverse_list(head_node)

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
    unless @data.nil?
      value = get_tail().value
      del_tail()

      return value
    else
      return nil
    end
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

  def del_tail
    tail = get_tail()

    unless @data.nil?
      node = @data
      until node.next_node == tail
        puts "#{node.next_node} == #{tail}"
        node = node.next_node
      end

      node.next_node = nil

      return self
    else
      return nil
    end
  end

end
