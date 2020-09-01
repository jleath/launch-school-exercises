# input: a string
# output: a new string with all consecutive duplicate characters collapsed into one character

# empty string results in an empty string
# the string may contain any kind of character

# create an empty string to copy characters into
# starting with the first character of the input string
#   if this is the last character in the string
#     copy the character to the end of our new string and we are done
#   if the next character is equal to the current character
#     move to the next character
#   otherwise, if the next character is not equal to the current one
#     copy the current character to the end of our new string and move to the next character
#   repeat until we reach the last character in the string

def crunch(string)
  result = ''
  i = 0
  while i < string.length
    result << string[i] unless string[i] == string[i+1]
    i += 1
  end
  result
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''