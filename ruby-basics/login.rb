USER_NAME = "koolguy86"
PASSWORD = "P0ngo"

loop do
  puts "Please enter user name: "
  user_name_input = gets.chomp
  puts "Please enter your password: "
  password_input = gets.chomp
  break if password_input == PASSWORD && user_name_input == USER_NAME
  puts "Authorization failed!"
end

puts "Welcome!"
