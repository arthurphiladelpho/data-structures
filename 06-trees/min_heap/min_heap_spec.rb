include RSpec

require_relative 'min_heap'

RSpec.describe MinHeap, type: Class do
  let (:root) { Node.new("Casino Royale", 87) }

  let (:tree) { MinHeap.new(root) }
  let (:spy) { Node.new("The Spy Who Loved Me", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:majesty) { Node.new("On Her Majesty's Secret Service", 80) }
  let (:thunderball) { Node.new("Thunderball", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:skyfall) { Node.new("Skyfall", 90) }
  let (:die) { Node.new("Die Another Day", 91) }
  let (:world) { Node.new("The World Is Not Enough", 92) }
  let (:tomorrow) { Node.new("Tomorrow Never Dies", 93) }
  let (:goldeneye) { Node.new("GoldenEye", 94) }
  let (:license) { Node.new("License To Kill", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, spy)
      expect(tree.root.title).to eq "The Spy Who Loved Me"
    end

    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, spy)
      expect(tree.root.left.title).to eq "Casino Royale"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, spy)
      expect(tree.root.left.left.title).to eq "Casino Royale"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, thunderball)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, spy)
      tree.insert(tree.root, skyfall)
      expect(tree.root.right.title).to eq "Skyfall"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, spy)
      tree.insert(tree.root, skyfall)
      tree.insert(tree.root, tomorrow)
      tree.insert(tree.root, world)
      tree.insert(tree.root, license)
      expect(tree.root.right.left.title).to eq "License To Kill"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, spy)
      tree.insert(tree.root, skyfall)
      tree.insert(tree.root, tomorrow)
      tree.insert(tree.root, world)
      tree.insert(tree.root, license)
      tree.insert(tree.root, goldeneye)
      expect(tree.root.right.right.title).to eq "GoldenEye"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, goldeneye)
      tree.insert(root, license)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, skyfall)
      expect(tree.find(root, skyfall.title).title).to eq "Skyfall"
    end

  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, tomorrow)
      tree.delete(root, tomorrow.title)
      expect(tree.find(root, tomorrow.title)).to be_nil
    end

  end

  describe "#print" do
    it "should print" do
      tree.insert(tree.root, spy)
      tree.insert(tree.root, skyfall)
      tree.insert(tree.root, tomorrow)
      tree.insert(tree.root, world)
      tree.insert(tree.root, license)
      tree.insert(tree.root, goldeneye)
      tree.printf()
   end
  end
end