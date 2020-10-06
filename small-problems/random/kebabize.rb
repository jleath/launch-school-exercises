# Modify the kebabize function so that it converts a camel case string into a kebab case.

# kebab case is when the words are separated by dashes
# all punctuation, whitespace, and other non-alphabetic characters should be removed
# empty string should result in an empty string
# Assume that all inputs are valid camel case
# output should be in all lowercase characters

# split the string into words based on camel case rules

# convert all "words" into lowercase
# join the words together using the '-' character as a separator

def split_camel_case(str)
  start_index = 0
  words = []
  loop do
    break if start_index >= str.size

    end_index = 0
    loop do
      break if end_index >= str.size

      if str[end_index].count('A-Z') > 0
        words << str.slice(start_index...end_index)
        start_index = end_index
      end
      end_index += 1
    end
    if end_index == str.size
      words << str.slice(start_index...end_index)
    end
    start_index += 1
  end
  words
end

p split_camel_case('myCamelCasedString') == ['my', 'Camel', 'Cased', 'String']

def remove_nonalphabetic(str)
  str
end

def kebabize(str)
  words = split_camel_case(str)
  words = remove_nonalphabetic(str)
  # words.map { |word| word.downcase }.join('-')
end

p kebabize('camelsHaveThreeHumps')
p kebabize('camelsHave3Humps')