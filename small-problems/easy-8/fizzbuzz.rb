def fizzbuzz(start, stop)
  result = []
  start.upto(stop) do |n|
    output = ''
    output += 'fizz' if n % 3 == 0
    output += 'buzz' if n % 5 == 0
    output = n.to_s if output.empty?
    result << output
  end
  puts result.join(', ')
end

fizzbuzz(1, 15)
fizzbuzz(1, 20)
