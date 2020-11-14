def compute(value)
  block_given? ? yield(value) : "Does not compute."
end

puts compute(5) { |val| val + 3 } == 8
puts compute('a') { |val| val + 'b' } == 'ab'
puts compute("bad") == 'Does not compute.'