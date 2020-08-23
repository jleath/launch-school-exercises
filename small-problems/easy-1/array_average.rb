def average(arr)
  return arr.reduce(0.0, :+) / arr.size
end

def close(x, y, threshold=0.0001)
  (x-y).abs < threshold 
end

puts close(average([1, 6]), 3.5)
puts close(average([1, 5, 87, 45, 8, 8]), 25.6666)
puts close(average([9, 47, 23, 95, 16, 52]), 40.3333)
