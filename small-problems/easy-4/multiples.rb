# input: an integer
# output: the sum of all multiples of 3 or 5 between 1 and the given number

# assume that the number passed in is greater than 1
def multisum(n)
  return 0 if n < 3

  (1.upto(n).select { |n| n % 3 == 0 || n % 5 == 0 }).reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(1) == 0
puts multisum(2) == 0