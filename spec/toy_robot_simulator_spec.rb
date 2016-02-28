require 'spec_helper'

module ToyRobotSimulator
  describe Robot do
    it 'has a version number' do
      expect(VERSION).not_to be nil
    end

    context 'when placing robot in valid configurations' do
      it 'it creates new instances' do
        robot = Robot.new(0, 0, Direction::NORTH)
        expect(robot.loc).to eq x: 0, y: 0
        expect(robot.facing).to eq(Direction::NORTH)

        robot = Robot.new(1, 0, Direction::EAST)
        expect(robot.loc).to eq x: 1, y: 0
        expect(robot.facing).to eq(Direction::EAST)

        robot = Robot.new(3, 2, Direction::NORTH)
        expect(robot.loc).to eq x: 3, y: 2
        expect(robot.facing).to eq(Direction::NORTH)
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

    context 'method tests' do
      describe '.report_s' do
        let(:robot) { Robot.new(4, 4, Direction::SOUTH) }

        subject { robot.report }

        it { is_expected.to eq '4,4,SOUTH' }
      end

      describe '.parse_command' do
        before { Robot.send(:public, *Robot.protected_instance_methods) }

        it 'understands placement' do
          expect(Robot.parse_command('PLACE 2,4,NORTH')).to eq(
                                                                cmd: :place, x: 2, y: 4, dir: 'north')
          expect(Robot.parse_command('PLACE 0,0,EAST')).to eq(
                                                               cmd: :place, x: 0, y: 0, dir: 'east')
        end

        it 'understands move' do
          expect(Robot.parse_command('move')).to eq(cmd: :move)
        end

        it 'understands left' do
          expect(Robot.parse_command('left')).to eq(cmd: :left)
        end

        it 'understands right' do
          expect(Robot.parse_command('right')).to eq(cmd: :right)
        end

        it 'understands report' do
          expect(Robot.parse_command('report')).to eq(cmd: :report)
        end
      end

      describe '.move!' do
        context 'movable actions' do
          it 'moves north' do
            robot = Robot.new(0, 0, Direction::NORTH)
            expect { robot.move! }.to change { robot.loc[:y] }.from(0).to(1)
            expect { robot.move! }.to_not change { robot.loc[:x] }
          end

          it 'moves east' do
            robot = Robot.new(2, 4, Direction::EAST)
            expect { robot.move! }.to change { robot.loc[:x] }.from(2).to(1)
            expect { robot.move! }.to_not change { robot.loc[:y] }
          end

          it 'moves south' do
            robot = Robot.new(2, 4, Direction::SOUTH)
            expect { robot.move! }.to change { robot.loc[:y] }.from(4).to(3)
            expect { robot.move! }.to_not change { robot.loc[:x] }
          end

          it 'moves west' do
            robot = Robot.new(2, 4, Direction::WEST)
            expect { robot.move! }.to change { robot.loc[:x] }.from(2).to(3)
            expect { robot.move! }.to_not change { robot.loc[:y] }
          end
        end

        context 'immovable actions' do
          it "doesn't move north" do
            robot = Robot.new(0, 4, Direction::NORTH)
            expect { robot.move! }.to_not change { robot.loc[:y] }
          end

          it "doesn't move east" do
            robot = Robot.new(0, 0, Direction::EAST)
            expect { robot.move! }.to_not change { robot.loc[:x] }
          end

          it "doesn't move south" do
            robot = Robot.new(0, 0, Direction::SOUTH)
            expect { robot.move! }.to_not change { robot.loc[:y] }
          end

          it "doesn't move west" do
            robot = Robot.new(4, 0, Direction::WEST)
            expect { robot.move! }.to_not change { robot.loc[:x] }
          end
        end
      end
    end
  end
end
