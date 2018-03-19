require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if self.head == nil
      self.head = node
    end
    if self.tail
      self.tail.next = node
    end
    self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if self.tail == nil
      return
    end
    if self.head == self.tail 
      self.head = nil
      self.tail = nil
    else
      temp = self.head
      while temp.next != self.tail
        temp = temp.next
      end
      temp.next = nil
      self.tail = temp
    end
  end

  # This method prints out a representation of the list.
  def print
    str = ""
    temp = self.head
    while temp
      str += "#{temp.data}\n"
      temp = temp.next
    end
    puts str
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == self.head
      self.head = self.head.next
    elsif node == self.tail
      remove_tail
    else 
      temp = self.head
      while temp.next != node
        temp = temp.next
      end
      temp.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    temp = self.head
    self.head = node
    self.head.next = temp
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = self.head
    self.head = self.head.next
    temp
  end
end