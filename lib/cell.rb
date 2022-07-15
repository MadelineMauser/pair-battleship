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
    if @ship != nil
      if @is_fired_upon == true && @ship.sunk? == true
        "X"
      elsif @is_fired_upon
        "H"
      elsif is_showing_ship == true
        "S"
      else
        "."
      end

    elsif @is_fired_upon == true
      "M"
    else
      "."
    end
  end
end
