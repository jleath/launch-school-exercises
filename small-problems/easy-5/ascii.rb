# input: a string
# output: an integer, the sum of the ascii values
# of each of the characters in the input string
#
# empty string will result in 0
# any input other than a string will result in nil
#

def ascii_value(text)
  return nil if !text.is_a?(String)

  text.split('').reduce(0) { |sum, n| sum += n.ord }
end

# potentially better implementation that doesn't require
# splitting the string into an array
def other_ascii_value(text)
  sum = 0
  text.each_char { |c| sum += c.ord }
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0
puts ascii_value(12) == nil
