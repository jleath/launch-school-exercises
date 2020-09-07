# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.

# if given an empty array, return a new empty array.

# for an input array with n items, copy items at index 1 through n-1 into a
# new array. Then append the item at index 0 of the original array to the end
# of the new array.

def rotate_array(arr)
  arr[1, arr.size-1] << arr[0]
end

def rotate_string(str)
  rotate_array(str.split('')).join('')
end

def rotate_integer(i)
  rotate_string(i.to_s).to_i
end

puts rotate_integer(12) == 21
puts rotate_integer(0) == 0
puts rotate_integer(1200) == 2001
puts rotate_integer(123456) == 234561

puts rotate_string('this is a test') == 'his is a testt'
puts rotate_string('a') == 'a'

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true