# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero' through 'nine' converted
# to a series of digits.

# will assume that the method should be case sensitive. ex. 'Nine'->'9' and 'nine'->'9'
# will assume that words are separated by whitespace
# will mutate the original string
DIGITS = %w[zero one two three four five six seven eight nine]

def word_to_digit(str)
  DIGITS.each_with_index { |word, index| str.gsub!(/\b#{word}\b/i, index.to_s) }
  str
end

puts word_to_digit('Please call me at five five five one two ThrEe four. Thanks.')  == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts word_to_digit('The number of the freight container is seven eight nine zero.') == 'The number of the freight container is 7 8 9 0.'