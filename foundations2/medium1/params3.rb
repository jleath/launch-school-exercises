items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do | *not_wheat, wheat |
  puts not_wheat.join(', ')
  puts wheat
end

# 2
gather(items) do |fruit, *veggies, other|
  puts fruit
  puts veggies.join(', ')
  puts other
end

# 3
gather(items) do | fruit, *other|
  puts fruit
  puts other.join(', ')
end

#4
gather(items) do | apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, #{wheat}"
end