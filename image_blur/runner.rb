require_relative 'image'

# Execute stuff here

sample_pixels = [
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 1, 0]
]

img = Image.new(sample_pixels)

puts img.get_pixels_to_blur(1).inspect
