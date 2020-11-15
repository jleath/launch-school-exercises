def drop_while(collection)
  curr_index = 0
  result = []
  while curr_index < collection.size && yield(collection[curr_index])
    curr_index += 1
  end

  while curr_index < collection.size
    result << collection[curr_index]
    curr_index += 1
  end
  result
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []