# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these 
# has a length of 2. Given a lowercase string that has alphabetic characters only 
# (both vowels and consonants) and no spaces, return the length of the longest 
# vowel substring. Vowels are any of aeiou.

# input: a string
# ouput: the length of longest contiguous substring containing only letters in aeiou

# all the letters in the string will be lowercase
# the string will have no spaces, punctuation or other nonalphabetic characters
# the substrings to inspect should be contiguous

# find all the substrings that contain only vowels

# compare the lengths of those substrings, and return the length of the longest

# get all the substrings of the input string
# filter out any substrings that have any characters other than vowels
# iterate through the remaining substrings, return the length of the longest

def get_substrings(str)
  substrings = []
  start_index = 0
  loop do
    break if start_index >= str.size

    end_index = start_index
    loop do
      break if end_index >= str.size

      substrings << str.slice(start_index..end_index)
      end_index += 1
    end
    start_index += 1
  end
  substrings
end

=begin
p get_substrings("") == []
p get_substrings("1") == ["1"]
p get_substrings("12") == ["1", "12", "2"]
p get_substrings("123") == ["1", "12", "123", "2", "23", "3"]
=end

# removing substrings with consonants
# iterate through each of the substrings in the array
#   if the substring has any characters that are not in 'aeiou', discard that substring
#   otherwise, keep the substring

def has_consonant(str)
  chars = str.chars
  vowels = 'aeiou'
  chars.each do |char|
    return true unless vowels.include?(char.downcase)
  end
  false
end

=begin
p has_consonant("") == false
p has_consonant("a") == false
p has_consonant("aeiou") == false
p has_consonant("aeioup") == true
p has_consonant("p") == true
=end

def is_vowel?(c)
  'aeiou'.include?(c.downcase)
end

def get_vowel_substrings(str)
  substrings = []
  curr_len = 0
  str.chars.each do |char|
    if is_vowel?(char)
      curr_len += 1
    elsif curr_len > 0
      substrings << curr_len
      curr_len = 0
    end
  end
  if curr_len > 0
    substrings << curr_len
  end
  substrings
end

def solve(str)
  substrings = get_vowel_substrings(str)
  substrings.max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8