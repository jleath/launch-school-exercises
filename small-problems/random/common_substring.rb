# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not 
# We only care about substrings that are longer than one letter.

# input: 2 strings
# ouput: true if there is a common substring between the two input strings,
#        else false

# method should be case insensitive
# substrings to compare should be longer than 1 character
# input strings can contain any type of character, including numbers

# pseudocode
# generate two arrays, one with all of the substrings of at least 2 characters
#   for each of the two input strings
# iterate through the first array of substrings, if any item in this array can be
#   found in the second array, return true
# if we have checked every substring in the first array and found no matching items
#   in the second, return false

# get_substrings
# returns an array of all substrings of length 2 or greater
# all substrings will be lowercase, regardless of the input case

# for each character in str
#   add a substring of length 2 starting from that character to a results array
#   continue adding substrings of increasing length until we reach the end of the string
#   repeat that for each character in the string

def get_substrings(str)
  substrings = []
  (0...str.length).each do |i|
    (i...str.length).each { |j| substrings << str[i..j] }
  end
  substrings
end

def get_subarrays(arr)
  subarrays = []
  (0...arr.length).map do |start|
    (start...arr.length).each { |stop| subarrays << arr[start..stop] }
  end
  subarrays
end

p get_subarrays([]) == []
p get_subarrays([1]) == [[1]]
p get_subarrays([1, 2]) == [[1], [1, 2], [2]]
p get_subarrays([1, 2, 3]) == [[1], [1, 2], [1, 2, 3], [2], [2, 3], [3]]

p get_substrings("") == []
p get_substrings("1") == ["1"]
p get_substrings("12")  == ["1", "12", "2"]
p get_substrings("123") == ["1", "12", "123", "2", "23", "3"]
p get_substrings("1234") == ["1", "12", "123", "1234", "2", "23", "234", "3", "34", "4"]

def substring_test(str1, str2)
  str1.downcase.scan(/../).any? { |substr| str2.downcase.include?(substr) }
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true