# Given an array of n integers, find the minimum number to be inserted in a list, so that the sum
# of all the elements equal the closest prime number.

# list size is at least 2
# list will only have positive integers
# numbers may be duplicated

# problem: given an array of integers, find the sum and return the difference of the sum
#          and the next largest prime, including the sum itself if applicable

# calculate the sum of the digits in the input array
# find the next prime >= the sum
# return the difference between that prime and the array sum

# prime numbers are divisible only by 1 and itself
# 0 and 1 are not prime numbers

# start from value
# increment value, until value is a prime number
# return that value

def prime?(value)
  divisor = 2
  max_divisor = Math.sqrt(value)
  until divisor >= max_divisor
    return false if value % divisor == 0

    divisor += 1
  end
  divisor
end

def next_prime(value)
  until prime?(value)
    value += 1
  end
  value
end

def minimum_number(arr)
  sum = arr.reduce(:+)
  prime = next_prime(sum)
  prime - sum
end

p minimum_number([3, 1, 2]) == 1  # 6, 7
p minimum_number([5,2]) == 0 # 7 0
p minimum_number([1, 1, 1]) == 0 # 3 0
p minimum_number([2, 12, 8, 4, 6]) == 5 # 5
p minimum_number([50, 39, 49, 6, 17, 28]) == 2
