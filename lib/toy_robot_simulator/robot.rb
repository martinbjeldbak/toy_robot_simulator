class Robot
  attr_reader :location, :facing

  def initialize(x = 0, y = 0, facing)
    if position_out_of_bounds?(x, y)
      raise 'x or y coordinate out of bounds'
    end

    @location = {x: x, y: y}
    @facing = facing
  end

  private

  def position_out_of_bounds?(x, y, upper_limit = 4, lower_limit = 0)
    (x < lower_limit or y < lower_limit) or (x > upper_limit or y > upper_limit)
  end

end