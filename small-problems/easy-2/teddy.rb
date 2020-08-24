puts "Enter your name (I will call you Teddy if you don't):"
name = gets.chomp
name = "Teddy" if name.empty?
age = rand(20..200)
puts "#{name} is #{age} years old!"
