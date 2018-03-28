include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Casino Royale", 87) }

  let (:tree) { BinarySearchTree.new(root) }
  let (:the_spy) { Node.new("The Spy Who Loved Me", 72) }
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
    it "properly inserts a new node as a left child" do
      tree.insert(root, the_spy)
      expect(root.left.title).to eq "The Spy Who Loved Me"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, braveheart)
      tree.insert(root, the_spy)
      expect(root.left.left.title).to eq "The Spy Who Loved Me"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, thunderball)
      tree.insert(root, inception)
      expect(root.left.right.title).to eq "Inception"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, skyfall)
      expect(root.right.title).to eq "Skyfall"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, tomorrow)
      tree.insert(root, world)
      expect(root.right.left.title).to eq "The World Is Not Enough"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, goldeneye)
      tree.insert(root, license)
      expect(root.right.right.title).to eq "License To Kill"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, goldeneye)
      tree.insert(root, license)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, the_spy)
      expect(tree.find(root, the_spy.title).title).to eq "The Spy Who Loved Me"
    end

    it "properly finds a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, the_spy)
      expect(tree.find(root, the_spy.title).title).to eq "The Spy Who Loved Me"
    end

    it "properly finds a left-right node" do
      tree.insert(root, thunderball)
      tree.insert(root, inception)
      expect(tree.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      tree.insert(root, skyfall)
      expect(tree.find(root, skyfall.title).title).to eq "Skyfall"
    end

    it "properly finds a right-left node" do
      tree.insert(root, tomorrow)
      tree.insert(root, world)
      expect(tree.find(root, world.title).title).to eq "The World Is Not Enough"
    end

    it "properly finds a right-right node" do
      tree.insert(root, goldeneye)
      tree.insert(root, license)
      expect(tree.find(root, license.title).title).to eq "License To Kill"
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

    it "properly deletes a left-left node" do
      tree.insert(root, braveheart)
      tree.insert(root, the_spy)
      tree.delete(root, the_spy.title)
      expect(tree.find(root, the_spy.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, thunderball)
      tree.insert(root, inception)
      tree.delete(root, inception.title)
      expect(tree.find(root, inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, skyfall)
      tree.delete(root, skyfall.title)
      expect(tree.find(root, skyfall.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, tomorrow)
      tree.insert(root, world)
      tree.delete(root, world.title)
      expect(tree.find(root, world.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, goldeneye)
      tree.insert(root, license)
      tree.delete(root, license.title)
      expect(tree.find(root, license.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Casino Royale: 87\nOn Her Majesty's Secret Service: 80\nTomorrow Never Dies: 93\nThe Spy Who Loved Me: 72\nInception: 86\nThe World Is Not Enough: 92\nGoldenEye: 94\nBraveheart: 78\nDie Another Day: 91\nLicense To Kill: 98\nSkyfall: 90\n"
       tree.insert(root, tomorrow)
       tree.insert(root, goldeneye)
       tree.insert(root, majesty)
       tree.insert(root, world)
       tree.insert(root, the_spy)
       tree.insert(root, inception)
       tree.insert(root, braveheart)
       tree.insert(root, die)
       tree.insert(root, skyfall)
       tree.insert(root, license)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Casino Royale: 87\nBraveheart: 78\nLicense To Kill: 98\nThe Spy Who Loved Me: 72\nInception: 86\nSkyfall: 90\nOn Her Majesty's Secret Service: 80\nDie Another Day: 91\nThe World Is Not Enough: 92\nGoldenEye: 94\nTomorrow Never Dies: 93\n"
       tree.insert(root, license)
       tree.insert(root, skyfall)
       tree.insert(root, die)
       tree.insert(root, braveheart)
       tree.insert(root, inception)
       tree.insert(root, the_spy)
       tree.insert(root, world)
       tree.insert(root, majesty)
       tree.insert(root, goldeneye)
       tree.insert(root, tomorrow)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
