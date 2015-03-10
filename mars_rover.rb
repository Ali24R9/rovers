require_relative "lib/rover"
require_relative 'lib/plateau'

  def start
    puts "Press L to land the rovers"

    input = gets.chomp
    input = input.downcase
    if input == 'l'
      puts "Indicate where you would like rover #1 to land without spaces(for example: 1,2):"
      rover1_coordinates = gets.chomp

      puts "Indicate the direction you want rover #1 to face:"
      rover1_direction = gets.chomp.upcase

      puts "Indicate the coordinates for rover #2 as you did with rover #1: "
      rover2_coordinates = gets.chomp

      puts "Indicate the direction you want rover #2 to face:"
      rover2_direction = gets.chomp.upcase

      plateau = Plateau.new(5, 5)
      rover1 = Rover.new(rover1_coordinates[0].to_i, rover1_coordinates[2].to_i, rover1_direction)
      rover2 = Rover.new(rover2_coordinates[0].to_i, rover2_coordinates[2].to_i, rover2_direction)

      instruct_rovers(rover1, rover2, plateau)
    end
  end 

  def instruct_rovers(rover1, rover2, plateau)
    puts "Please enter the desired instructions for rover #1 without spaces"
    instructions1 = gets.chomp.upcase.strip

    puts "Please enter the desired instructions for rover #2"
    instructions2 = gets.chomp.upcase.strip

    Rover.multiple_instructions(rover1, instructions1, rover2, instructions2, plateau)
    puts "Rover #1's final output is: #{rover1.output}"
    puts "Rover #2's final output is: #{rover2.output}"
    puts "---------"
    start
  end

  start