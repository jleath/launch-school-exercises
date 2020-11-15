def divisors(n)
  curr = n.even? ? 2 : 3
  result = [1]
  while curr <= Math.sqrt(n)
    result.concat([n / curr, curr].uniq) if (n % curr).zero?
    curr += n.odd? ? 2 : 1
  end
  n == 1 ? result : result + [n]
end

puts divisors(1).sort == [1]
puts divisors(7).sort == [1, 7]
puts divisors(12).sort == [1, 2, 3, 4, 6, 12]
puts divisors(98).sort == [1, 2, 7, 14, 49, 98]
puts divisors(99400891).sort == [1, 9967, 9973, 99400891] # may take a minute
puts divisors(999962000357).sort == [1, 999979, 999983, 999962000357]