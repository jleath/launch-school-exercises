# a 'featured number' is an odd number that is a multiple of 7, whose digits occur
#   exactly once each. ex. 49

# the maximum possible featured number is a ten digit number, once the numbers
# reach eleven digits it is not possible for the number to not have duplicated digits

# Given an integer n, return the smallest featured number that is greater than n.
# Issue an error message if there is no such featured number
def find_next_multiple(n, m)
  loop do
    n = n + 1
    break if n % m == 0
  end
  n
end

def no_dups?(n)
  digits = n.digits
  digits.uniq.size == digits.size
end

def featured(n)
  n = find_next_multiple(n, 7)
  n += 7 if n.even?
  while n < 9876543210
    return n if no_dups?(n)
    n += 14
  end
  "There is no featured number greater than #{n}."
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
featured(9_999_999_999)