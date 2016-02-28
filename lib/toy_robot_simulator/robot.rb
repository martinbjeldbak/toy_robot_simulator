module ToyRobotSimulator
  class Robot
    attr_reader :loc, :facing, :report_history

    def initialize(x = 0, y = 0, facing = Direction::NORTH)
      place!(x, y, facing)
      @report_history = []
    end

    # Formats a string used for reporting location of bot and
    # adds it to history
    def report
      report_str = "#{@loc[:x]},#{@loc[:y]},#{@facing.upcase}"
      @report_history << report_str
      report_str
    end

    def latest_report
      @report_history.last
    end

    # Places the robot at the given coordinates and facing
    # the given direction
    def place!(x, y, facing = nil)
      raise 'x or y coordinate out of bounds' if out_of_bounds? x, y

      @facing = facing if facing
      @loc = {x: x, y: y}
    end

    # Moves the robot in the direction it's facing
    def move!
      case @facing
        when Direction::NORTH
          @loc[:y] += 1 unless out_of_bounds? @loc[:x], @loc[:y] + 1
        when Direction::EAST
          @loc[:x] += 1 unless out_of_bounds? @loc[:x] + 1, @loc[:y]
        when Direction::SOUTH
          @loc[:y] -= 1 unless out_of_bounds? @loc[:x], @loc[:y] - 1
        when Direction::WEST
          @loc[:x] -= 1 unless out_of_bounds? @loc[:x] - 1, @loc[:y]
        else
          raise %q{Don't know which direction to move}
      end
    end

    # Rotates the robot 90 deg left
    def left!
      case @facing
        when Direction::NORTH
          @facing = Direction::WEST
        when Direction::EAST
          @facing = Direction::NORTH
        when Direction::SOUTH
          @facing = Direction::EAST
        when Direction::WEST
          @facing = Direction::SOUTH
        else
          raise %q{Cannot rotate left}
      end
    end

    # Rotates the robot 90 deg right
    def right!
      case @facing
        when Direction::NORTH
          @facing = Direction::EAST
        when Direction::EAST
          @facing = Direction::SOUTH
        when Direction::SOUTH
          @facing = Direction::WEST
        when Direction::WEST
          @facing = Direction::NORTH
        else
          raise %q{Cannot rotate right}
      end
    end

    # Saves the robot's report history to file
    def reports_to_file(outfile)
      File.open(outfile, 'w') do |f|
        @report_history.each do |report|
          f.write report
        end
      end
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
                when :left
                  robot.left!
                when :right
                  robot.right!
                when :report
                  robot.report
                when :place
                  robot.place!(cmd[:opts][:x],
                               cmd[:opts][:y],
                               cmd[:opts][:dir])
                # TODO: Need placement cmd, refactor with opts
                else
                  raise "I don't know how to run command '#{cmd}'"
              end

            else
              # Robot doesn't exist yet. Ignore
              # all commands until a place comes in
              if cmd[:cmd] == :place
                robot = new cmd[:opts][:x], cmd[:opts][:y],
                            Direction.str_to_direction(cmd[:opts][:dir])
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
          { cmd: :place, opts: { x: args[0].to_i, y: args[1].to_i, dir: args[2] } }
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