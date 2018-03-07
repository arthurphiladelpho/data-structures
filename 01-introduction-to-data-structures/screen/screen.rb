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
    @screen[y][x] = pixel if x < @width
    puts @screen
    puts @screen[y]
    puts @screen[y][x]
  end

  def at(x, y)
    return @screen[y][x]
  end

  private

  def inbounds(x, y)
  end

end