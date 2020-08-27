# input: a word or multiple words
# output: the number of characters, excluding spaces

def count_non_spaces(text)
  text.delete(' ').size
end

print "Please write word or multiple words: "
input = gets.chomp

num_chars = count_non_spaces(input)
puts "There are #{num_chars} characters in \"#{input}\"."
