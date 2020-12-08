# Applies the block to each nth value between start and stop, inclusive
# if start + n is > stop, will only execute the block for one value, start
# Returns an array containing the values that were passed into the block
def step(start, stop, n)
  values = []
  curr_value = start
  while curr_value <= stop
    values << curr_value
    yield(curr_value) if block_given?
    curr_value += n
  end
  values
end

test_results = []
return_value = step(1, 10, 3) { |value| test_results << value }
puts return_value == test_results
