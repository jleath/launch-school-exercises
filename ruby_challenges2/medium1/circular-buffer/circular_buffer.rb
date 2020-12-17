class CircularBuffer
  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end

  def initialize(capacity)
    raise ArgumentError if capacity <= 0

    @buffer = []
    @capacity = capacity
    @oldest_index = 0
    @newest_index = 0
    @size = 0
  end

  def write(value)
    return if value.nil?

    raise BufferFullException if buffer_full?

    @buffer[@newest_index] = value
    @newest_index = increment(@newest_index)
    @size += 1
  end

  def write!(value)
    return if value.nil?

    read if buffer_full?
    write(value)
  end

  def read
    raise BufferEmptyException if buffer_empty?

    result = @buffer[@oldest_index]
    @buffer[@oldest_index] = nil
    @oldest_index = increment(@oldest_index)
    @size -= 1
    result
  end

  def clear
    @buffer = []
    @size = 0
    @oldest_index = 0
    @newest_index = 0
  end

  private

  def increment(index)
    (index + 1) % @capacity
  end

  def buffer_full?
    @size == @capacity
  end

  def buffer_empty?
    @size == 0
  end
end