# Write a method that takes an array of numbers and then returns the sum of
# the sums of each leading subsequence for that array. You may assume that
# the array always contains at least one number.

# input: an array of integers
# output: an integer

# if the given array has n items, there will be a total of n sums
# each nth sum will be the sum of items 0 through n-1

# set a counter and a running total to 0
# do the following n times (where n is the number of items in the array)
#   add the 0th item to a running total
#   repeat until you have added the item at the index indicated by the counter
#   increment the counter
# return the running total

# SET counter = 0
# SET total = 0
# SET num_items = arr.size
# WHILE counter < num_items
#   SET i = 0
#   WHILE i <= counter
#     SET total = total + arr[i]
#     SET i = i + 1
#   SET counter = counter + 1
# RETURN total

def sum_of_sums(arr)
  counter = 0
  total = 0
  num_items = arr.size
  while counter < num_items
    i = 0
    while i <= counter
      total += arr[i]
      i += 1
    end
    counter += 1
  end
  total
end

def sum_of_sums(arr)
  total = 0
  0.upto(arr.size-1) { |i| total += arr[0, i+1].reduce(:+) }
  total
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> 21
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> 36
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35