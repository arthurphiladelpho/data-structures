require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    
    @screen = []

    @height.times do |i|
      @screen << []
    end

  end

  def insert(pixel, x, y)
  #  Test
  #  pixel = Pixel.new(255, 200, 175, 1, 1)
  #  screen.insert(pixel, 1, 1)
     @screen[y][x] = pixel if x < @width
  end

  def at(x, y)
    return @screen[y][x]
    # @screen.each { |i|
    #   if i == y
    #     @screen[i].each { |j|
    #       if j == x
    #         return @screen[y][x]
    #       end
    #     }
    #   end
    # }
  end

  private

  def inbounds(x, y)
  end

end