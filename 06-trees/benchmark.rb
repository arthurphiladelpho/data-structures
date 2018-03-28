require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'min_heap/min_heap'


root = Node.new("heap root", 42)
tree = BinarySearchTree.new(root)
heap = MinHeap.new(root)




n = 100000

Benchmark.bm(100) do |x|
  x.report("tree insert") do
    for i in 1..n do
      new_node = Node.new("tree", Random.rand(100000))
      tree.insert(root, new_node)
    end
  end
   x.report("heap insert") do
     for i in 1..n do
       new_node = Node.new("heap", Random.rand(100000))
       heap.insert(root, new_node)
     end
   end
end

target = Node.new("target", 50000)
tree.insert(root, target)
heap.insert(root, target)

Benchmark.bm(100) do |x|
  x.report("tree find") do
      tree.find(root, 50000)
  end
   x.report("heap find") do
     heap.find(root, 50000)
   end
end

Benchmark.bm(100) do |x|
  x.report("tree delete") do
      tree.delete(root, 50000)
  end
   x.report("heap delete") do
     heap.delete(root, 50000)
   end
end