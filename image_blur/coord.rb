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
    @col >= @image.pixels[0].size - 1
  end

  def is_left?
    @col <= 0
  end

  def is_top?
    @row <= 0
  end

  def is_bottom?
    @row >= @image.pixels.size - 1
  end

  def blur_surrounding
    pixels = @image.pixels

    pixels[@row - 1][@col] = 1 unless self.is_top?
    pixels[@row + 1][@col] = 1 unless self.is_bottom?
    pixels[@row][@col - 1] = 1 unless self.is_left?
    pixels[@row][@col + 1] = 1 unless self.is_right?
  end

  def get_surrounding
    coords = Set.new

    coords.add Coord.new(@row - 1, @col, @image) unless self.is_top?
    coords.add Coord.new(@row + 1, @col, @image) unless self.is_bottom?
    coords.add Coord.new(@row, @col - 1, @image) unless self.is_left?
    coords.add Coord.new(@row, @col + 1, @image) unless self.is_right?

    coords
  end

end
