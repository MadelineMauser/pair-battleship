require "./lib/ship"
require "./lib/cell"


RSpec.describe(Cell) do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it("exists") do
    expect(@cell).to(be_a(Cell))
  end

  it("has a cell coordinate") do
    expect(@cell.coordinate).to(eq("B4"))
  end

  xit("can check if there is a ship") do
    expect(@ship.cell).to(eq(nil))
  end

  xit("has an empty cell") do
    expect(@ship.empty?).to(eq(true))
  end

  xit("can place a ship on cell") do
    @cell.place_ship(@cruiser)
    expect(@cell.ship).to(eq(false))
  end
end
