# Consider a character set consisting of letters, a space, and a point. 
# Words consist of one or more, but at most 20 letters.
# An input text consists of one or more words separated from each other by one
# or more spaces and terminated by 0 or more spaces followed by a point.
# Input should be read from, and including, the first letter of the first word
# up to and including the terminating point.
# The output text is to be produced such that successive words are separated by
# a single space with the last word being terminated by a single point.
# Odd words are copied in reverse order while even words are merele echoed.
# For example, the input string:

# "whats the matter with kansas." becomes "whats eht matter htiw kansas."

# BONUS POINTS: the characters must be read and printed one at a time.

# Input will be a string. This string will consist of white-space separated
# words, no more than 20 characters long. The input string will be terminated
# by a point, which may or may not be separated from the last word of the input
# by whitespace.

# Output will be a string, containing the text of the input string. Every other
# word (starting with the 2nd word, i.e. odd indices) should have it's letters 
# reversed.

# Our example doesn't show anything about capitalization or punctuation. So we
# will assume that all punctuation besides '.' should not be treated any differently
# from other characters. For example, "You're" reversed would be "er'uoY"
# We also won't worry about numerical characters. "123" reversed would be "321".

# Example run:

# these are some words.
# [these, are, some, words.]
# [these, are, some, words]
# [0, 1, 2, 3]
# [these, era, some, sdrow]
# these era some sdrow.

# def odd_word_reversed(str)
#   str.gsub('.', '')
#      .split
#      .each_with_index
#      .map { |word, index| index.odd? ? word.reverse : word }
#      .join(' ') + '.'
# end

def skip_whitespace(chars)
  while chars.first.match(/\s/)
    chars.unshift
  end
end

def extract_word(chars, reversed)
  result = ''
  if reversed
    index = 0
    until chars[index].match(/(\s|\.)/)
      index += 1
    end
    index -= 1
    while index >= 0
      result += chars.pop(index)
      index -= 1
    end
  else
    until chars.first.match(/\s/)
      result += chars.pop(0)
    end
  end
  result
end

def odd_word_reversed(str)
  index = 0
  result = ''
  words_extracted = 0
  chars = str.chars
  until chars.empty?
    index = skip_whitespace(chars)
    break if chars.first == '.'

    result += extract_word(chars, words_extracted.odd?)
    words_extracted += 1
  end
  result + '.'
end
