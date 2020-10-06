# an egyption fraction is the sum of a series of distinct unit fractions.

def egyptian(rat)
  denom = 1
  temp_sum = Rational(0, 1)
  egyptian_denoms = []
  while temp_sum != rat
    if temp_sum + Rational(1, denom) <= rat
      egyptian_denoms << denom
      temp_sum += Rational(1, denom)
    end
    denom += 1
  end
  egyptian_denoms
end

# given a sequence of integers representing denominators in an egyptian fraction,
# return the rational number represented by the array

# initialize a sum starting at 0
# for each integer in the input array
#   add (1/n) to the sum where n is the integer in the array
# return sum.to_r

def unegyptian(denominators)
  sum = Rational(0, 1)
  denominators.each { |denom| sum += Rational(1, denom) }
  sum
end

p egyptian(Rational(2, 1)) == [1, 2, 3, 6]
p egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)