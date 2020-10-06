# Your goal in this kata is to implement a difference function, which subtracts
# one list from another and returns the result.

# It should remove all values from list a, which are present in list b.

# If a value is present in b, all of its occurrences must be removed from a

# implement a method that removes all elements in a that are also present in b
# return a if b is an empty
# return an empty array if happens to be empty

# iterate through all the elements of b
# for each element in b, we will remove all occurences of that item from a

def array_diff(a, b)
  b.each do |item|
    a.delete(item)
  end
  a
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []