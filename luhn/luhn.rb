class Luhn

  attr_reader :num

  def initialize(number = nil)
    if number.nil?
      @num = Luhn.rand_card_num
    elsif number.to_s.size != 16
      puts "Invalid number. A random number was generated for you."
      @num = Luhn.rand_card_num
    else
      @num = number
    end
  end

  def validate

  end

  def self.rand_card_num
    num = ""
    1.upto(16) do |i|
      add = rand(10)
      redo if i == 1 && add == 0
      num = num + add.to_s
    end

    num.to_i
  end

  # private

  def separate_digits
    return @num.to_s.chars.map {|char| char.to_i}
  end

end

# Execute stuff

l = Luhn.new

puts l.separate_digits.inspect
