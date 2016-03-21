require_relative 'binary_tree'

## Execute stuff

unsorted = [3, 16, 1, 9, 46, 30, 5, 2, 25]
puts unsorted.inspect
puts BinaryTree.sort(unsorted).inspect
