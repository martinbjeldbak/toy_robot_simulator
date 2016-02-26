module ToyRobotSimulator
  include Direction

  class Robot
    attr_reader :location, :facing

    def initialize(x: 0, y: 0, facing: (ToyRobotSimulator::NORTH))
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

        robot = new x: placement[0].to_i,
                    y: placement[1].to_i,
                    facing: Direction.str_to_direction(placement[2])

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

    def self.parse_command(cmd_str)
      cmd = cmd_str.downcase.split(' ')

      case cmd.first
        when 'place'
          args = cmd[1].split(',')
          { cmd: :place, x: args[0].to_i, y: args[1].to_i, dir: args[2] }
        when 'move'
          { cmd: :move}
        when 'left'
          { cmd: :left}
        when 'right'
          { cmd: :right}
        when 'report'
          { cmd: :report}
        else
          raise "Could not parse command '#{cmd_str}'"
      end
    end
  end
end