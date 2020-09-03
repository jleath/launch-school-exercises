def find_fibonacci_index_by_length(n)
  minimum = 10 ** (n-1)
  a, b = 1, 1
  i = 1
  while a < minimum
    a, b  = b, a + b
    i += 1
  end
  i
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
