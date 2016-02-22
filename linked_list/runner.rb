require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new

list.push(3).push(7).push(11).push(10)

list.print_values

list.pop

list.print_values

list.pop

list.print_values

list.pop

list.print_values

list.pop

list.print_values
