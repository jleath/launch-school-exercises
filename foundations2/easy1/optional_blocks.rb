def compute
  return 'Does not compute.' unless block_given?
  yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

puts compute(12) { |val| val * 2 } == 24
# Thie method call will produce an error
# puts compute { 24 }
puts compute(12) == 'Does not compute.'