items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *rest, wheat |
  puts rest.join(', ')
  puts wheat
end

gather(items) do | apples, *rest, wheat |
  puts apples
  puts rest.join(', ')
  puts wheat
end

gather(items) do | apples, *rest |
  puts apples
  puts rest.join(', ')
end

gather(items) do | apples, corn, cabbage, wheat  |
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end