# Given an array and a search value, return true if the value can be found in the array

def include?(arr, value)
  arr.count(value) > 0
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false