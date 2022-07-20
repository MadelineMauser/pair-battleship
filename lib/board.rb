class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1] }
    coordinates_empty?(coordinates) && coordinates_eq_ship_length?(ship, coordinates) && (is_horizontal?(letters, numbers) || is_vertical?(letters, numbers))
  end

  #### Helper methods for valid_placement? method
  def coordinates_empty?(coordinates)
    coordinates.all? { |coordinate| cells[coordinate].empty? }
  end

  def coordinates_eq_ship_length?(ship, coordinates)
    ship.length == coordinates.size
  end

  def is_horizontal?(letters, numbers)
    letters.uniq.count == 1 && (numbers.min..numbers.max).to_a == numbers
  end

  def is_vertical?(letters, numbers)
    numbers.uniq.count == 1 && (letters.min..letters.max).to_a == letters
  end
  ####

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates) == true

      cells.each do |coordinate, cell|
        if coordinates.any?(coordinate)
          cell.place_ship(ship)
        end
      end
    end

    def render(is_showing_ship = false)
      if is_showing_ship == false
        puts("  1 2 3 4 \nA #{cells["A1"].render} #{cells["A2"].render} #{cells["A3"].render} #{cells["A4"].render}\nB #{cells["B1"].render} #{cells["B2"].render} #{cells["B3"].render} #{cells["B4"].render}\nC #{cells["C1"].render} #{cells["C2"].render} #{cells["C3"].render} #{cells["C4"].render}\nD #{cells["D1"].render} #{cells["D2"].render} #{cells["D3"].render} #{cells["D4"].render}")
      else
        puts("  1 2 3 4 \nA #{cells["A1"].render(true)} #{cells["A2"].render(true)} #{cells["A3"].render(true)} #{cells["A4"].render(true)}\nB #{cells["B1"].render(true)} #{cells["B2"].render(true)} #{cells["B3"].render(true)} #{cells["B4"].render(true)}\nC #{cells["C1"].render(true)} #{cells["C2"].render(true)} #{cells["C3"].render(true)} #{cells["C4"].render(true)}\nD #{cells["D1"].render(true)} #{cells["D2"].render(true)} #{cells["D3"].render(true)} #{cells["D4"].render(true)}")
      end
    end
  end
end
