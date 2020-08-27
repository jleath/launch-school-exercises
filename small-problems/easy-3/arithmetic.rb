puts "Enter the first number: "
a = gets.chomp.to_f
puts "Enter the second number: "
b = gets.chomp.to_f

puts "#{a} + #{b} = #{a + b}"
puts "#{a} - #{b} = #{a - b}"
puts "#{a} * #{b} = #{a * b}"
puts "#{a} / #{b} = #{a / b}" if b != 0
puts "#{a} % #{b} = #{a % b}" if b != 0
puts "#{a} ** #{b} = #{a ** b}"

