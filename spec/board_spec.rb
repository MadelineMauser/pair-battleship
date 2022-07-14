require "./lib/board"
require "./lib/ship"
require "./lib/cell"


RSpec.describe(Board) do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it("exists") do
    expect(@board).to(be_a(Board))
  end

  it("cells on board") do
    expect(@board.cells.length).to(eq(16))
    expect(@board.cells["A1"]).to(be_a(Cell))
  end

  it("can test for vaild coordinate") do
    expect(@board.valid_coordinate?("A1")).to(eq(true))
    expect(@board.valid_coordinate?("D4")).to(eq(true))
    expect(@board.valid_coordinate?("A5")).to(eq(false))
    expect(@board.valid_coordinate?("E1")).to(eq(false))
    expect(@board.valid_coordinate?("A22")).to(eq(false))
  end

  it("num.of coordinates eq.to ship size") do
    @cruiser = Ship.new("Cruiser", 3)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to(eq(false))
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to(eq(false))
  end

  it("can make sure coordinates are consecutive") do
    @cruiser = Ship.new("Cruiser", 3)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to(eq(false))
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A3"])).to(eq(true))
    expect(@board.valid_placement?(@cruiser, ["A1", "B1", "C1"])).to(eq(true))
  end
end
