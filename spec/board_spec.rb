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
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to(eq(false))
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to(eq(false))
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to(eq(false))
    expect(@board.valid_placement?(@cruiser, ["C1", "B1"])).to(eq(false))
  end

  it("coordinates cant be diagonal ") do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C4"])).to(eq(false))
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to(eq(false))
  end

  it("should have valid placement") do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to(eq(true))
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to(eq(true))
  end

  it("should be able to place ships") do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]
    expect(cell_1.ship).to(eq(@cruiser))
    expect(cell_2.ship).to(eq(@cruiser))
    expect(cell_3.ship).to(eq(@cruiser))
    expect(cell_3.ship == cell_2.ship).to(eq(true))
  end
end
