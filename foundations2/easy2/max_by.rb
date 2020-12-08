def max_by(collection)
  max_so_far = nil
  max_item = nil
  collection.each do |item|
    value = yield(item)
    if max_so_far.nil? || value > max_so_far
      max_so_far = value
      max_item = item
    end
  end
  max_item
end

puts max_by([1, 5, 3]) { |value| value + 2 puts } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil