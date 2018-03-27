require_relative 'node'

class OpenAddressing
  def initialize(size)
    @hash = Array.new(size)
    @count = size
  end

  def []=(key, value)
    i = index(key, size)

    if !@hash[i]
      # puts "#{hash[i]} #{key}"
      @hash[i] = Node.new(key, value)
      @count += 1
    elsif @hash[i].key == key && @hash[i].value == value
        # puts "B#{hash[i]} #{key}"
      return @hash[i]
    else
        # puts "C#{hash[i]} #{key}"
      next_index = next_open_index(i)
      if @hash[i].key == key && @hash[i].value != value && next_index == -1
        resize
        @hash[next_index].value = value
        @count += 1
      elsif next_index == -1
        resize
        self[key] = value
      else
        @hash[next_index] = Node.new(key, value)
        @hash[next_index].value = value
        @count += 1
      end
    end
  end


  def [](key)
    item = @hash[index(key, size)]
    if item.nil?
      nil
    else
      item.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while @hash[index]
      index += 1
    end
    index >= size ? -1 : index
  end

  # Simple method to return the number of items in the hash
  def size
    @hash.length 
  end

  # Resize the hash
  def resize
    temp = @hash
    @hash = Array.new(size * 2)
    temp.each do |i|
      if i
        index = index(i.key, @hash.length)
        @hash[index] = Node.new(i.key, i.value)
      end
    end
    return @hash
  end

end