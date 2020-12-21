class Fibonacci
  def self.nth(n)
    raise ArgumentError if n == 0
    last = 0
    curr = 1
    (1..n).each do |i|
      last, curr = curr, last + curr
    end
    last
  end
end

puts Fibonacci.nth(1)
puts Fibonacci.nth(2)
puts Fibonacci.nth(3)
puts Fibonacci.nth(4)
puts Fibonacci.nth(5)
puts Fibonacci.nth(6)
puts Fibonacci.nth(7)
puts Fibonacci.nth(8)
puts Fibonacci.nth(10001)