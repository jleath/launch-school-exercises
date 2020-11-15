def map(container)
  result = []
  container.each { |val| result << (block_given? ? yield(val) : val) }
  result
end

puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
puts map([]) { |value| true } == []
puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

test = { "one" => 1, "two" => 2, "three" => 3 }
p map(test) { |key, value| key == "two" ? "dos" : value }
