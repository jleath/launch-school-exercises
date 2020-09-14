# Write a method that computes the difference between the square of the sum
# of the first n positive integers and the sum of the squares of the first
# n positive integers

# input: an integer
# output: an integer

# return 0 if n <= 1

# set a counter to 1
# set a sum variable to 0
# set a squares_sum variable to 0
# if the counter is <= n
#   add counter to sum
#   add counter * counter to squares_sum
# increment counter
# repeat from line 13
# return abs((sum ** 2) - squares_sum)

def sum_square_difference(n)
  counter = 1
  sum = 0
  squares_sum = 0
  while counter <= n
    sum += counter
    squares_sum += counter ** 2
    counter += 1
  end
  ((sum ** 2) - squares_sum).abs
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150