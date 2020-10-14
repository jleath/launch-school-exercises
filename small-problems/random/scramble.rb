# Write a function scramble(str1, str2) that returns true if a portion of str1 characters
# can be rearranged to match str2, otherwise returns false.

# will assume all input is lowercase
# will assume that an empty str1 or an empty str2 will return false
#   but if both are empty, will return true

# initialize a counts hash
# iterate through each of the characters in str2
#   for each character, store the character as the key and the count of that character as a value
# iterate through each of the key/value pairs in the hash
#   if str2 does not contain the number of letters indicated by the value, return false
# return true

def scramble(str1, str2)
  letter_counts = Hash.new(0)
  str2_chars = str2.chars
  str2_chars.each do |char|
    letter_counts[char] += 1
  end

  letter_counts.each do |letter, count|
    return false if str1.count(letter) < count
  end
  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true