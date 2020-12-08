# Given an arbitrary number of arguments, return the number of arguments
# for which the given block returns a true value.
def count(*arr)
  arr.inject(0) { |num_true, value| yield(value) ? num_true + 1 : num_true }
end

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3