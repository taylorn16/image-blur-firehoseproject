require_relative 'linked_list'


# node2 = LinkedListNode.new(21)
# node1 = LinkedListNode.new(19, node2)
# node0 = LinkedListNode.new(42, node1)
#
# LinkedListNode.print_values(node0)

s = Stack.new

s.push(20).push(30).push(40)

puts s.pop
puts s.pop
puts s.pop
