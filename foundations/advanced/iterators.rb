factorial = Enumerator.new do |y|
  n, prev = 0, 1
  loop do
    y << prev
    n += 1
    prev *= n
  end
end

7.times { puts factorial.next }
factorial.rewind
3.times { puts factorial.next }

p factorial.take(10)

factorial.each_with_index do |value, index|
  break if index == 7
  puts value
end