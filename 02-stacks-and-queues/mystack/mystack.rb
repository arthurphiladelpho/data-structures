class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
      @stack[@stack.length] = item
      self.top = item
  end

  def pop
    if !@stack.empty?
      item = @stack.slice!(@stack.length-1)
      self.top = @stack[@stack.length-2]
      return item
    end
  end

  def empty?
    if @stack.length <= 0
      true
    else
      false 
    end
  end
end
