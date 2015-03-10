require_relative 'plateau'

class Rover 

  attr_accessor :x, :y, :direction, :id

  def initialize(x, y, direction, id=nil)
    @direction = direction
    @x = x
    @y = y
    @id = id
  end

  def turn(requested_direction)
    left_turns = {"N" => "W", "W" => "S", "S" => "E", "E" => "N"}
    right_turns = {"N" => "E", "E" => "S", "S" => "W", "W" => "N"}

    requested_direction = requested_direction.upcase

    case requested_direction
    when "L"
      self.direction = left_turns[self.direction]
    when "R" 
      self.direction = right_turns[self.direction]
    end  
  end


  def move(plateau)
    if self.direction == "N" && plateau.y != self.y
      self.y += 1
    elsif self.direction == "S" && self.y != 0
      self.y -= 1
    elsif self.direction == "E" && plateau.x != self.x
      self.x += 1
    elsif self.direction == "W" && self.x != 0
      self.x -= 1
    end
  end

  def instructions(instructions, plateau)
    instructions = instructions.split("")

    instructions.each do |message|
      if message == "M"
        self.move(plateau)
      elsif message == "L" || message == "R"
        self.turn(message)
      end 
    end
  end

  def self.multiple_instructions(rover1, instructions1, rover2, instructions2, plateau)
    rover1.instructions(instructions1, plateau)
    rover2.instructions(instructions2, plateau)    
  end

  def output
    ouput = "#{self.x} #{self.y} #{self.direction}"
  end

end