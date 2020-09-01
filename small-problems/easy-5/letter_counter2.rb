# input: a string of one or more space separated words
# output: a hash mapping { word length -> number of words }

# words consist of any character
# space characters are not part of any word
# string will not be empty

def word_sizes(string)
  word_counts = Hash.new(0)
  words = string.split(' ').each do |word|
    word = word.delete('^A-Za-z')
    word_counts[word.size] += 1
  end
  word_counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}