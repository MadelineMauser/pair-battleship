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
    puts("Welcome to BATTLESHIP \nEnter p to play. Enter q to quit")
    input = gets.chomp.downcase

    if input == "p"
      play
    elsif input == "q"
    else
      puts("Invalid input.")
      welcome
    end
  end

  def play
    ## Place Computer ships on board
    @computer_board.place(@computer_cruiser, generate_coordinates(@computer_cruiser, @computer_board))
    @computer_board.place(@computer_sub, generate_coordinates(@computer_sub, @computer_board))
    player_setup
  end

    ##
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

  def player_setup
    puts("I have laid out my ships on the grid \n" + "You now need to lay out your ships. \n" + "The Cruiser is #{@player_cruiser.length} units long and the Submarine is #{@player_sub.length} units long. \n" + "#{@player_board.render} \n" + "Enter the squares for the Cruiser.(3 spaces):")
    player_cruiser_coordinates = []
    until player_cruiser_coordinates != []
      user_coordinates = gets.chomp.upcase.split(" ")

      if @player_board.valid_placement?(@player_cruiser, user_coordinates) == false
        puts("That is an invalid coordinate. Please try again:")
      else
        player_cruiser_coordinates = user_coordinates
      end
    end

    @player_board.place(@player_cruiser, player_cruiser_coordinates)
    @player_board.render(true)

    #
    puts("Enter the squares for the Submarine (2 spaces):")
    player_sub_coordinates = []
    until player_sub_coordinates != []
      user_coordinates = gets.chomp.upcase.split(" ")

      if @player_board.valid_placement?(@player_sub, user_coordinates) == false
        puts("That is an invalid coordinate. Please try again:")
      else
        player_sub_coordinates = user_coordinates
      end
    end

    @player_board.place(@player_sub, player_sub_coordinates)
    @player_board.render(true)
  end
end
