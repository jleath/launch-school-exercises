def fibonacci(n)
  last, curr = 0, 1
  1.upto(n-1) { last, curr = curr, last + curr }
  curr
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
fibonacci(100_001)