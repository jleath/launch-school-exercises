# frozen_string_literal: true

# The PhoneNumber class takes a user entered phone number string as an
# argument to its constructor
# The class should have an instance method named `number` that returns
# the same phone number in an appropriate format
# The class should also have an instance method named 'area_code' that
# returns the 3 digit area code from the number.
# The class should finally have a `to_s` instance method that simply
# returns the cleaned up phone number string.

# An invalid phone number should have a string of 10 zeros as the value
# for @number. and a string of 3 zeros as the value for @area_code
# Phone number must have at least 10 digits
class PhoneNumber
  attr_reader :number

  AREA_CODE_DIGITS = 3
  INVALID_STRING = '0000000000'
  def initialize(number_str)
    @number = process_number(number_str)
  end

  def area_code
    @number[0, 3]
  end

  def exchange
    @number[3, 3]
  end

  def line
    @number[6, 4]
  end

  def to_s
    "(#{area_code}) #{exchange}-#{line}"
  end

  private

  def process_number(number_str)
    number_str = number_str.gsub(/(\s|[-().])/, '')
    return INVALID_STRING unless valid_phone_number?(number_str)

    number_str.size == 11 ? number_str.slice(1, 10) : number_str
  end

  def valid_phone_number?(str)
    all_digits?(str) && valid_length?(str)
  end

  def all_digits?(str)
    str.count('^0-9').zero?
  end

  def valid_length?(str)
    str.size == 10 || (str.size == 11 && str[0] == '1')
  end
end
