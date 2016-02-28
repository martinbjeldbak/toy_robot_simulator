require 'spec_helper'
require 'tempfile'

module ToyRobotSimulator
  describe 'Obeying situations' do
    let(:output_file) { Tempfile.new('test_output.txt').path }

    describe 'when running situation 1' do
      let(:situation1_file) { File.dirname(__FILE__) + '/fixtures/situation1.txt' }

      subject(:robot) { Robot.run_from_file(situation1_file) }

      it 'is in the correct final configuration' do
        expect(subject.loc).to eq x: 0, y: 1
        expect(subject.facing).to eq Direction::NORTH
      end

      it 'gives the right output' do
        expect(subject.latest_report).to eq '0,1,NORTH'
      end

      it 'writes to an output file' do
        robot.output_reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '0,1,NORTH'
        end
      end
    end

    describe 'when running situation 4' do
      let(:situation4_file) { File.dirname(__FILE__) + '/fixtures/situation4.txt' }

      subject(:robot) { Robot.run_from_file(situation4_file) }

      it 'gives the right output' do
        robot.output_reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '2,2,SOUTH'
        end
      end
    end
  end
end
