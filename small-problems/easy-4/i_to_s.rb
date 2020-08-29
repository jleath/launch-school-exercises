DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def abs(n)
  n < 0 ? -n : n
end

def i_to_s(n)
  value = abs(n)
  result = ''
  loop do
    curr_digit = value % 10
    result.prepend(DIGITS[curr_digit])
    value = value / 10
    break if value == 0

  end
  if n == 0
    result
  elsif n < 0
    '-' + result
  else
    '+' + result
  end
end

puts i_to_s(4321) == '+4321'
puts i_to_s(-123) == '-123'
puts i_to_s(0) == '0'