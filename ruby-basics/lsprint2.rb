num_lines = nil
user_quit = false

loop do

  loop do
    puts "How many output lines do you want? Enter a number >= 3:"
    num_lines = gets.chomp

    if num_lines.downcase == "q"
      user_quit = true
      break
    end

    num_lines = num_lines.to_i
    break if num_lines >= 3
    puts "That's not enough lines."
  end

  break if user_quit
  num_lines.times { puts "Launch School is the best!" }

end
