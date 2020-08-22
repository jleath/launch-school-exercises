def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_valid_input()
  result = nil
  loop do
    puts "Please enter a positive or negative integer:"
    result = gets.chomp
    return result.to_i if valid_number?(result)
    puts "Invalid input. Only non-zero integers are allowed."
  end
end

value1 = nil
value2 = nil

loop do
  value1 = get_valid_input()
  value2 = get_valid_input()
  break if value1 * value2 < 0
  puts "Sorry. One integer must be positive, one must be negative."
  puts "Please start over."
end

puts "#{value1} + #{value2} = #{value1 + value2}"
