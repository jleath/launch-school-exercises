# Write a function, persistence, that takes in a positive number num and 
# returns its multiplicative persistence, which is the number of times
# you must multiply the digits in num until you reach a single digit

# num is going to be a positive number
# test cases indicate that this number will be an integer
# need to return the number of times the digits of the number must
# be multiplied together until we reach a single digit

# repeatedly multiply the digits together, storing the result back in num
#  until num is a single digit integer

# until num is < 10
#   convert num into an array of integers by its digits
#   assign num to the product of those digits
#   increment a counter each time we multiply the digits

# SET counter = 0
# WHILE num >= 10
#   SET num = num.digits.reduce(:*)
#   SET counter = counter + 1
# RETURN counter

def persistence(num)
  counter = 0
  while num >= 10
    num = num.digits.reduce(:*)
    counter += 1
  end
  counter
end

p persistence(39) == 3  # 3 * 9 = 27 2 * 7 = 14 1 * 4 = 4
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4