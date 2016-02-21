class Robot
  attr_reader :location, :facing

  def initialize(x = 0, y = 0, facing)
    raise 'x or y coordinate out of bounds' if position_out_of_bounds? x, y

    @location = {x: x, y: y}
    @facing = facing
  end

  private

  def position_out_of_bounds?(x, y, lower_limit = 0, upper_limit = 4)
    (x < lower_limit or y < lower_limit) or (x > upper_limit or y > upper_limit)
  end

  def output_string

  end

  def self.from_file(path)
    File.open(path, 'r') do |f|
      f.each_line do |line|
        puts(line)
      end
    end
  end

end