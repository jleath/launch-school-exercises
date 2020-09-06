def leading_substrings(str)
  (1..str.size).map { |i| str[0, i] }
end

def substrings(str)
  (0...str.size).map { |i| leading_substrings(str[i, str.size-i]) }.flatten
end

# Given a string, return a list of all substrings that are palindromes.
# Resulting array should be arranged in the same sequences as the substrings
# appear in the string. Do not remove duplicates.

# A palindrome must consist of at least 2 characters and case matters.
def palindrome?(str)
  str.size > 1 && str.reverse == str
end

def palindromes(str)
  substrings(str).select { |substring| palindrome?(substring) }
end

def alt_palindromes(str)
  str = str.downcase.delete('^a-z0-9')
  palindromes(str)
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

puts alt_palindromes('Kn---ItTing^^^^^^CA=ssE-tteS') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]