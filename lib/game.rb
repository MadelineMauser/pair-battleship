class Game

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
  end

  def welcome
    puts "Welcome to BATTLESHIP \nEnter p to play. Enter q to quit"
    input = gets.chomp.downcase
    if input == "p"
      play
    elsif input == "q"

    else puts "Invalid input."
      welcome
    end
  end

  def play

    ## Place Computer ships on board
    @computer_board.place(@computer_cruiser, generate_coordinates(@computer_cruiser, @computer_board))
    @computer_board.place(@computer_sub, generate_coordinates(@computer_sub, @computer_board))

    ##

  end

  def generate_coordinates(ship, board)
    generated_coordinates = []
    until generated_coordinates != []
      working_coordinates = @computer_board.cells.keys.sample(ship.length)
      if board.valid_placement?(ship, working_coordinates)
        generated_coordinates = working_coordinates
      end
    end
    return generated_coordinates
  end
end
