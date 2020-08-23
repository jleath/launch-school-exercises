# input: a string 
# output: a new string with the words reversed
# rules: words are delimited by whitespace
#        will return an empty string if an empty string is passed in
# model: split the words into an array
#        reverse the array
#        join the words in the array into a single string

def reverse_sentence(text)
  text.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
