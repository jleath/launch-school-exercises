# Write a method that takes a sorted array of integers as an argument, and 
# returns an array that includes all of the missing integers (in order) 
# between the first and last elements of the argument.

# input: a sorted array of integers
# output: an array with all missing elements between the first and last
#         elements of the argument

# An input array with no items or no missing items will return an empty array
# numbers in the array may be negative

# will create an array containing all the integers between input[0]
# and input[-1], inclusive.
# return the difference of the two arrays

def missing(arr)
  raise ArgumentError, "sorted array required" unless arr.sort == arr
  return [] if arr.empty?
  (arr.first..arr.last).to_a - arr
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []
puts missing([]) == []
begin
  missing([12, 4, 29, -5])
  puts "false"
rescue
  puts "true"
end