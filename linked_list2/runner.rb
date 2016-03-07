require_relative 'linked_list'


node2 = LinkedListNode.new(21)
node1 = LinkedListNode.new(19, node2)
node0 = LinkedListNode.new(42, node1)

LinkedListNode.print_values(node0)

# s = Stack.new
#
# s.push(20).push(30).push(40).push(50)

# LinkedListNode.print_values(s.data)
# puts s.pop().inspect
# LinkedListNode.print_values(s.data)
# puts s.pop().inspect
# LinkedListNode.print_values(s.data)
# puts s.pop().inspect
# LinkedListNode.print_values(s.data)
# puts s.pop().inspect
# LinkedListNode.print_values(s.data)
# puts s.pop().inspect
# LinkedListNode.print_values(s.data)

reversed_list = LinkedListNode.reverse_list(node0)

LinkedListNode.print_values(reversed_list)
