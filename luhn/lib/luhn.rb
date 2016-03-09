module Luhn
  def self.is_valid?(number)
    number = digits_to_arr(number)
    number = double_every_second(number)
    number = reduce_digits(number)

    (sum_digits(number) % 10) == 0
  end

  def self.digits_to_arr(number)
    number.to_s.chars.map {|i| i.to_i}
  end

  def self.double_every_second(num_arr)
    i = num_arr.size - 2
    while i >= 0 do
      num_arr[i] = num_arr[i] * 2
      i = i - 2
    end

    num_arr
  end

  def self.reduce_digits(num_arr)
    num_arr.map do |i|
      i = (i >= 10 ? i - 9 : i)
    end
  end

  def self.sum_digits(num_arr)
    num_arr.reduce(:+)
  end
end

# Execute stuff
puts Luhn.is_valid? 4194560385008505
