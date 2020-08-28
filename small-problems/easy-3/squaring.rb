def multiply(a, b)
  a * b
end

def power(a, n)
  result = 1
  n.times do
    result = multiply(a, result)
  end
  result
end

def square(n)
  power(n, 2)
end

puts square(5) == 25
puts square(-8) == 64
