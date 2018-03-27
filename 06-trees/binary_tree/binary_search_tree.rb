require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    else
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if !root || !data
      nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if !root || !data
      nil
    else
      target = find(root, data)
      target.nil? ? nil : (target.title = nil && target.rating = nil)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    children = [@root] if children == nil
    row = []
    children.each do |child|
      puts "#{child.title}: #{child.rating}"
      row.push(child.left) if child.left
      row.push(child.right) if child.right
    end
    row.length == 0 ? nil : printf(row)
  end
end
