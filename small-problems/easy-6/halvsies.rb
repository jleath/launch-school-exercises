# Given an array, split the array in half and return it as two arrays nested
# within one.

# if the array has an odd number of elements, the middle element should be placed
# in the first half of the array.
# if the array is empty, return two empty nested arrays

def halvsies(arr)
  num_items = arr.size
  split_point = num_items / 2
  split_point += 1 if num_items.odd? 

  first_half = arr.slice(0, split_point)
  second_half = arr.slice(split_point, num_items - split_point)
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]