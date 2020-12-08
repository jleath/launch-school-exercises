# input: an integer, the number for which we would like to find all divisors
# output: an array of all divisors of the input, including 1 and the input itself

# We will assume that input will always be > 0
# Should be able to handle relatively large input in a reasonable amount of time

# We will iterate from 1 to sqrt(n) (inclusive)
# for each value, we will add value and n / value to a results array if n % value == 0
# if we happen to be checking the square root of n, we only want to add value
def divisors(n)
  max_divisor = Math.sqrt(n)
  divisors = []
  1.upto(max_divisor) do |divisor|
    next unless (n % divisor).zero?

    if n / divisor == divisor
      divisors << divisor
    else
      divisors.concat([divisor, n / divisor])
    end
  end
  divisors.sort
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
puts divisors(999962000357) == [1, 999979, 999983, 999962000357]