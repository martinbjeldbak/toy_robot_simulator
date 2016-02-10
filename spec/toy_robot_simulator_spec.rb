require 'spec_helper'

describe ToyRobotSimulator do
  it 'has a version number' do
    expect(ToyRobotSimulator::VERSION).not_to be nil
  end

  it 'can be placed' do
    robot = Robot.new(0, 0, ToyRobotSimulator::NORTH)
    expect(robot.location).to eq(x: 0, y: 0)
  end
end
