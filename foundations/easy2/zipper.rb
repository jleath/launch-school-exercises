def zip(arr1, arr2)
  arr1.map.with_index { |a1, index| [a1, arr2[index]] }
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]