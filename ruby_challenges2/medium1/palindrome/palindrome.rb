# write a method that can determine if a given string is a palindrome

# ignore non letters, "no1" and "3on" are palindromes
# case insensitive
# can't use the reverse method
# can't use regex

# edge cases:
#  - empty string 
#  - string with no valid letters
#  - "NoOn"

# will return true if input is an empty string
# a string with no valid letters will be treated as an empty string
# will downcase the input word

def palindrome(word)
  front_index, back_index = 0, word.size - 1
  while front_index < back_index
    while front_index < back_index && !valid_char?(word[front_index])
      front_index += 1
    end
    while back_index > front_index && !valid_char?(word[back_index])
      back_index -= 1
    end
    return false unless equal_chars?(word[front_index], word[back_index])

    front_index, back_index = front_index + 1, back_index - 1
  end
  true
end

def equal_chars?(char1, char2)
  char1.downcase == char2.downcase
end

def valid_char?(char)
  char.downcase.count('a-z') == 1
end

# tests

puts palindrome('nope') == false
puts palindrome('NoPe') == false
puts palindrome('noon') == true
puts palindrome('Noon') == true
puts palindrome('') == true
puts palindrome('1234!!?!') == true
puts palindrome('no1234?o11n') == true
puts palindrome('rotor') == true
puts palindrome('redder') == true
puts palindrome('motor') == false
