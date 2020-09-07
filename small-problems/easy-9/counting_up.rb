def sequence(n, count_up=true)
  result = []
  if n > 0
    result = 1.upto(n).to_a
  elsif n < 0
    result = n.upto(-1).to_a
  end
  count_up ? result : result.reverse
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]

puts sequence(-5) == [-5, -4, -3, -2, -1]
puts sequence(-3) == [-3, -2, -1]
puts sequence(-1) == [-1]

puts sequence(0) == []

puts sequence(5, false) == [5, 4, 3, 2, 1]
puts sequence(3, false) == [3, 2, 1]
puts sequence(1, false) == [1]

puts sequence(-5, false) == [-1, -2, -3, -4, -5]
puts sequence(-3, false) == [-1, -2, -3]
puts sequence(-1, false) == [-1]