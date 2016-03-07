require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new

list.push(14).push(4).push(20).push(19)

list.print_values

list.reverse

list.print_values
