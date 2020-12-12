# Add a to_roman method to the Integer class
# This method will return a string representing that integer's value
# in roman numerical form.

# Will only work for integers between 1 and 3000 (Romans didn't know about 0)
# 1    -> I
# 5    -> V
# 10   -> X
# 50   -> L
# 100  -> C
# 500  -> D
# 1000 -> M
# We will work down from the thousands place, to hundreds, to tens, to ones
# For each decimal place value, we need to determine what symbols to use
# We'll use the tens place as an example
# 10 - 90
# 10 -> X, 20 -> XX, 30 -> XXX, 40 -> XL, 50 -> L, 60 -> LX, 70 -> LXX
# 80 -> LXX, 90 -> XC
# For each decimal place, if our number does not have a corresponding value
# we will just use an empty string
# Example: 98
# No thousands place -> ''
# No hundreds place  -> ''
# Tens place of 9    -> 'XC'
# Ones place of 8    -> 'XCVIII'
class Integer
  THOUSANDS = ['M', 'MM', 'MMM']
  HUNDREDS = ['C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
  TENS = ['X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
  ONES = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']
  NUMERALS = [ONES, TENS, HUNDREDS, THOUSANDS]
  def to_roman
    digits_array = digits
    result_string = ''
    digits_array.each_with_index do |digit, index|
      result_string = NUMERALS[index][digit - 1] + result_string if digit != 0
    end
    result_string
  end
end