# Find the length of the longest substring in the given string that is the same
# in reverse.

# a palindrome can be 1 character long
# empty string will result in 0
# The palindrome can occur anywhere in the string
# contiguous duplicated letters can count as a palindrome

# find all substrings in the input string that are palindromes
# return the length of the longest

# for each integer i between 0 and str.length exclusive
#   for each integer j between i and str.length exclusive
#     extract a substring from str, starting at index i and ending at index j inclusive

def get_substrings(str)
  substrings = []
  (0...str.length).each do |start_index|
    (start_index...str.length).each do |end_index|
      substrings << str[start_index..end_index]
    end
  end
  substrings
end

=begin
p get_substrings("a") == ["a"]
p get_substrings("ab") == ["a", "ab", "b"]
p get_substrings("abc") == ["a", "ab", "abc", "b", "bc", "c"]
=end

def palindrome?(str)
  str.reverse == str
end

def longest_palindrome(str)
  return 0 if str.empty?
  substrings = get_substrings(str)
  palindromes = substrings.select { |substr| palindrome?(substr) }
  lengths = palindromes.map { |str| str.length }
  lengths.max
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome("") == 0
p longest_palindrome("I like racecars that go fast") == 7