def pairs(arr)
  pairs = []
  index = 0
  count = 0
  while index < arr.size
    pairs << arr.slice(index, 2)
    index += 2
  end
  p pairs
  pairs.each do |pair|
    if pairs.size > 1
      count += 1 if (pair[0] - pair[1]).abs == 1
    end
  end
  count
end

pairs([1, 2, 5, 8, -4, 3, 7, 6, 5])