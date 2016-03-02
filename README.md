# ToyRobotSimulator [![Travis Build Status](https://travis-ci.org/martinbjeldbak/toy_robot_simulator.svg?branch=master)](https://travis-ci.org/martinbjeldbak/toy_robot_simulator)

This library allows simulation of a Robot moving around a 5x5 square board, where (0,0) is the origin at the South-Eastern most corner of the board.

Technical requirements of the robot can be seen in the document titled "Code Test - Robot.pdf" in this repository.

This project is part of [lookahead.com.au](http://www.lookahead.com.au/)'s recruitment process.

## Installation

Clone this repository:
```sh
$ git clone git@github.com:martinbjeldbak/toy_robot_simulator.git
```

Build the gem:
```sh
$ cd toy_robot_simulator
$ gem build toy_robot_simulator.gemspec
```

This will create a ``toy_robot_simulator.gem`` file. You can now install it from this file:

```sh
$ gem install ./toy_robot_simulator-0.1.0.gem
```

## Usage

This simulator can be used from the command line, and as a library.

To use it from the command line, simply run the ``bin/toy_robot_simulator`` executable with a file of commands as input. As an example, we can simulate a robot with the ``situation1.txt`` file in the ``spec/fixtures/`` folder, as shown below:

```
situation1.txt
PLACE 0,0,NORTH
MOVE
REPORT
```

```sh
$ bin/toy_robot_simulator spec/fixtures/situation1.txt
$ 0,1,NORTH
```

Alternatively, to use it as a library, you can do the following:

```ruby
require 'toy_robot_simulator'

# Initialize a new robot at position (0,0), facing North.
robot = ToyRobotSimulator::Robot.new(0, 0, ToyRobotSimulator::Direction::NORTH)
robot.move!
robot.right!
robot.move!
robot.move!
robot.report # => '2,1,NORTH'
```

## Commands

The following 5 commands can be used in the text file given to the robot. They use the underlying library API also accessible from importing the simulator into your own program.

### PLACE
Places the robot at the desired location on the 5x5 board. This command takes 3 parameters, ``x``, ``y``, and ``f``. Where ``x`` and ``y`` are limited to the range ``[0, 4]``. ``f`` defines the direction. Placing the robot at an invalid location (i.e. ``(-1, -1)``) will be ignored.

Placement can happen at any point in the command log.

#### Example
```
PLACE 3,2,EAST
```

### MOVE
Moves the robot forward one space in the direction that its facing.

#### Example

The below commands move the robot into the position ``4,2,EAST``:
```
PLACE 3,2,EAST
MOVE
```

### LEFT
Rotatates the robot 90 degrees to the left.

#### Example
The below command rotates the robot from facing East to South.
```
PLACE 3,2,EAST
LEFT
```

### RIGHT
Rotatates the robot 90 degrees to the right.
#### Example
The below command rotates the robot from facing East to North.
```
PLACE 3,2,EAST
RIGHT
```

### REPORT
Reports the current ``x``, ``y``, and ``f`` position.
#### Example
The below commands output ``3,2,EAST``.
```
PLACE 3,2,EAST
REPORT
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/martinbjeldbak/toy_robot_simulator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

