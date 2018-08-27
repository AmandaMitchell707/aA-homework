def class Queue
  attr_reader : queue_array

  def initialize
    @queue_array = []
  end

  def enqueue(el)
    queue_array.push(el)
  end

  def dequeue
    queue_array.shift
  end

  def peek
    queue_array.first
  end
end
