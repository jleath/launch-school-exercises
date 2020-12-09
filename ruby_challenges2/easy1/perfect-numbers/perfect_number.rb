# A perfect number equals the sum of its positive divisors
# An abundant number is greater than the sum of its positive divisors
# A deficient number is less than the sum of its positive divisors

# Raise an error upon calling classify if the number is negative
class PerfectNumber
  def self.classify(n)
    raise ArgumentError, 'Invalid argument to classify' unless n >= 0
    divisor_sum = divisors(n).sum 
    if divisor_sum == n
      'perfect'
    elsif divisor_sum < n
      'deficient'
    else
      'abundant'
    end
  end

  private

  def self.divisors(n)
    (1...n).to_a.select { |value| (n % value).zero? }
  end
end