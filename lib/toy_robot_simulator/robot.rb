module ToyRobotSimulator
  include Direction

  class Robot
    attr_reader :location, :facing

    def initialize(x, y, facing)
      raise 'x or y coordinate out of bounds' if position_out_of_bounds? x, y

      @location = {x: x, y: y}
      @facing = facing
    end

    # Formats a string used for reporting location of bot
    def report
      "#{@location[:x]},#{@location[:y]},#{@facing.upcase}"
    end

    def place!(x, y, facing)

    end

    def move!

    end

    def left!

    end

    def right!

    end

    def on_table?

    end

    # Creates and runs a robot from a file input
    def self.run_from_file(path)
      File.open(path, 'r') do |f|
        placement = f.readline.split(' ')[1].split(',')

        robot = new placement[0].to_i,
                    placement[1].to_i,
                    Direction.str_to_direction(placement[2])

        f.each_line do |line|
          # TODO: Parse all following commands
          puts(line)
        end

        robot
      end
    end

    private

    # Is the given location out of bounds?
    def position_out_of_bounds?(x, y, lower_limit = 0, upper_limit = 4)
      (x < lower_limit or y < lower_limit) or (x > upper_limit or y > upper_limit)
    end
  end
end