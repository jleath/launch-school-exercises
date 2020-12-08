# Write a program that takes a string of digits and gives you all the possible
# consecutive number series of length N in that string.

class Series
  def initialize(digit_string)
    @digits = digit_string.chars.map(&:to_i)
  end

  # Returns an array of subarrays where each subarray should have N items.
  # Let i be the index of each subarray in the result
  # slices[i][j] should equal @digits[i+j]
  # if n < 0, > @digits.size, raise an error
  # if n == 0, return empty array
  def slices(n)
    raise ArgumentError, 'Invalid slice length' unless valid_slice_length?(n)

    (0..@digits.size - n).map { |index| @digits.slice(index, n) }
  end

  private

  def valid_slice_length?(n)
    (0..@digits.size).cover?(n)
  end
end