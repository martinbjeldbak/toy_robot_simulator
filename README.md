# ToyRobotSimulator [![Travis Build Status](https://travis-ci.org/martinbjeldbak/toy_robot_simulator.svg?branch=master)](https://travis-ci.org/martinbjeldbak/toy_robot_simulator)

This library allows simulation of a Robot moving around a 5x5 square board, where (0,0) is the origin at the South-Eastern most corner of the board.

Technical requirements of the robot can be seen in the document titled "Code Test - Robot.pdf" in this repository.

This project is part of [lookahead.com.au](http://www.lookahead.com.au/)'s recruitment process.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toy_robot_simulator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install toy_robot_simulator

## Usage

```ruby
require 'toy_robot_simulator'

ToyRobotSimulator::Simulator.run_from_file_report_stdout('~/situation1.txt')
-> 0,1,NORTH
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/martinbjeldbak/toy_robot_simulator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

