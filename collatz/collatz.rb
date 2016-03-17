def collatz n
  sequence = [n]
  until n == 1 do
    n = (n.even? ? n / 2 : 3*n + 1)
    sequence.push n
  end
  sequence
end

def longest_collatz llimit, ulimit
  max_sequence = [0, 0]         # [sequence_size, argument]
  (llimit..ulimit).each do |i|
    next_sequence_size = collatz(i).size
    if next_sequence_size > max_sequence[0]
      max_sequence = [next_sequence_size, i]
    end
  end

  puts "Max Sequence Size: #{max_sequence[0]}"
  puts "Argument: #{max_sequence[1]}"

  max_sequence
end

# Execute

longest_collatz(1, 1_000_000)
