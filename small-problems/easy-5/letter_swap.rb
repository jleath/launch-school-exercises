# input: a string of words separated by spaces

# output: a string in which the first and last letters of
#         every word are swapped

# Assume that every word contains at least one letter
# Assume that the string will always contain at least one word
# Assume that each string contains nothing but words and spaces

# Will not mutate the input
def swap_first_last(word)
  return word if word.size <= 1

  first_letter = word.slice(0)
  last_letter = word.slice(-1)
  last_letter + word.slice(1..-2) + first_letter
end

def swap(words)
  swapped = words.split(' ').map { |word| swap_first_last(word) }
  swapped.join(' ')
end

# Test Cases
puts swap('Oh what a wonderful day it is') # 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') # 'ebcdA'
puts swap('a') # 'a'

