def leading_substrings(str)
  (1..str.size).map { |i| str[0, i] }
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# Given an input string, return an array containing all substrings.
# The substrings should be ordered based on their starting position within
# the original string and then their length (shortest to longest).

# an empty string should return an empty array
# if the input string has n characters, the resulting array will have 
#  ((n / 2) * (1 + n)) strings.

# initialize an empty results array
# pass the original string into the leading_substrings method
# add the items from the resulting array into the results array
# remove the first character from the input string and repeat until the
#  input string is empty
def substrings(str)
  (0...str.size).map { |i| leading_substrings(str[i, str.size-i]) }.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts substrings('') == []
puts substrings('a') == ['a']
puts substrings('yup') == ['y', 'yu', 'yup', 'u', 'up', 'p']