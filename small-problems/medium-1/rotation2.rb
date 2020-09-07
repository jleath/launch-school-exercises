# Write a method that can rotate the last n digits of a number.
# Rotating just 1 digit results in the original number being returned

# Assume that n will always be a positive integer.
# n could potentially be larger than the size of the array, if so
#   rotate the last n % arr.size digits

# set n to n % arr.size
# convert the integer into an array
# split the array into two parts, the left part which will not be rotated
#   and the right part which will be rotated, the right part will have n items
#   the left one will have arr.size - n items
# rotate the right array and then merge the two arrays back together
# convert the array back to an integer and return

def rotate_rightmost_digits(i, n)
  digits = i.to_s.chars
  left_part = digits[0, digits.size-n]
  right_part = digits[digits.size-n, n]
  rotated = rotate_array(right_part)
  (left_part + rotated).join.to_i
end

def rotate_rightmost_digits(i, n)
  digits = i.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

def rotate_array(arr)
  arr[1, arr.size-1] << arr[0]
end

def rotate_string(str)
  rotate_array(str.split('')).join('')
end

def rotate_integer(i)
  rotate_string(i.to_s).to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917