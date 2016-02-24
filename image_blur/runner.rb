require_relative 'image'

# Execute stuff here

sample_pixels = [
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0]
]

img = Image.new

puts img
puts img.blur(1)
