# if str has one word, return empty string
# if str has no words, return empty string

def penultimate(str)
  words = str.split
  if words.size < 2
    ''
  else
    words[-2]
  end
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# if str has one word, return that word
# if str has no words, return empty string
# otherwise return the middle word
# if str has an even number of words, return the two middle
# words merged together
def middle(str)
  words = str.split
  num_words = words.size
  if words.empty?
    ''
  elsif num_words.even?
    mid = (num_words / 2) - 1
    words[mid] + ' ' + words[mid + 1]
  else
    mid = num_words / 2
    words[mid]
  end
end

puts middle('these are some basic words') == 'some'
puts middle('') == ''
puts middle('one') == 'one'
puts middle('these are some words') == 'are some'
