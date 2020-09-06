# A double number is a number with an even number of digits whose left-side 
# digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 
# 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, 
# unless the argument is a double number; double numbers should be returned as-is.

# n is a double number if it has an even number of digits, and the left digits are
# exactly the same as the right.
def double_number?(n)
  n_str = n.to_s
  return false if n_str.size.odd?

  mid = n_str.size / 2
  left_side = n_str[0, mid]
  right_side = n_str[mid, mid]
  left_side == right_side
end

# use a helper method to determine if n is a double number
# if it is, return n
# if it is not, return n * 2
def twice(n)
  double_number?(n) ? n : n * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10