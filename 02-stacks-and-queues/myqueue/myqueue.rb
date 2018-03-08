class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = nil
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @head = @queue[0]
    @tail = element

  end

  def dequeue
    if !@queue.empty?
      element = @queue.slice!(0)
      @head = @queue[1]
      return element
    end  
  end

  def empty?
    if @queue.length <=0
      true
    else
      false
    end
  end

end