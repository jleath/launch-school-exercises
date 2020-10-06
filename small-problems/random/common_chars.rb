=begin

Given an array of strings made only from lowercase letters, return an array of all
characters that show up in all strings within the given array (including duplicates)
For example, if a character occurs 3 times in all strings but not 4 times, you need
to include that character three times in the final answer.

assume that all array items are valid strings with only lowercase characters

iterate through each string one at a time
  iterate through each character of the current string
    if the current character is present in all the strings
      if the current character is not in the hash
        add the character to the hash with the number of occurrences in the current string as the value
      otherwise
        if the value in the hash associated with the key is lower than the count in this word
          leave the hash alone
        else
          update the hash with the count from the current word
    otherwise, move on to the next character
convert the hash into an array for the result
=end

def common_to_all?(arr, char)
  arr.select { |string| string.chars.include?(char) }.size == arr.size
end

def count_hash_to_a(hash)
  letters = []
  hash.each do |key, value|
    value.times { letters << key }
  end
  letters
end

def common_chars(arr)
  letter_counts = {}
  arr.each do |word|
    word.each_char do |curr_char|
      next unless common_to_all?(arr, curr_char)

      curr_count = word.count(curr_char)
      if !letter_counts.has_key?(curr_char) || letter_counts[curr_char] > curr_count
        letter_counts[curr_char] = curr_count
      end
    end
  end
  count_hash_to_a(letter_counts)
end

p common_chars(["bella", "label", "roller"])  == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
