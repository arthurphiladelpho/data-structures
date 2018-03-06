# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members << person
  end

  def leave(person)
    members.delete(person)
  end

  def front
    members.first
  end

  def middle
    return members[((members.length)/2)]
  end

  def back
    members.last
  end

  def search(person)
    members.each { |x|
      if person == x
        return person
      end
    }
    # nil is returned if person isn't found.
    return nil
  end

  private

  def index(person)
    members.each_index {|i|
      if members[i] == person
        return i
      end
    }
    # nil is returned if person isn't found.
    return nil
  end

end