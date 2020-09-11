BLOCKS = { 'b' => 'o', 'x' => 'k', 'd' => 'q', 'c' => 'p', 'n' => 'a',
           'g' => 't', 'r' => 'e', 'f' => 's', 'j' => 'w', 'h' => 'u',
           'v' => 'i', 'l' => 'y', 'z' => 'm' }

# initialize empty array to track unavailable letters
# for each letter in word
#   if the letter is not in the array of unavailable letters, check in the hash 
#    to get it's partner and store both letters in the unavailable array
#   otherwise, return false
# if the loop completes without returning false, return true
def block_word?(word)
  unavailable = []
  word.each_char do |letter|
    letter = letter.downcase
    return false if unavailable.include?(letter)

    BLOCKS.each do |c1, c2|
      if [c1, c2].include?(letter)
        unavailable += [c1, c2]
      end
    end
  end
  true
end

def block_word_alt?(word)
  blocks = %w(bo xk dq cp na gt re fs jw hu vi ly zm).freeze

  string = string.downcase
  blocks.none? { |block| string.count(block) >= 2 }
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true