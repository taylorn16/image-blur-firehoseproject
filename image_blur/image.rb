class Image

  attr_reader :pixels

  def initialize(pixels = nil)
    # TODO: use class method to generate pixels only if user doesn't pass in array
    @pixels = pixels
    @height = pixels.size
    @width = pixels[0].size
  end

  # Uses the class method to print the pixel data
  # TODO: put print_pixels an instance method
  # Can ovveride the to string method
  def output_image
    Image.print_pixels(@pixels)
  end

  # Helper for blur method
  # Finds ones without modifying anything in the pixels
  def find_ones
    coords = Set.new

    @pixels.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if @pixels[r][c] == 1
          coords.add Coord.new(r, c, self)
        end
      end
    end

    coords
  end

  # Helper for blur method
  def get_coords_to_blur(distance)
    coords_to_blur = self.find_ones                                 # This is like the first "iteration," accounts for 1 unit of blur distance automatically
    coords_to_add = Set.new

    # Explored, Frontier, To Add to Frontier (xtreme frontier?)
    # Get ones, add to frontier
    # Then, loop through frontier, get surrounding, and add them to xtreme frontier, and pop frontier to explored
    # Every iteration is one manhattan distance
    # Everything left in frontier gets put back in explored
    # Everything left in explored gets blurred to one

    # Also could use "has been checked in coord"

    # Can use downto or upto or a for loop (Rubymonk?)
    while distance > 1                                              # For that^^ reason, this loop terminates at distance = 1, not distance = 0
      coords_to_blur.each do |coord|
        coords_to_add.merge(coord.get_surrounding)
      end

      coords_to_blur.merge(coords_to_add)
      coords_to_add.clear
      distance = distance - 1
    end

    coords_to_blur
  end

  # Main Blur Method
  def blur(distance = 1)
    raise ArgumentError, 'Invalid blur distance' if distance < 1

    self.get_coords_to_blur(distance).each do |coord|
      # Instead of blur_surrounding, just blur individually
      # this way, no repeat functionality
      coord.blur_surrounding
    end

    return self
  end

  # Class methods for help


  def self.random_pixels(height, width)
    pixels = Array.new
    odds = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0]

    (1..height).to_a.each do |row|
      pixels.push Array.new(width){|i| odds.sample}
    end

    pixels
  end

  # Takes array of pixel data and prints it
  def self.print_pixels(pixels)
    pixels.each do |row|
      puts row.map {|i| i.to_s}.join('')
    end
    puts "\n"
  end

end
