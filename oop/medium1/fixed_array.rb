class FixedArray
  def initialize(size)
    @capacity = size
    @buffer = [nil] * size
  end

  def [](index)
    index = adjust_index(index)
    unless valid_index(index)
      raise IndexError, "Index out of bounds"
    end
    @buffer[index]
  end

  def []=(index, value)
    index = adjust_index(index)
    unless valid_index(index)
      raise IndexError, "Index out of bounds"
    end
    @buffer[index] = value
  end

  def to_a
    @buffer
  end

  def to_s
    @buffer.to_s
  end

  private 

  def valid_index(index)
    index >= 0 && index < @capacity
  end

  def adjust_index(index)
    if index < 0
      @capacity + index
    else
      index
    end
  end
end

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