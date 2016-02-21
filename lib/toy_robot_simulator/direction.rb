module ToyRobotSimulator
  module Direction
    DIRECTIONS = [
        NORTH = 'North',
        EAST = 'East',
        SOUTH = 'South',
        WEST = 'West',
    ]

    def self.str_to_direction(str)
      case str.downcase
        when 'north'
          NORTH
        when 'east'
          EAST
        when 'south'
          SOUTH
        when 'west'
          WEST
        else
          raise "Direction string given '#{str}' not valid"
      end
    end
  end
end

