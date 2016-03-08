require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new

list.push(14).push(4).push(20).push(19)

# list.tail.next_node = list.head # Cycle created

list.print_values
