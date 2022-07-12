require "./lib/ship"
require "rspec"


RSpec.describe(Class) do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it("exists") do
    expect(@cruiser).to(be_an_instance_of(Ship))
  end

  it("name") do
    expect(@cruiser.name).to(eq("Cruiser"))
  end

  it("has length") do
    expect(@cruiser.length).to(eq(3))
  end

  it("has health") do
    expect(@cruiser.health).to(eq(3))
  end

  it("has sunk?") do
    expect(@cruiser.sunk?).to(eq(false))
  end
end
