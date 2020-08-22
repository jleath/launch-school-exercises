def is_odd?(n)
  # the code below works whether % is a modulo or remainder operator
  n.abs % 2 != 0
end

puts "All the following tests should output true"
puts !is_odd?(0)
puts is_odd?(1)
puts is_odd?(-1)
puts !is_odd?(-2)
puts !is_odd?(2)
