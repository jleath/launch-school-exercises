class CircularQueue
  def initialize(capacity)
    @capacity = capacity
    @buffer = []
  end

  # add an item to the end of the queue, if adding this item causes the
  # buffer to exceed capacity, remove the first item
  def enqueue(value)
    @buffer.push(value)
    dequeue if exceeds_capacity?
    nil
  end

  # remove and return the first item in the queue, if no such item exists
  # return nil
  def dequeue
    return nil if @buffer.size == 0
    @buffer.shift
  end

  private

  def exceeds_capacity?
    @buffer.size > @capacity
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