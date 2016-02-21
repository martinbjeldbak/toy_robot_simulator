require 'spec_helper'

module ToyRobotSimulator
  describe Robot do
    it 'has a version number' do
      expect(VERSION).not_to be nil
    end

    context 'when placing robot in valid configurations' do
      it 'it creates new instances' do
        robot = Robot.new(0, 0, Direction::NORTH)
        expect(robot.location).to eq x: 0, y: 0
        expect(robot.facing).to eq(Direction::NORTH)

        robot = Robot.new(1, 0, Direction::EAST)
        expect(robot.location).to eq x: 1, y: 0
        expect(robot.facing).to eq(Direction::EAST)

        robot = Robot.new(3, 2, Direction::NORTH)
        expect(robot.location).to eq x: 3, y: 2
        expect(robot.facing).to eq(Direction::NORTH)
      end

      describe '.report_s' do
        let(:robot) { Robot.new(4, 4, Direction::SOUTH) }

        subject { robot.report_s }

        it { is_expected.to eq '4,4,SOUTH' }
      end

      context 'when placing robot in invalid configurations' do
        it 'throws errors' do
          expect { Robot.new( 5,  0, Direction::NORTH) }.to raise_error RuntimeError
          expect { Robot.new( 0,  5, Direction::NORTH) }.to raise_error RuntimeError
          expect { Robot.new( 5,  5, Direction::NORTH) }.to raise_error RuntimeError
          expect { Robot.new(-1,  0, Direction::NORTH) }.to raise_error RuntimeError
          expect { Robot.new( 0, -1, Direction::NORTH) }.to raise_error RuntimeError
          expect { Robot.new(-1, -1, Direction::NORTH) }.to raise_error RuntimeError
        end
      end
    end
  end
end
