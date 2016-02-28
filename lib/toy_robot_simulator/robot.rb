module ToyRobotSimulator
  class Robot
    attr_reader :loc, :facing

    def initialize(x: 0, y: 0, facing: (Direction::NORTH))
      raise 'x or y coordinate out of bounds' if out_of_bounds? x, y

      @loc = {x: x, y: y}
      @facing = facing
    end

    # Formats a string used for reporting location of bot
    def report
      "#{@loc[:x]},#{@loc[:y]},#{@facing.upcase}"
    end

    # Places the robot at the given coordinates and facing
    # the given direction
    def place!(x, y, facing)

    end

    # Moves the robot in the direction it's facing
    def move!
      case @facing
        when Direction::NORTH
          @loc[:y] += 1 unless out_of_bounds? @loc[:x], @loc[:y] + 1
        when Direction::EAST
          @loc[:x] -= 1 unless out_of_bounds? @loc[:x] - 1, @loc[:y]
        when Direction::SOUTH
          @loc[:y] -= 1 unless out_of_bounds? @loc[:x], @loc[:y] - 1
        when Direction::WEST
          @loc[:x] += 1 unless out_of_bounds? @loc[:x] + 1, @loc[:y]
        else
          raise %q{Don't know which direction to move}
      end
    end

    # Rotates the robot 90 deg left
    def left!

    end

    # Rotates the robot 90 deg right
    def right!

    end

    def on_table?

    end

    # Creates and runs a robot from a file input
    def self.run_from_file(path)
      File.open(path, 'r') do |f|
        robot = nil

        f.each_line do |line|
          cmd = parse_command(line)

          if robot
            case cmd[:cmd]
              when :move
                robot.move!

            end

          else
            # Robot doesn't exist yet. Ignore
            # all commands until a place comes in
            if cmd[:cmd] == :place
              robot = new x: cmd[:x], y: cmd[:y],
                          facing: Direction.str_to_direction(cmd[:dir])
            end

          end
        end

        robot
      end
    end

    protected

    # Is the given location out of bounds?
    def out_of_bounds?(x, y, lower_limit = 0, upper_limit = 4)
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