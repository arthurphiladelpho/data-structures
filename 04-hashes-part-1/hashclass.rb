require_relative 'hash_item'

class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, size)
    # If space in the array is vacant, create a new hash.
    if @items[i] == nil
      @items[i] = HashItem.new(key, value)
      # Else if, item is a duplicate 
    elsif @items[i].key == key && @items[i].value == value
      puts "duplicate"
    else 
      # New item wanted the spot of an existing item.
      while true do
        resize 
        j = index(key,size)
        break if @items[j] == nil || @items[j].key == key
      end
      k = index(key, size)
      if @items[k] == nil
        @items[k] = HashItem.new(key, value)
      else 
        @items[k].value = value 
      end
    end

  end


  def [](key)
    i = index(key, size)
    @items[i].value if @items[i]
  end

  def resize
    # # Doubles the size of the array when invoked
    arr = Array.new(@items.length * 2)
    (0...@items.length).each do |i|
      if @items[i]
        ind = @items[i].key.sum % arr.length
        arr[ind] = @items[i]
        @items[i] = nil
      end 
    end
    @items = arr
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end