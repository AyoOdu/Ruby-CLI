# frozen_string_literal: true

class Robot
  NORTH = 'N'
  EAST = 'E'
  SOUTH = 'S'
  WEST = 'W'
  DIRECTIONS = [NORTH, EAST, SOUTH, WEST].freeze
  GRID_SIZE = 6

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

    case @facing
    when NORTH then @y_coordinate += 1 if @y_coordinate < GRID_SIZE - 1
    when EAST then @x_coordinate += 1 if @x_coordinate < GRID_SIZE - 1
    when SOUTH then @y_coordinate -= 1 if @y_coordinate.positive?
    when WEST then @x_coordinate -= 1 if @x_coordinate.positive?
    end
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

  def valid_position?(x_coordinate, y_coordinate)
    x_coordinate.between?(0, GRID_SIZE - 1) && y_coordinate.between?(0, GRID_SIZE - 1)
  end
end
