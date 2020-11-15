def count(*args)
  args.inject(0) { |num_true, value| (yield(value) ? num_true + 1 : num_true) }
end

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3