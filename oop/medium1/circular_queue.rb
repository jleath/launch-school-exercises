class CircularQueue
  def initialize(capacity)
    @buffer = []
    @oldest = 0
    @newest = 0
    @capacity = capacity
    @size = 0
  end

  def enqueue(value)
    dequeue if full?
    @buffer[@newest] = value
    @size += 1
    @newest = increment(@newest)
  end

  def dequeue
    return nil if empty?
    result = @buffer[@oldest]
    @size -= 1
    @oldest = increment(@oldest)
    result
  end

  private

  def empty?
    @size == 0
  end

  def full?
    @size == @capacity
  end

  def increment(index)
    (index + 1) % @capacity
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
