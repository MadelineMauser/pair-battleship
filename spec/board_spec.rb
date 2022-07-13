require "./lib/board"
require "./lib/ship"
require "./lib/cell"


RSpec.describe(Board) do
  before(:each) do
    @board = Board.new
  end

  it("exists") do
    expect(@board).to(be_a(Board))
  end

  it("cells on board") do
    expect(@board.cells.length).to(eq(16))
    expect(@board.cells["A1"]).to(be_a(Cell))
  end
end
