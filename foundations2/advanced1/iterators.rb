# Create a new Enumerator object that can iterate over an infinite list of
# factorials.

# Use this enumerator to print out the first 7 factorial values, starting with
# 0!

factorial = Enumerator.new do |y|
  product = 1
  curr_n = 0

  loop do
    y << product
    curr_n += 1
    product = product * curr_n
  end
end

7.times { |iteration| puts "#{iteration} => #{factorial.next}" }
puts
factorial.rewind
3.times { |iteration| puts "#{iteration} => #{factorial.next} "}
puts
factorial.rewind
7.times { |iteration| puts "#{iteration} => #{factorial.next} "}
puts
factorial.rewind
factorial.each_with_index do |value, index|
  break if index > 10

  puts "#{index} => #{value}"
end