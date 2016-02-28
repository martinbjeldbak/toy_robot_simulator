require 'spec_helper'
require 'tempfile'

module ToyRobotSimulator
  describe 'Obeying situations' do
    let(:output_file) { Tempfile.new('test_output.txt').path }

    context 'situation 1' do
      let(:situation1_file) { File.dirname(__FILE__) + '/fixtures/situation1.txt' }
      subject(:robot) { Robot.run_from_file(situation1_file) }

      it 'is in the correct final configuration' do
        expect(subject.loc).to eq x: 0, y: 1
        expect(subject.facing).to eq Direction::NORTH
      end

      it 'gives the right output' do
        expect(subject.latest_report).to eq '0,1,NORTH'
      end

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '0,1,NORTH'
        end
      end
    end

    context 'situation 2' do
      let(:situation2_file) { File.dirname(__FILE__) + '/fixtures/situation2.txt' }
      subject(:robot) { Robot.run_from_file(situation2_file) }

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '0,0,WEST'
        end
      end
    end

    context 'situation 3' do
      let(:situation3_file) { File.dirname(__FILE__) + '/fixtures/situation3.txt' }
      subject(:robot) { Robot.run_from_file(situation3_file) }

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '3,3,NORTH'
        end
      end
    end

    context 'situation 4' do
      let(:situation4_file) { File.dirname(__FILE__) + '/fixtures/situation4.txt' }
      subject(:robot) { Robot.run_from_file(situation4_file) }

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '2,2,SOUTH'
        end
      end
    end

    context 'situation 5' do
      let(:situation5_file) { File.dirname(__FILE__) + '/fixtures/situation5.txt' }
      subject(:robot) { Robot.run_from_file(situation5_file) }

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '4,4,NORTH'
        end
      end
    end

    context 'situation 6' do
      let(:situation6_file) { File.dirname(__FILE__) + '/fixtures/situation6.txt' }
      subject(:robot) { Robot.run_from_file(situation6_file) }

      it 'correctly writes to an output file' do
        robot.reports_to_file(output_file)

        File.open(output_file) do |f|
          expect(f.readline).to eq '0,0,SOUTH'
        end
      end
    end
  end
end
