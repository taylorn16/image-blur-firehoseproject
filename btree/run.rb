require_relative 'binary_tree'

## Execute stuff

tree = BinaryTree.new

tree.push(5)
tree.push(3)
tree.push(1)
tree.push(2)
tree.push(19)

puts tree.inspect
