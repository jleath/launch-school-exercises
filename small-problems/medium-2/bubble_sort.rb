def bubble_sort!(arr)
  num_passes = 0
  loop do
    swapped = false

    first_sorted_item = arr.size - num_passes
    (1...first_sorted_item).each do |curr|
      prev = curr - 1
      next if (arr[curr] <=> arr[prev]) >= 0

      arr[curr], arr[prev] = arr[prev], arr[curr]
      swapped = true
    end
    break unless swapped

    num_passes += 1
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)