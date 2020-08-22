num_lines = 0

loop do
  puts "How many output lines do you want? Enter a number >= 3:"
  num_lines = gets.chomp.to_i
  break if num_lines >= 3
  puts "That's not enough lines."
end

num_lines.times { puts "Launch School is the best!" }
