class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @is_fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @is_fired_upon
  end

  def fire_upon
    @is_fired_upon = true
    if @ship != nil
      @ship.hit
    end
  end

  def render(is_showing_ship = false)
    if @ship == nil && @is_fired_upon == true
      "M"
    elsif @is_fired_upon == true && @ship.sunk? == true
      "X"
    elsif @ship != nil && @is_fired_upon == true
      "H"
    elsif is_showing_ship == true && @ship != nil
      "S"
    else
      "."
    end
  end
end
