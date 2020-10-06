# arr1 and arr2 will already be sorted
# either array may be empty, in this case, the result will simply be the other array
# may not mutate the input arrays
# there may be duplicate values between the two arrays

# pseudocode
# initialize a new array to store the result, named 'merged'
# initialize two integers, arr1_counter and arr2_counter, to track indices into the two input arrays
# iterate until arr1_counter is >= arr1.size and arr2_counter is >= arr2.size
#   if arr1_counter >= arr1.size
#     add the next value from arr2 to the merged array
#     increment the arr2_counter pointer
#   else if arr2_counter >= arr2.size
#     add the next value from arr1 to the merged array
#     increment the arr1_counter pointer
#   otherwise,
#     determine whether the next value in arr1 or arr2 is smaller
#     add the smaller element to the merged array
#     increment the corresponding pointer.
# return the merged array

def merge(arr1, arr2)
  merged = []
  arr1_counter, arr2_counter = 0, 0
  while arr1_counter < arr1.size || arr2_counter < arr2.size
    if arr1_counter >= arr1.size
      merged.concat(arr2[arr2_counter...arr2.size])
      break
    elsif arr2_counter >= arr2.size
      merged.concat(arr1[arr1_counter...arr1.size])
      break
    else
      arr1_value = arr1[arr1_counter]
      arr2_value = arr2[arr2_counter]
      if (arr1_value <=> arr2_value) <= 0
        merged << arr1_value
        arr1_counter += 1
      else
        merged << arr2_value
        arr2_counter += 1
      end
    end
  end
  merged
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]

# mergesort

# will use recursion
# an input array that is only 0 or 1 elements long is already sorted, we can return it immediately
# otherwise, we want to recursively call merge_sort on smaller and smaller subarrays
# once we have the smaller subarrays handled, we can simply merge them together

def merge_sort(arr)
  return arr if arr.size <= 1

  mid = arr.size / 2
  left = merge_sort(arr[0...mid])
  right = arr[mid...arr.size]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge(sorted_left, sorted_right)
end

def iterative_merge_sort(arr)
  return arr if arr.empty?
  arr.map! { |item| [item] }
  result = arr.first
  (1...arr.size).each do |i|
    result = merge(result, arr[i])
  end
  result
end

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

puts iterative_merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts iterative_merge_sort([5, 3]) == [3, 5]
puts iterative_merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts iterative_merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts iterative_merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]