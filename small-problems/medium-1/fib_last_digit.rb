
def fibonacci(n)
  last, curr = 0, 1
  1.upto(n-1) do |i|
    last, curr = curr, last + curr
  end
  curr
end

def fibonacci_last(n)
    fibonacci(n) % 10
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts FIB_RESULTS.size
puts fibonacci_last(123456789) # -> 4