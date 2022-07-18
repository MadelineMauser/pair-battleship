class Player
  attr_reader :player_board, :computer_board

  def initialize(board)
    @player_board = Board.new
    @computer_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_sub = Ship.new("Submarine", 2)
  end

  def player_setup
    puts("I have laid out my ships on the grid \n" + "You now need to lay out your ships. \n" + "The Cruiser is #{@cruiser.length} units long and the Submarine is #{@submarine.length} units long. \n" + "#{@player_board.board_render} \n" + "Enter the squares for the Cruiser, one at time.(3 spaces):")
    player_cruiser_coordinates = []
    until player_cruiser_coordinates.count != []
      user_coordinates = gets.chomp.upcase

      if @player_board.valid_placement?(@player_cruiser, user_coordinates) == false
        puts("That is an invalid coordinate. Please try again:")
      elsif @player_board.valid_placement?(@player_cruiser, user_coordinates) == true
        player_cruiser_coordinates << user_coordinates
      end
    end

    @player_board.place(@player_cruiser, player_cruiser_coordinates)
    player_sub_coordinates = []
    until player_sub_coordinates.count != []
      user_coordinates = gets.chomp.upcase

      if @player_board.valid_placement?(@player_sub, user_coordinates) == false
        puts("That is an invalid coordinate. Please try again:")
      elsif @player_board.valid_placement?(@player_sub, user_coordinates) == true
        player_sub_coordinates << user_coordinates
      end
    end

    @player_board.place(@player_sub, player_sub_coordinates)
  end
end
