class Game
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_sub = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
    @is_playing = false
  end

  # Welcome screen
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

  # Start of game
  def play
    @is_playing = true

    ### Place Computer ships on board
    @computer_board.place(@computer_cruiser, generate_coordinates(@computer_cruiser, @computer_board))
    @computer_board.place(@computer_sub, generate_coordinates(@computer_sub, @computer_board))
    player_setup
    while @is_playing == true do
      turn
    end
  end_game
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
  ###

  #### Place player ships on board
  def player_setup
    puts("I have laid out my ships on the grid \n" + "You now need to lay out your ships. \n" + "The Cruiser is #{@player_cruiser.length} units long and the Submarine is #{@player_sub.length} units long. \n" + "#{@player_board.render} \n" + "Enter the squares for the Cruiser (3 spaces. Ex. A1 A2 A3):")

    # Player cruiser
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


    # Player submarine
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
  end
  ####

  ##### Player and computer take turns firing upon each other
  def turn
    # Displays boards
    puts "COMPUTER BOARD".center(40, "=")
    @computer_board.render
    puts "PLAYER BOARD".center(40, "=")
    @player_board.render(true)

    # Player turn
    puts "Enter the coordinate for your shot:"
    inputted_coordinate = gets.chomp.upcase

    until @player_board.valid_coordinate?(inputted_coordinate)
      puts "Please enter a valid coordinate:"
      inputted_coordinate = gets.chomp.upcase
    end

    until @computer_board.cells[inputted_coordinate].fired_upon? == false
      puts "You've already fired on this coordinate. \nPlease choose a new coordinate:"
      inputted_coordinate = gets.chomp.upcase
    end

    @computer_board.cells[inputted_coordinate].fire_upon

    working_cell_mark = @computer_board.cells[inputted_coordinate].render
    if working_cell_mark == "H"
      puts "Your shot on #{inputted_coordinate} was a hit!"
    elsif working_cell_mark == "X"
      puts "Your shot on #{inputted_coordinate} was a hit! My ship has sunk!"
    else
      puts "Your shot on #{inputted_coordinate} was a miss."
    end
  end_game_check

    ## Computer turn
    # Chooses a cell to fire upon
    computer_coordinate = nil
    until computer_coordinate != nil
      working_coordinate = @computer_board.cells.keys.sample

      if @player_board.cells[working_coordinate].fired_upon? == false
        computer_coordinate = working_coordinate
      end
    end
    @player_board.cells[computer_coordinate].fire_upon


    # Displays computer result
    computer_cell_mark = @player_board.cells[computer_coordinate].render
    if computer_cell_mark == "H"
      puts "My shot on #{computer_coordinate} was a hit!"
    elsif computer_cell_mark == "X"
      puts "My shot on #{computer_coordinate} was a hit! Your ship has sunk!"
    else
      puts "My shot on #{computer_coordinate} was a miss."
    end
  end_game_check
  end
  #####

  def end_game_check # Checks whether win or loss conditions have been met
    if (@computer_cruiser.sunk? && @computer_sub.sunk?) || (@player_cruiser.sunk? && @player_sub.sunk?)
      @is_playing = false
    end
  end

  def end_game # Informs player of win or loss
    puts "COMPUTER BOARD".center(40, "=")
    @computer_board.render(true)
    puts "PLAYER BOARD".center(40, "=")
    @player_board.render(true)
    if @computer_cruiser.sunk? && @computer_sub.sunk?
      puts "You won!"
    else
      puts "I won!"
    end
  end
end
