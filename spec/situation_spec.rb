require 'spec_helper'
require 'tempfile'

module ToyRobotSimulator
  context 'method tests' do
    let(:robot) { Robot.new }

    describe '.parse_command' do
      before { Robot.send(:public, *Robot.private_instance_methods) }

      it 'understands parsing correct commands' do
        expect(robot.parse_command('PLACE 2,4,NORTH')).to eq(
          cmd: :place, x: 2, y: 4, dir: 'north')
        expect(robot.parse_command('PLACE 0,0,EAST')).to eq(
          cmd: :place, x: 0, y: 0, dir: 'east')
      end
    end
  end


  describe 'Obeying situations' do
    let(:output_file) { Tempfile.new('test_output.txt').path }

    describe 'when running situation 1' do
      let(:situation1_file) { File.dirname(__FILE__) + '/fixtures/situation1.txt' }

      subject(:robot) { Robot.run_from_file(situation1_file) }

      it 'is in the correct final configuration' do
        expect(subject.location).to eq x: 0, y: 1
        expect(subject.facing).to eq Direction::NORTH
      end

      it 'gives the right output' do
        expect(subject.report).to eq '0,1,NORTH'
      end
    end

    describe 'when running situation 4' do
      let(:situation4_file) { File.dirname(__FILE__) + '/fixtures/situation4.txt' }

      subject(:robot) { Robot.run_from_file(situation4_file) }

      it 'gives the right output' do
        File.open(output_file) do |f|
          expect(f.readline).to eq '2,2,SOUTH'
        end
      end
    end
  end
end
