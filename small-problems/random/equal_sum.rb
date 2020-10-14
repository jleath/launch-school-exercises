# You are going to be given an array of integers. Your job is to take that
# array and find an index N where the sum of the integers to the left of N
# is equal to the sum of the integers to the right of N. If there is no
# index that would make this happen, return -1.

# find the index of the array that could split the array into two separate arrays
#   where the sum of the integers in the array are equal

# the index at which we split, is not counted towards the sum
# this includes the 0th index, when we split at the 0th index, we have one empty
#   array for the left side, and the full array on the right side. An empty array
#   counts as 0, and this must be factored into the solution
# There can be negative numbers in the array
# If there is no index that solves this problem, we'll just return -1.

#   i.e. array length 4, 0 1 2 3
#   0 -> [], [1, 2, 3, 4]
#   1 -> [1], [2, 3, 4]
#   2 -> [1, 2,] [3, 4]
#   3 -> [1, 2, 3], [4]
#   4 -> [1, 2, 3, 4] []
# iterate through each index between 0 and the input arrays length, inclusive.
#   on each iteration, split the array into two arrays, on the index
#   sum the integers in each array
#   if these sums are equal, return the index we split on
#   otherwise, increment the index and repeat
#   stop iterating when the index > array input size

# split_array method will return two subarrays of the input array.
# the first subarray will consist of the elements in range 0 to index, exclusive
# the second subarray will consist of the elements in range index to array.length, exclusive.
# if index is 0, the left array should be [], and the right array should simply be array

def split_array(array, index)
  [array[0...index], array[index+1...array.length]]
end

test_array = [1, 2, 3, 4, 3, 2, 1]
p split_array(test_array, 0) == [[], [2, 3, 4, 3, 2, 1]]
p split_array(test_array, 1) == [[1], [3, 4, 3, 2, 1]]
p split_array(test_array, 3) == [[1, 2, 3], [3, 2, 1]]
p split_array(test_array, 6) == [[1, 2, 3, 4, 3, 2], []]

def find_even_index(arr)
  index = 0
  while index < arr.size
    left_arr, right_arr = split_array(arr, index)
    left_sum = left_arr.empty? ? 0 : left_arr.reduce(:+)
    right_sum = right_arr.empty? ? 0 : right_arr.reduce(:+)
    return index if left_sum == right_sum

    index += 1
  end
  -1
end

[1, 2, 3, 4, 3, 2, 1]


p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3