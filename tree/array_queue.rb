class ArrayQueue
  def initialize(queue = [])
    @queue = queue
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def empty?
    @queue.size == 0
  end
end
