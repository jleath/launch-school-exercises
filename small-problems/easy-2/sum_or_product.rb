def get_integer
  input = nil
  loop do
    print '>> Please enter an integer greater than 0: '
    input = gets.chomp
    if !/^\d+$/.match(input)
      puts ">> That is not an integer. Try again."
    elsif input.to_i <= 0
      puts ">> You must enter a number greater than 0. Try again."
    else
      break
    end
  end
  input.to_i
end

def get_operation
  input = nil
  loop do
    print ">> Enter 's' to compute the sum, 'p' to compute the product: "
    input = gets.chomp.downcase
    break if %w[y s].include?(input)
    puts ">> You must enter either 's' or 'p'. Try again."
  end
  input
end

stop = get_integer
operation = get_operation

case operation
when 's' 
  result = 1.upto(stop).reduce(:+)
  puts "The sum of the integers between 1 and #{stop} is #{result}"
when 'p'
  result = 1.upto(stop).reduce(:*)
  puts "The product of the integers between 1 and #{stop} is #{result}"
else 
  puts 'Invalid Operation'
end