# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# There are tests with strings up to 10 000 characters long so your code will need to be efficient.
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

# given a string as input, return the longest sequence of letters that are in alphabetical order
# all strings will be lowercase and will only include alphabetical characters
# each string will be at least one character long

# initialize a curr_substring variable that we'll use to track the alphabetical substrings
# initialize a longest_substring variable that we'll use to remember the longest substring
# iterate through the string one character at a time
# for each character
#   if the character is the first character in the string, assign the curr_substring variable to that character
#   if the current character follows the previous character in alphabetical order, add it to the substring variable
#   if the curr_substring variable is longer than the longest_so_far substring
#     update the longest_so_far substring to point to the curr_substring
#   else, replace the curr_substring variable with the current character
# once we reach the end of the string, we need to check if the curr_substring is longer than the longest_so_far
# return longest_so_far 

def longest(str)
  curr_substring = ''
  longest_substring = ''
  index = 0
  while index < str.length
    if index == 0
      curr_substring = str[index]
    elsif str[index] >= str[index-1]
      curr_substring = curr_substring + str[index]
    else 
      if curr_substring.length > longest_substring.length
        longest_substring = curr_substring
      end
      curr_substring = str[index]
    end
    index += 1
  end
  if curr_substring.length > longest_substring.length
    longest_substring = curr_substring
  end
  longest_substring
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'