require 'set'
require_relative 'image'
require_relative 'coord'

# Execute stuff here

img = Image.new(Image.random_pixels(15, 15))

img.output_image

img.blur(1).output_image
