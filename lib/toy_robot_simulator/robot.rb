module ToyRobotSimulator
  include Direction

  class Robot
    attr_reader :location, :facing

    def initialize(x = 0, y = 0, facing)
      raise 'x or y coordinate out of bounds' if position_out_of_bounds? x, y

      @location = {x: x, y: y}
      @facing = facing
    end

    # Formats a string used for reporting location of bot
    def report_s
      "#{@location[:x]},#{@location[:y]},#{@facing.upcase}"
    end

    def output_string

    end

    def self.from_file(path)
      File.open(path, 'r') do |f|
        placement = f.readline.split(' ')[1].split(',')

        puts("x: #{placement[0].to_i}, y: #{placement[1].to_i}, f: #{placement[2]}")

        robot = new placement[0].to_i, placement[1].to_i, Direction.str_to_direction(placement[2])

        puts(robot.report_s)

        #f.each_line do |line|
        #  puts(line)
        #end
      end
    end

    private

    # Is the current location out of bounds?
    def position_out_of_bounds?(x, y, lower_limit = 0, upper_limit = 4)
      (x < lower_limit or y < lower_limit) or (x > upper_limit or y > upper_limit)
    end
  end
end