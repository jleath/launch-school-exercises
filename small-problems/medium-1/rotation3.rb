require 'pry'
require 'pry-byebug'
# Input: an integer
# Output: an integer, the maximum rotation of the input

# The maximum rotation is found by rotating each digit, starting
# with the most significant, one at a time
# If, during rotation, the number has a leading zero, that zero will be dropped
# as shown in the example max_rotation(105) == 15

def max_rotation(n)
  digits = n.to_s.chars
  num_digits = digits.size
  num_digits.downto(2).each do |i|
    digits = rotate_rightmost_digits(digits, i)
  end
  digits.join.to_i
end

def rotate_rightmost_digits(digits, n)
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits
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

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(10025) == 2150