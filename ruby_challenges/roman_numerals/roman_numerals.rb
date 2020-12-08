# Split the integer into an array of digits ordered from 
# one's place to thousand's place

# For each digit, we need to append a different string to our result string
# if digit is 1-3, we need that many copies of the current place value numeral
# if digit is 4, we need the current place value numeral and the midpoint numeral
# if digit is 6-8, we need the midpoint numeral and the correct number of the current place value numeral
# if digit is 9, we need the current place value numeral and the next higher place value numeral


class Integer
  PLACE_VALUE_NUMERALS = ['I', 'X', 'C', 'M']
  MIDPOINT_NUMERALS = ['V', 'L', 'D']

  def to_roman
    (self.digits.each_with_index.map do |value, index|
      case value
      when (1..3)
        PLACE_VALUE_NUMERALS[index] * value
      when 4
        PLACE_VALUE_NUMERALS[index] + MIDPOINT_NUMERALS[index]
      when 5
        MIDPOINT_NUMERALS[index]
      when (6..8)
        MIDPOINT_NUMERALS[index] + (PLACE_VALUE_NUMERALS[index] * (value - 5))
      when 9
        PLACE_VALUE_NUMERALS[index] + PLACE_VALUE_NUMERALS[index + 1]
      end
    end).reverse.join('')
  end
end