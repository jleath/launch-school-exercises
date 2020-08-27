# 0th 1st 2nd 3rd etc.
ORDINAL_INDICATORS = %w[th st nd rd th th th]

def valid_int?(n)
  /^\d+$/.match(n)
end

def get_integer(n)
  input = nil 
  loop do
    puts "Enter the #{n}#{ORDINAL_INDICATORS[n]} integer:"
    input = gets.chomp
    break if valid_int?(input)
    puts "Sorry, that is not a valid integer. Try again."
  end
  input.to_i
end

def search(n, arr)
  arr.include?(n)
end

inputs = []
(1..5).each { |n| inputs << get_integer(n) }

search_int = get_integer(6)
if search(search_int, inputs)
  print "The number #{search_int} appears in "
  p inputs
else
  print "The number #{search_int} does not appear in "
  p inputs
end