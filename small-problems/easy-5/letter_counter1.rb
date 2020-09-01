# input: a string of one or more space separated words
# output: a hash mapping { word length -> number of words }

# words consist of any character
# space characters are not part of any word
# string will not be empty

def word_sizes(string)
  word_counts = Hash.new(0)
  words = string.split(' ').each do |word|
    word_counts[word.length] += 1
  end
  word_counts
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')