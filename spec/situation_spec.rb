require 'spec_helper'
require 'tempfile'

describe 'Obeying situations' do
  let(:output_file) { Tempfile.new('test_output.txt').path }

  describe 'when in situation 1' do
    let(:situation1_file) { File.dirname(__FILE__) + '/fixtures/situation1.txt' }

    subject(:robot) { Robot.from_file(situation1_file) }

    it 'gives the right output' do
      expect(robot.output_string).to eq '0,1,NORTH'
    end
  end
end