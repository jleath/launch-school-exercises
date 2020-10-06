# A pangram is a sentence that contains every single letter of the alphabet at least once.
# For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram,
# because it uses the letters a-z at least once, case is irrelevant.

# given a string, detect whether or not it is a pangram. Return true if it is, false if not
# ignore numbers and punctuation.

# case is insiginificant
# we can ignore numbers and punctuation (including spaces)
# empty strings will return false

# pseudocode
# we'll create an array of all the letters from a-z, in lowercase
# iterate through each of those letters, checking if the input string includes them
# if we find a letter in the alphabet that is not in the string, we'll return false
# if we make it through the whole alphabet we'll return true

def pangram?(string)
  alphabet = ('a'..'z').to_a
  characters = string.downcase.chars
  alphabet.each do |char|
    return false unless characters.include?(char)
  end
  true
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram") == false
p pangram?("") == false