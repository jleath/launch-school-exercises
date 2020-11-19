# Write a program that, given a number, can find the sum of all the multiples 
# of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are 
# multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum 
# of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of 
# numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  DEFAULT_VALUES = [3, 5]

  def initialize(*values)
    @values  = values
  end

  def self.to(n)
    self.new(*DEFAULT_VALUES).to(n)
  end

  def to(n)
    smallest_dividend = @values.min
    return 0 if smallest_dividend >= n

    (smallest_dividend...n).reduce do |memo, dividend|
      if @values.any? { |divisor| (dividend % divisor).zero? }
        memo + dividend
      else
        memo
      end
    end
  end
end