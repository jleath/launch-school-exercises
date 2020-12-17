class CircularBuffer
  class BufferFullException < StandardError; end
  class BufferEmptyException < StandardError; end

  def initialize(capacity)
    raise ArgumentError if capacity <= 0
    @buffer = []
    @capacity = capacity
  end

  def write(value)
    return if value.nil?

    raise BufferFullException if buffer_full?

    @buffer.push(value)
  end

  def write!(value)
    return if value.nil?

    read if buffer_full?
    write(value)
  end

  def read
    raise BufferEmptyException if buffer_empty?

    @buffer.shift
  end

  def clear
    @buffer.clear
  end

  private

  def buffer_full?
    @buffer.size == @capacity
  end

  def buffer_empty?
    @buffer.size == 0
  end
end