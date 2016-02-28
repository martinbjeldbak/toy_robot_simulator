require 'toy_robot_simulator/version'
require 'toy_robot_simulator/direction'
require 'toy_robot_simulator/robot'

module ToyRobotSimulator
  class Simulator
    def self.run_from_file_report_file(file, out_file)
      robot = Robot.run_from_file(file)
      robot.report_to_file(out_file)
    end

    def self.run_from_file_report_stdout(file)
      robot = Robot.run_from_file(file)
      robot.report_to_stdout
    end
  end
end
