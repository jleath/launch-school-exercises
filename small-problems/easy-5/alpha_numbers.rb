# input: an array of integers between 0 and 19
# output: an array of integers sorted based on the english words for each
#         number

# rules: if the input array is empty, output an empty array
#        the ordering of the numbers will be based on the lexicographical
#        ordering of the english words for each number

# for each item in the array
#   add the english word for that number to a new array
# sort the english word array
# for each word in the english word array
#   lookup the number that corresponds to that word
#   append that number to a new array

# (or just use fancy ruby magic which I'll also do in another method)

NUMBER_NAMES = [
  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight',
  'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen',
  'sixteen', 'seventeen', 'eighteen', 'nineteen'
]

def english_word_for(number)
  NUMBER_NAMES[number]
end

def to_english(numbers)
  numbers.map { |n| english_word_for(n) }
end

def to_number(english)
  english.map { |e| NUMBER_NAMES.find_index(e) }
end

def alphabetic_number_sort(numbers)
  english = to_english(numbers)
  english.sort!
  to_number(english)
end

def smart_alphabetic_number_sort(numbers)
  numbers.sort { |n1, n2| english_word_for(n1) <=> english_word_for(n2) }
end

puts smart_alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0
]