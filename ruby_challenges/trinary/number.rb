class Number
  BASE = 10
  DEFAULT_VALUE = 0
  VALID_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  attr_reader :base

  def initialize(value_string, base: BASE, valid_chars: VALID_CHARS)
    if !base.instance_of?(Integer) || base <= 0
      raise ArgumentError, "base must be a positive integer value"
    end

    if base > valid_chars.size
      raise ArgumentError, "Not enough valid characters to represent base-#{base} system"
    end

    @value_string = value_string.upcase
    @base = base
    @valid_chars = valid_chars.upcase
    @min_char_index = 0
    @max_char_index = base - 1
  end

  def to_decimal
    return DEFAULT_VALUE unless valid_digit_string?
    values = @value_string.chars.map { |char| @valid_chars.index(char) }
    values.reduce do |memo, value|
      (memo * base) + value
    end
  end

  private

  def valid_digit_string?
    @value_string.chars.all? do |char| 
      char_index = @valid_chars.index(char)
      !char_index.nil? && (@min_char_index..@max_char_index).cover?(char_index)
    end
  end
end