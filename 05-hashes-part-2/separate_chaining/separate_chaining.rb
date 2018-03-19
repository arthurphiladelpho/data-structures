require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @count = 0
    @hash = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    @hash[i] = LinkedList.new if @hash[i] == nil
    @hash[i].add_to_tail(Node.new(key, value))
    @count += 1
    self.resize if load_factor > @max_load_factor
  end

  def [](key)
    i = index(key, size)
    if @hash[i] 
      node = @hash[i].head
      while node
        if node.key == key
          return node.value
        end
        node = node.next
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @hash.length
  end

  # Resize the hash
  def resize
    temp = @hash
    @hash = Array.new(size * 2)
    temp.each do |list|
      if list 
        node = list.head
        while node
          i = index(node.key, size)
          @hash[i] = LinkedList.new if !@hash[i]
          @hash[i].add_to_tail(Node.new(node.key, node.value))
          node = node.next
        end
      end
    end
    resize if load_factor > @max_load_factor
  end

end
