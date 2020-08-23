# input: a string containing one or more words
# output: the given string with words that contain 5 or more characters
#         reversed
# rules: input string will only consist of letters and spaces
#        spaces should be included only when more than one word is
#        present
#        an empty input string will result in an empty output string
# model: split the input word on whitespace into an array
#        for each word in the array, reverse the word if it has
#        more than 5 characters
#        join the items of the array into a single string

def reverse_words(text)
  words = text.split
  i = 0
  loop do
    words[i].reverse! if words[i].length >= 5
    i += 1
    break if i == words.size
  end
  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
