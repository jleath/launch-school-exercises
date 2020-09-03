# Reverse an array in place, return the same array object

# if n is the number of items in the array,
# swap items 0 and n-1
# swap items 1 and n-2
# ...
# continue until you reach a point where you are trying to swap an item with itself

# num_items = the length of the array
# i = 0
# j = num_items - 1
# while i does not equal j
#   items[i], items[j] = items[j], items[i]
#   i += 1
#   j -= 1

def reverse!(arr)
  i = 0
  j = arr.size - 1
  while i < j
    arr[i], arr[j] = arr[j], arr[i]
    i += 1
    j -= 1
  end
  arr
end

list = [1, 2, 3, 4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w[a b e d c]
puts reverse!(list) == %w[c d e b a]
puts list == %w[c d e b a]

list = ['abc']
puts reverse!(list) == ['abc']
puts list == ['abc']

list = []
puts reverse!(list) == []
puts list == []