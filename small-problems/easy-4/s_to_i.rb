require 'pry'
# may not use #to_i or the Integer constructor
# assumes all characters are valid
DIGITS_MAP = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def string_to_i(text, base=10)
  first_char = text.chr
  if %w[+ -].include?(first_char)
    text.slice!(0)
  end
  result = 0
  digits = text.split('').map { |c| DIGITS_MAP[c.downcase] }
  digits.each { |d| result = (result * base) + d }
  first_char == '-' ? -result : result
end

# base 10
def s_to_i(text)
  string_to_i(text)
end

# base 16
def h_to_i(text)
  string_to_i(text, 16)
end

# base 8
def o_to_i(text)
  string_to_i(text, 8)
end

puts s_to_i('4321') == 4321
puts s_to_i('570') == 570
puts h_to_i('4D9f') == 19871
puts o_to_i('427630') == 143256
puts s_to_i('-570') == -570
puts s_to_i('+100') == 100