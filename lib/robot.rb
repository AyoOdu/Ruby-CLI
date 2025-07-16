# frozen_string_literal: true

class Robot
  NORTH = 'N'
  EAST = 'E'
  SOUTH = 'S'
  WEST = 'W'
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze
  GRID_SIZE = 10

  def initialize
    @placed = false
  end

  def place(x_coordinate, y_coordinate, facing)
    return unless valid_position?(x_coordinate, y_coordinate) && DIRECTIONS.include?(facing)

    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @facing = facing
    @placed = true
  end

  def move
    return unless @placed

    local_x = @x_coordinate
    local_y = @y_coordinate

    case @facing
    when NORTH then local_y += 1
    when EAST then local_x += 1
    when SOUTH then local_y -= 1
    when WEST then local_x -= 1
    end

    return unless valid_position?(local_x, local_y)
    
    @x_coordinate = local_x
    @y_coordinate = local_y
  end
  

  def left
    return unless @placed

    @facing = DIRECTIONS.rotate(-1)[DIRECTIONS.index(@facing)]
  end

  def right
    return unless @placed

    @facing = DIRECTIONS.rotate(1)[DIRECTIONS.index(@facing)]
  end

  def report
    return unless @placed

    puts "#{@x_coordinate},#{@y_coordinate},#{@facing}"
  end

  private

  def valid_position?(x, y)
    in_bounds = x.between?(0, GRID_SIZE - 1) && y.between?(0, GRID_SIZE - 1)
    out_of_gutter = !((x == 6 || x == 5) && (y == 6 || y == 5))

    in_bounds && out_of_gutter
  end
end
