def sum(n)
  n.digits.reduce(:+)
  # using the #digits method feels like cheating, so you could also do this:
  # n.to_s.split('').map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
