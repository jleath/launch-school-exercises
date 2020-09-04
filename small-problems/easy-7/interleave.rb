# Given two arrays, return a new array that contains all elements from both
# arrays, with the elements taken in alternation.

# Assume that both input arrays are non-empty
# Assume that both input arrays have the same number of elements

# create a new array
# starting with the first item in arr1, add the item to the new array and move to the next item
# switch to the first item in arr2, add the item to the new array and move to the next item
# Repeat the previous 2 steps, alternating between the two arrays until they you have
#   iterated through each item

def interleave(arr1, arr2)
  result = []
  num_items = arr1.sizrbe
  i = 0
  loop do
    break if i >= num_items
    result << arr1[i]
    result << arr2[i]
    i += 1
  end
  result
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

puts interleave([1, 2, 3,], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']