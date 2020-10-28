class CircularQueue
  def initialize(capacity)
    @buffer = [nil] * capacity
    @front = 0
    @back = 0
  end

  # add an item to the end of the queue, if adding this item causes the
  # buffer to exceed capacity, remove the first item
  def enqueue(value)
    unless @buffer[@back].nil?
      @front = increment(@back)
    end
    @buffer[@back] = value
    @back = increment(@back)
  end

  # remove and return the first item in the queue, if no such item exists
  # return nil
  def dequeue
    value = @buffer[@front]
    @buffer[@front] = nil
    @front = increment(@front) unless value.nil?
    value
  end

  private

  def increment(index)
    (index + 1) % @buffer.size
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