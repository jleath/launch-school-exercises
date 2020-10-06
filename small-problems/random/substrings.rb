# Given a non-empty string check if it can be constructed by taking a substring
# of it and appending multiple copies of the substring together. You may assume
# the given string consists of lowercase English letters only.

# the string will have at least one character
# the string will only have lowercase letters
# should return true if a substring of any length can be used to form the whole

# starting with the first character
#  create a temporary string variable that is of equal length to the input
#    by appending copies of the current character together
#  if the temporary string variable is equal to the input string, return true
#  otherwise, repeat from step 2, using the first two characters instead of the
#    first alone.
#  Repeat this process, using longer substrings until the substring length is
#   equal to the input string's length. If this happens, return false.

def repeated_substring_pattern(str)
  (1...str.length).each do |substring_len|
    repeated_substring = str.slice(0, substring_len) * (str.length / substring_len)
    return true if str == repeated_substring
  end
  false
end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
p repeated_substring_pattern("aaaaaaaaaa") == true