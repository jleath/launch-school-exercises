# Given a string of integers, return the number of odd-numbered substrings
# that can be formed.

# assume all characters in the string are valid integers
# empty string should result in 0

# create an array of substrings of the original string
# for each item in the substring array, get the sum of the integers
#   if the resulting sum is odd, increment the odd count
# return the odd count

# for each character in s
#   extract a substring of length 1, starting from the current character
#   repeat, incrementing the substring length, until there are no characters left

def substrings(s)
  substrings = []
  s.size.times do |start_index|
    (start_index...s.size).each do |end_index|
      substrings << s[start_index..end_index]
    end
  end
  substrings
end

def solve(s)
  substrings(s).map(&:to_i).select(&:odd?).size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28