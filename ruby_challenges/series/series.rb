# A series of digits. Has one instance method named slices which takes
# an integer named length as an argument. slices returns an array of nested
# arrays, each containing consecutive slices from the digit series.

# The constructor for series takes a string to represent the digits
# The slices method will return a multidimensional array of integers
class Series
  def initialize(digit_string)
    @digit_string = digit_string
  end

  # Return an array containing all possible consecutive sequences of length LENGTH.
  # Elements in the returned array will be integers.
  def slices(length)
    raise ArgumentError, "invalid slice length" if length > @digit_string.size

    first = 0
    last = @digit_string.size - length
    digits = @digit_string.chars.map(&:to_i)

    (first..last).map do |slice_start|
      digits.slice(slice_start, length) 
    end
  end
end