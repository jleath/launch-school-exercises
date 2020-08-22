def digit_list(n)
  # will return nil if n < 0
  return if n < 0
  digits = []
  loop do
    digits.unshift(n % 10)
    n /= 10
    break if n == 0
  end
  return digits
end

def test_digit_list(n)
  print "#{n} -> "
  p digit_list(n)
end

tests = [12345, 7, 375290, 444, 0, -15]
tests.each { |n| test_digit_list(n) }
