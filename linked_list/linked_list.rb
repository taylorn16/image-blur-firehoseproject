class LinkedList

  attr_reader :head, :tail, :n
  attr_writer :tail

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

    self
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

      node_to_pop
    end
  end

  def swap_ends
    @tail, @head = @head, @tail

    self
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
          # This is the tail
          end_node.next_node = nil
        end
      end

      swap_ends

      self
    else
      puts "Nothing to reverse!"
      self
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

    node
  end

  def is_empty?
   @n == 0
  end

  def print_values
    if ! (is_empty? || has_cycle?)
      node = @head
      while node.has_next?
        print "#{node.value} --> "
        node = node.next_node
      end
      print "#{@tail.value} --> nil [#{@n}]\n"
    else
      puts "Empty or list contains a cycle."
    end

    return
  end

  def nodes_equal?(node1, node2)
    node1 == node2
  end

  # Watch edge cases?
  def has_cycle?
    unless is_empty? || @n == 1
      tortoise = @head
      hare = @head.next_node

      until hare.next_node.nil? || hare.next_node.next_node.nil? do
        tortoise = tortoise.next_node
        hare = hare.next_node
        return true if nodes_equal? tortoise, hare

        hare = hare.next_node
        return true if nodes_equal? tortoise, hare
      end

      false
    else
      false
    end
  end

end
