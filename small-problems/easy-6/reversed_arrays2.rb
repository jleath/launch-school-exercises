# Given an array, return a new array that is the reverse of the original

# initialize a new array
# starting from the last element of the original array
#   push the item onto the end of the new array
# continue for each item in the array
=begin
def reverse(arr)
  reversed_arr = []
  i = arr.size - 1
  loop do
    break if i < 0
    reversed_arr << arr[i]
    i -= 1
  end
  reversed_arr
end
=end

def reverse(arr)
  arr.inject([]) { |new_arr, i| new_arr.prepend(i) }
end

puts reverse([1,2,3,4]) == [4,3,2,1]
puts reverse(%w(a b e d c)) == %w(c d e b a)
puts reverse(['abc']) == ['abc']
puts reverse([]) == []

list = [1, 3, 2]
new_list = reverse(list)
puts list.object_id != new_list.object_id
puts list == [1, 3, 2]
puts new_list == [2, 3, 1]