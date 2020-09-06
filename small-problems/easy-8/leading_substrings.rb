# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be
# arranged in order from shortest to longest substring.

# empty string input should return an empty array

# if the input string's length is n, the resulting array will have n items
# the first item will be the first character in the input string,
#   for each item with index > 0, the value will be 
#   result[index-1] + str[index]

def leading_substrings(str)
  result = []
  index = 0
  loop do
    break if index >= str.size

    if index == 0
      result << str[0]
    else
      result << (result[index-1] + str[index])
    end
    index += 1
  end
  result
end

def leading_substrings(str)
  (1..str.size).map { |i| str[0, i] }
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']