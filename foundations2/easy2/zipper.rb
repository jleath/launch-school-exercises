def zip(arr1, arr2)
  num_items = [arr1.size, arr2.size].min
  (0...num_items).to_a.map { |index| [arr1[index], arr2[index]] }
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]