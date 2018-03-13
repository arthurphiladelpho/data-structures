require 'benchmark'	
require_relative 'node'
require_relative 'linked_list'

arr = []
llist = LinkedList.new

puts 'Array w/ 10000 items creation time'
puts Benchmark.measure{
	arr.clear
	10000.times do |i|
		arr[i] = Node.new(i)
	end
}

puts 'Linked List w/ 10000 items creation time'
puts Benchmark.measure{
	10000.times do |i|
		llist.add_to_tail(Node.new(i))
	end
}

puts 'Array: time to find the 500th element'
puts Benchmark.measure{
	arr[4999]
}

puts 'Linked List: time to find the 500th element'
puts Benchmark.measure{
	node = llist.head
	(1..4999).each do |i|
    node = node.next
  end
}

puts "Array: time to delete the 5000th element"
puts Benchmark.measure {
  arr.delete_at(4999)
}

puts "Linked List: time to delete the 5000th element"
puts Benchmark.measure {
  node = llist.head
	(1..4999).each do |i|
    node = node.next
  end
  llist.delete(node)
}







