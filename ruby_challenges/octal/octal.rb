class Octal
  BASE = 8
  DEFAULT_VALUE = 0

  attr_reader :base

  def initialize(value_string, base=BASE)
    if !base.instance_of?(Integer) || base <= 0
      raise ArgumentError, "base must be a positive integer value"
    end

    @value_string = value_string
    @base = base
    @max_char = (base.to_i - 1).to_s
  end

  def to_decimal
    return DEFAULT_VALUE unless valid_digit_string?

    @value_string.chars.map(&:to_i).reduce do |memo, value|
      (memo * base) + value
    end
  end

  private

  def valid_digit_string?
    @value_string.chars.all? { |char| char.between?('0', @max_char) }
  end
end
