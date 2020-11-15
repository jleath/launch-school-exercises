def each_with_index(collection)
  curr_index = 0
  while curr_index < collection.size
    yield(collection[curr_index], curr_index)
    curr_index += 1
  end
  collection
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]