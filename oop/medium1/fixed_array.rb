class FixedArray
  def initialize(capacity)
    @buffer = [nil] * capacity
  end

  def to_a
    @buffer.clone
  end

  def to_s
    @buffer.to_s
  end

  def [](index)
    index = adjust_index(index)
    raise IndexError unless valid_index?(index)
    @buffer[index] 
  end

  def []=(index, value)
    index = adjust_index(index)
    raise IndexError unless valid_index?(index)
    @buffer[index] = value
  end

  private

  def adjust_index(index)
    index >= 0 ? index : @buffer.size + index
  end

  def valid_index?(index)
    index >= 0 && index < @buffer.size
  end
end

# accessing an index < capacity but > size returns nil
# need to be able to set indices with []
# negative indices should work just like regular arrays
# attempted accesses outside of capacity should raise IndexError

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end