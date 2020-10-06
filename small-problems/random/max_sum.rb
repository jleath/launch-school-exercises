# The maximum sum subarray problem consists in finding the maximum sum of a
# contiguous subsequence in an arary of integers:

# Easy case is when the array is made up of only positive numbers and the max
# sum is the sum of the whole array. If the array is made up of only negative
# numbers, return 0 instead.

# empty array is considered to have zero greatest sum, note that the empty
# array is also a valid subarray

# input: an array of positive or non-positive integers
# output: an integer, the sum of the max-subsequence

# if the array consists only of positive integers, the result is simply the sum
# if the array consists only of negative integers, the result is simply 0
# if the array consists of no integers, the result is simply 0
# the array is not necessarily sorted
# the array can have 0 or more integers

# Procedure:

# checking for the edge cases,
#   if the array consists of all negatives, return 0
#   if the array is empty, return 0 (this may be handled by the method automatically)
# create an array of the subsequences
# iterate through the subsequences, calculating the total sum of each
# if the sum is the largest we've seen so far, save it.
# once we've iterated through all subsequences, return the largest sum

def get_subsequences(sequence)
  index = 0
  subsequences = []
  loop do
    break if index >= sequence.size

    subsequence_end = index
    loop do
      break if subsequence_end >= sequence.size

      subsequences << sequence[index..subsequence_end]
      subsequence_end += 1
    end
    index += 1
  end
  subsequences
end

p get_subsequences([1, 2, 3, 4]) == [[1], [1, 2], [1, 2, 3], [1, 2, 3, 4], [2], [2, 3], [2, 3, 4], [3], [3, 4], [4]]
p get_subsequences([]) == []
p get_subsequences([1]) == [[1]]
p get_subsequences([1, 2]) == [[1], [1, 2], [2]]



def max_sequence(sequence)
  return 0 if sequence.all? { |item| item < 0 }

  subsequences = get_subsequences(sequence)
  largest_value = nil
  subsequences.each do |subsequence|
    sum = subsequence.reduce(:+)
    if largest_value == nil || sum > largest_value
      largest_value = sum
    end
  end
  largest_value
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
p max_sequence([-1, -2, -3, 0, -4, -1]) == 0

