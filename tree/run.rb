## Execute stuff here
require_relative 'array_stack'
require_relative 'array_queue'
require_relative 'tree'
require_relative 'tree_node'

# 4th Level
deep_five_node = Tree::Node.new(5)
eleven_node = Tree::Node.new(11)
four_node = Tree::Node.new(4)

# 3rd Level
six_node = Tree::Node.new(6, [deep_five_node, eleven_node])
nine_node = Tree::Node.new(9, [four_node])

# 2nd Level
seven_node = Tree::Node.new(7, [six_node])
five_node = Tree::Node.new(5, [nine_node])

# root
two_node = Tree::Node.new(2, [seven_node, five_node])

tree = Tree.new(two_node)

puts tree.inspect
puts "\n"
puts tree.df_search_for(5).inspect
puts "\n"
puts tree.bf_search_for(5).inspect
