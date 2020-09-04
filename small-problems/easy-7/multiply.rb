def show_multiplicative_average(arr)
  format("%.03f", arr.reduce(:*) / arr.size.to_f)
end

puts show_multiplicative_average([3, 5])
puts show_multiplicative_average([6])
puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
