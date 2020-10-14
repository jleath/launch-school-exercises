# shift one position, starting with the smallest digit to the largest
# shift two positions, starting with the smallest digit to the largest
# ..
# shift n-1 positions, starting with the smallest digit to the largest
# if at any point in this process, the resulting number is larger than n, return that number

def next_bigger(n)
  return nil if n.digits.sort.reverse == n.to_s.chars.map(&:to_i)
  copy = n.digits.sort
  loop do
    n += 9
    return n if n.digits.sort == copy
  end
end

p next_bigger(1234) == 1243
p next_bigger(12)   == 21
p next_bigger(513)  == 531
p next_bigger(2017) == 2071
p next_bigger(414)  == 441
p next_bigger(144)  == 414

p next_bigger(9)    == nil
p next_bigger(111)  == nil
p next_bigger(531)  == nil

p next_bigger(1234567890)

perms = '2017'.chars.permutation(4).to_a.uniq
perms = perms.each.map { |perm| perm.join('').to_i }

perms.sort!
p perms
i = 1
diffs = []
while i <= perms.size - 1
  diffs << perms[i] - perms[i-1]
  i += 1
end
p diffs.uniq

sum_to_9 = []
(9...1000).each { |i| sum_to_9 << i if i.digits.reduce(:+) == 9 }
p sum_to_9