require 'spec_helper'

describe ToyRobotSimulator do
  it 'has a version number' do
    expect(ToyRobotSimulator::VERSION).not_to be nil
  end

  context 'when placing robot in valid configurations' do
      it 'it creates new instances' do
        robot = Robot.new(0, 0, ToyRobotSimulator::NORTH)
        expect(robot.location).to eq(x: 0, y: 0)
        expect(robot.facing).to eq(ToyRobotSimulator::NORTH)

        robot = Robot.new(1, 0, ToyRobotSimulator::EAST)
        expect(robot.location).to eq(x: 1, y: 0)
        expect(robot.facing).to eq(ToyRobotSimulator::EAST)

        robot = Robot.new(3, 2, ToyRobotSimulator::NORTH)
        expect(robot.location).to eq(x: 3, y: 2)
        expect(robot.facing).to eq(ToyRobotSimulator::NORTH)
    end

    context 'when placing robot in invalid configurations' do
      it 'throws errors' do
        expect { Robot.new(5, 0,   ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
        expect { Robot.new(0, 5,   ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
        expect { Robot.new(5, 5,   ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
        expect { Robot.new(-1, 0,  ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
        expect { Robot.new(0, -1,  ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
        expect { Robot.new(-1, -1, ToyRobotSimulator::NORTH) }.to raise_error(RuntimeError)
      end
    end
  end
end
