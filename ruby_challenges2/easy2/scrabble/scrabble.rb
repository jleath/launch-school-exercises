# Create a Scrabble class which takes a string as an argument
# to its constructor.
# The Scrabble class should have an instance method named 'score'
# The score method should computer and return the "scrabble score"
# for the word passed into the Scrabble object's constructor.

# To compute a scrabble score, sum the points awarded for each character
# in the word.

# Characters in the word are awarded points based on the following table.

# A E I O U L N R S T => 1
# D G => 2
# B C M P => 3
# F H V W Y => 4
# K => 5
# J X => 8
# Q Z => 10

# An empty word should result in 0 points.
# whitespace should be ignored entirely and if the input word consists
#  only of whitespace, the score method should return 0
# If a nil is passed in instead of an empty string, the score method should
#  return 0
# The score method should be case insensitive.

# Ignore any characters that are not in the table shown above.

# We will use a hash to map characters to point values. We will have to manually
# construct this, since there is no known logic in the mapping that we could
# programmatically determine.

# Using this hash, we will be able to simply iterate through the characters
# in the string. If the current character is not present as a key in our hash,
# we will ignore it and move to the next one.
# If the current character is present in our hash, we'll retrieve it's point
# value, and then add it to a running sum that we'll initialize to 0 before
# we begin iteration.

# scrabble_sum = 0
# index = 0
# while index < string.size
#   if hash.key?(string[index])
#     scrabble_sum += hash[string[index]]
#   end
#   index += 1
# end
# return scrabble_sum

class Scrabble
  attr_reader :score

  POINT_VALUES = {'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2, 'E' => 1, 'F' => 4,
                  'G' => 2, 'H' => 4, 'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
                  'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3, 'Q' => 10, 'R' => 1,
                  'S' => 1, 'T' => 1, 'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
                  'Y' => 4, 'Z' => 10}

  def self.score(word)
    self.new(word).score
  end

  def initialize(word)
    @word = word
    @score = calc_word_score(word)
  end

  private

  def calc_word_score(word)
    return 0 if word.nil?

    word.chars.reduce(0) do |score, char|
      score + char_points(char.upcase)
    end
  end

  def char_points(char)
    POINT_VALUES.key?(char) ? POINT_VALUES[char] : 0
  end
end