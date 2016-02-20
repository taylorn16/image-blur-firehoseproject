def unique(integers)
  uniques = []

  if ! integers.empty?
    while integers.size > 0
      uniques << integers.shift

      integers.select! {|i| i != uniques.last}
    end
  end

  uniques
end

sample = [1, 2, 3, 3, 2, 1, -2, -2, 4]

puts unique(sample)
