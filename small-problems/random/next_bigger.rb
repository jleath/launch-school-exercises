# You have to create a method that takes a positive integer number and returns
# the next bigger number formed by the same digits

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1:

# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# assume that n will always be positive
# must use all digits of n for the result
# return -1 if no number is possible

# start by creating an array of all permutations of the digits in n
# sort this permutations array
# iterate through the permutations array, and return the first item that is greater than n
# if no such number exists, return -1

def convert_to_int(digits)
  sum = 0
  power = 1
  digits.each do |digit|
    sum += (digit * power)
    power *= 10
  end
  sum
end

def next_bigger(n)
  permutations = n.digits.permutation.to_a
  permutations.map! { |subarray| convert_to_int(subarray) }
  permutations.sort!
  permutations.each do |perm|
    return perm if perm > n
  end
  return -1
end

p convert_to_int([]) == 0
p convert_to_int([1, 2, 3]) == 321
p convert_to_int([3, 2, 1]) == 123
p next_bigger(12) == 21
p next_bigger(513) == 531
p next_bigger(2017) == 2071
p next_bigger(9) == -1
p next_bigger(111) == -1
p next_bigger(531) == -1
p next_bigger(123456789) == 123456798 
