class Image

  attr_reader :pixels

  def initialize(pixels = nil)
    @pixels = pixels.nil? ? Image.random_pixels(15, 15) : pixels
    @height = @pixels.size
    @width = @pixels[0].size
  end

  def to_s
    str = ""
    pixels.each do |row|
      str = str + row.map {|i| i.to_s}.join(' ') + "\n"
    end

    return str + "\n"
  end

  # Main Blur Method
  def blur(distance = 1)
    raise ArgumentError, 'Invalid blur distance' if distance < 1

    get_pixels_to_blur(distance).each do |coord|
      blur_pixel(coord)
    end

    return self
  end

  private

  # Helper for blur method
  # Finds ones without modifying anything
  def find_ones
    coords = []
    @pixels.each_with_index do |row, r|
      row.each_with_index do |col, c|
        if @pixels[r][c] == 1
          coords << [r, c]
        end
      end
    end
    coords
  end

  def blur_pixel(coord)
    row, col = coord
    @pixels[row][col] = 1 unless is_invalid_pixel?(coord)
    return self
  end

  def is_invalid_pixel?(coord)
    row, col = coord
    col > @width - 1 || col < 0 || row > @height - 1 || row < 0
  end

  def get_surrounding_pixels(coord)
    row, col = coord
    coords = []
    coords << [row - 1, col] unless is_invalid_pixel?([row - 1, col])
    coords << [row + 1, col] unless is_invalid_pixel?([row + 1, col])
    coords << [row, col - 1] unless is_invalid_pixel?([row, col - 1])
    coords << [row, col + 1] unless is_invalid_pixel?([row, col + 1])
    coords
  end

  # Helper for blur method
  def get_pixels_to_blur(distance)
    explored_pixels = []
    frontier_pixels = find_ones
    xtremefr_pixels = []

    while distance > 0
      # Get the pixels surrounding the frontier and add them to the xtreme frontier
      # then pop frontier back to explored
      frontier_pixels.each do |coord|
        get_surrounding_pixels(coord).each do |c|
          xtremefr_pixels << c
        end
        explored_pixels << coord
      end
      distance = distance - 1

      # Reset the frontier and xtreme frontier
      frontier_pixels = []
      frontier_pixels = xtremefr_pixels
      xtremefr_pixels = []
    end #end_while

    # Put everything in frontier back in explored_pixels
    frontier_pixels.size.times do
      explored_pixels << frontier_pixels.pop
    end

    return explored_pixels.uniq
  end

  # Class methods for help
  def self.random_pixels(height, width)
    pixels = Array.new
    odds = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0]

    (1..height).to_a.each do |row|
      pixels.push Array.new(width){|i| odds.sample}
    end

    pixels
  end

end
