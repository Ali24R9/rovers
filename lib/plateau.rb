class Plateau

  attr_accessor :coordinates, :x, :y
  
  def initialize(x,y)
    @coordinates = [x, y]
    @x = x
    @y = y
  end

end

# p = Plateau.new(1,3)
# puts p.coordinates
