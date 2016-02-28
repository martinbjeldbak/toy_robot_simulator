module ToyRobotSimulator
  module Direction
    # Naieve implementation. Could implement
    # private method to take +/- 1 and refactor
    # this enum to use integers.

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

