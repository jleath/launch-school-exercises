def step(start, stop, step)
  values = []
  while start <= stop
    yield(start) if block_given?
    values << start
    start += step
  end
  values
end

step(1, 10, 3) { |value| puts "value = #{value}" }

puts step(1, 10, 3) == [1, 4, 7, 10]
