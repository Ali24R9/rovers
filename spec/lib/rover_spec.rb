require "spec_helper"
require 'rover'

describe "Rover" do 
  it "should be able to recieve several messages containing directions on where to move" do 
    rover1 = Rover.new(1,2,"N")
    rover2 = Rover.new(3,3,"E")

    plateau = Plateau.new(5,5)
    Rover.multiple_instructions(rover1, "LMLMLMLMM", rover2, "MMRMMRMRRM", plateau)
    expect("#{rover1.output} and #{rover2.output}").to eq "1 3 N and 5 1 E" 
  end
end 