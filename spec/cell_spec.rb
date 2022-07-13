require "./lib/ship"
require "./lib/cell"


RSpec.describe(Cell) do
  before(:each) do
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new(C3)
    @cruiser = Ship.new("Cruiser", 3)
  end

  it("exists") do
    expect(@cell_1).to(be_a(Cell))
  end

  it("has a cell coordinate") do
    expect(@cell_1.coordinate).to(eq("B4"))
  end

  it("can check if there is a ship") do
    expect(@cell_1.ship).to(eq(nil))
  end

  it("has an empty cell") do
    expect(@cell_1.empty?).to(eq(true))
  end

  it("can place a ship on cell") do
    @cell_1.place_ship(@cruiser)
    expect(@cell_1.ship).to(eq(@cruiser))
    expect(@cell_1.empty?).to(eq(false))
  end

  it("can check whether it's been fired upon") do
    @cell_1.place_ship(@cruiser)
    expect(@cell_1.fired_upon?).to(eq(false))
    @cell_1.fire_upon
    expect(@cell_1.ship.health).to(eq(2))
    expect(@cell_1.fired_upon?).to(eq(true))
  end

  it("can render an empty cell") do
    expect(@cell_1.render).to(eq("."))
  end

  it("can render a miss") do
    @cell_1.fire_upon
    expect(@cell_1.render).to(eq("M")
  end

  it("can render as blank while containing a ship") do
    @cell_2.place_ship("cruiser")
    expect(@cell_2.render).to(eq("."))
  end

  it("can render a contained ship when needed") do
    @cell_2.place_ship("cruiser")
    expect(@cell_2.render(true)).to(eq("S"))
  end

  it("can render a hit") do
    @cell_2.place_ship("cruiser")
    @cell_2.fire_upon
    expect(@cell_2.render).to(eq("H"))
  end

  it("can render a sunk ship") do
    @cell_2.place_ship("cruiser")
    @cell_2.fire_upon
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to(eq(true))
    expect(@cell_2.render).to(eq("X"))
  end
end
