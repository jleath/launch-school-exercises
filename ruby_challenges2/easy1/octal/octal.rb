class Octal
  BASE = 8
  VALID_CHARS = '01234567-'

  def initialize(digit_string)
    @digit_string = digit_string
  end

  def to_decimal
    return 0 unless valid_string?(@digit_string)

    string = @digit_string
    negative = 1
    if string[0] == '-'
      negative = -1
      string = string.slice(1, string.size - 1)
    end

    decimal_value = string.chars.reduce(0) do |decimal_value, digit| 
      (decimal_value * BASE) + VALID_CHARS.index(digit)
    end
    decimal_value * negative
  end

  def valid_string?(string)
    string.chars.all? { |char| VALID_CHARS.include?(char) }
  end
end