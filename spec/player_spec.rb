require "./lib/cell"
require "./lib/ship"
require "./lib/board"
require "./lib/game"
require "./lib/player"
require "pry"


RSpec.describe(Player) do
  before(:each) do
    @board = Board.new
    @player = Player.new(@board)
  end

  it("exists") do
    expect(@player).to(be_an(Player))
  end
end
