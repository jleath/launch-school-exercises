# Luhn Class
# A Constructor that takes a positive integer value of arbitrary size
# An addends instance method which returns an array of results of the transformation
#  of each digit of the value in the first step of the luhn algorithm
# A checksum instance method that returns the checksum, the sum of the values in
#  the array returned by addends
# A valid? instance method which returns true if the number passed into the
#  constructor was a valid number according to the luhn algorithm, false
#  otherwise
# A create class method, which can take an integer value as an argument and 
#  return that same number with a check digit that will make the whole
#  number valid per the luhn algorithm.
class Luhn
  attr_reader :addends, :checksum

  def initialize(value)
    @addends = build_addends(value)
    @checksum = addends.sum
  end

  # First pass, should work given the mechanisms we plan to have for the class
  # but we need to double check
  def self.create(value)
    checksum = Luhn.new(value * 10).checksum
    (checksum % 10).zero? ? value * 10 : value * 10 + (10 - (checksum % 10))
  end

  def valid?
    checksum % 10 == 0
  end

  private

  # return a list of the digits in value transformed according to the first
  # step of the luhn algorithm.
  # ex: 12121 -> [1, 4, 1, 4, 1]
  # ex: 8631  -> [7, 6, 6, 1]
  def build_addends(value)
    addends = []
    digits_processed = 0
    until value.zero?
      addends.prepend((digits_processed.odd? ? luhn_double(value % 10) : value % 10))
      value = value / 10
      digits_processed += 1
    end
    addends
  end

  def luhn_double(digit)
    digit >= 5 ? (digit * 2) - 9 : digit * 2
  end
end