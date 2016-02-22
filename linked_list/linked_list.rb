class LinkedList

  attr_reader :head, :tail, :n

  def initialize(head = nil, tail = nil, n = 0)
    @head = head
    @tail = tail
    @n = n
  end

  def push(value)
    new_node = LinkedList::Node.new(value)

    if self.is_empty?
      @head = new_node
    else
      @tail.next_node = new_node
    end

    @tail = new_node
    @n = @n + 1

    return self
  end

  def pop
    if self.is_empty?
      return nil
    elsif @n == 1
      node_to_pop = @tail
      @tail = @head = nil
      @n = @n - 1

      node_to_pop
    else
      node_to_pop = @tail
      @tail = self.nth_node(@n - 2)
      @tail.next_node = nil
      @n = @n - 1

      return node_to_pop
    end
  end

  def reverse
    unless @n <= 1
      index = @n - 2
      end_node = @tail
      before_end_node = self.nth_node(index)

      (@n - 1).times do
        index = index - 1
        end_node.next_node = before_end_node
        end_node = before_end_node

        unless self.nth_node(index).nil?
          before_end_node = self.nth_node(index)
        else
          end_node.next_node = nil
        end
      end

      oldTail = @tail; oldHead = @head
      @tail = oldHead; @head = oldTail

      return self
    else
      puts "Nothing to reverse!"
      return self
    end
  end

  def nth_node(n)
    if n + 1 > @n || n < 0                       # invalid index
      return nil
    end

    node = @head
    while n > 0
      node = node.next_node
      n = n - 1
    end

    return node
  end

  def is_empty?
   @n == 0
  end

  def print_values
    if ! self.is_empty?
      node = @head
      while node.has_next?
        print "#{node.value} --> "
        node = node.next_node
      end
      print "#{@tail.value} --> nil [#{@n}]\n"
    else
      puts "No values to print."
    end
  end

end
