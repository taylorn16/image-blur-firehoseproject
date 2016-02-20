require 'set'

class Image

  attr_reader :pixels

  def initialize(pixels)
    if !pixels.empty? && pixels.is_a?(Array)
      @pixels = pixels
      @height = pixels.size
      @width = pixels[0].size
    else
      raise ArgumentError, "Input not an array or is empty"
    end
  end

  def output_image
    Image.print_pixels(@pixels)

    return self
  end

  def find_ones
    coords = Set.new

    @pixels.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if @pixels[r][c] == 1
          coords.add Coord.new(r, c, self)
        end
      end
    end

    return coords
  end

  # Helper for blur method
  def get_coords_to_blur(distance)
    coords_to_blur = self.find_ones                                 # This is like the first "iteration," accounts for 1 unit of blur distance automatically
    coords_to_add = Set.new

    while distance > 1                                              # For that^^ reason, this loop terminates at distance = 1, not distance = 0
      coords_to_blur.each do |coord|
        coords_to_add.merge(coord.get_surrounding)
      end

      coords_to_blur.merge(coords_to_add)
      coords_to_add.clear
      distance = distance - 1
    end

    return coords_to_blur
  end

  # Main Blur Method
  def blur(distance = 1)
    raise ArgumentError, 'Invalid blur distance' if distance < 1

    self.get_coords_to_blur(distance).each do |coord|
      coord.blur_surrounding
    end

    return self
  end

  # Class methods for help
  def self.random_pixels(height, width)
    pixels = Array.new
    odds = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1]

    (1..height).to_a.each do |row|
      pixels.push Array.new(width){|i| odds.sample}
    end

    return pixels
  end

  # Takes array of pixel data
  def self.print_pixels(pixels)
    pixels.each do |row|
      puts row.map {|i| i.to_s}.join('')
    end

    puts "\n"
    return self
  end

end

# A small abstraction class to take some logic out of the main class
# Each coordinate has a row, col (position) and an image instance that it belongs to
class Coord

  attr_reader :row, :col, :image

  def initialize(row, col, image)
    @row = row
    @col = col
    @image = image
  end

  def is_right?
    !(@col < @image.pixels[0].size - 1)
  end

  def is_left?
    !(@col > 0)
  end

  def is_top?
    !(@row > 0)
  end

  def is_bottom?
    !(@row < @image.pixels.size - 1)
  end

  def blur_surrounding
    ary = @image.pixels

    ary[@row - 1][@col] = 1 unless self.is_top?
    ary[@row + 1][@col] = 1 unless self.is_bottom?
    ary[@row][@col - 1] = 1 unless self.is_left?
    ary[@row][@col + 1] = 1 unless self.is_right?

    return self
  end

  def get_surrounding
    coords = Set.new

    coords.add Coord.new(@row - 1, @col, @image) unless self.is_top?
    coords.add Coord.new(@row + 1, @col, @image) unless self.is_bottom?
    coords.add Coord.new(@row, @col - 1, @image) unless self.is_left?
    coords.add Coord.new(@row, @col + 1, @image) unless self.is_right?

    return coords
  end

end

img = Image.new(Image.random_pixels(10, 10)).output_image

img.blur.output_image
