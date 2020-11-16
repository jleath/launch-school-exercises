def max_by(collection)
  largest_so_far = nil
  max_value = nil
  collection.each do |value|
    block_result = yield(value)
    if largest_so_far.nil? || block_result > largest_so_far
      largest_so_far = block_result
      max_value = value
    end
  end
  max_value
end

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil