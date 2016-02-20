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

  # Uses the class method to print the pixel data
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
