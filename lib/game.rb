class Game

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

  end
end
