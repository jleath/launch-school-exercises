# Create a method called "power" that takes two integers and returns the value of the first
# argument raised to the power of the second. Return nil if the second argument is negative.

# input: two integers, one representing the base and one for the exponent
# output: a single integer, representing base to the exponentth power

# if the exponent is negative, return nil
# if the exponent is 0, return 1
# handle negatives properly, so odd exponent of a negative base should result in a negative,
#   even exponent results in a positive

# first, check for the negative exponent. In this case, just return nil
# setting a variable result to 1
# while exponent is greater than 1
#   multiply result by the base
#   decrement the exponent
# return result

def power(base, exponent)
  return nil if exponent < 0
  return 1 if exponent == 0
  result = 1

  while exponent > 0
    result *= base
    exponent -= 1
  end

  result
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16