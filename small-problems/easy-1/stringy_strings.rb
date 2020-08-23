# input: a positive integer, n
# output: a string of n characters, consisting of  alternating 
#         1s and 0s, starting with 1.
# rules: if n is 0, the resulting string will be an empty string
# model: initialize an empty string
#        initialize an integer to 1
#        do the following n times:
#          add the integer to the string
#          update the integer based on it's current value (1->0, 0->1)
#        return the string

def stringy(n, start=1)
  result = ''
  curr = start
  n.times do
    result << curr.to_s
    curr = (curr == 0) ? 1 : 0
  end
  return result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(0) == ''
puts stringy(6, 0) == '010101'
