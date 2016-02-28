require 'faker'

FactoryGirl.define do
  factory :robot, class: ToyRobotSimulator::Robot do
    loc {
      { x: Faker::Number.between(0, 4) }
    }
    #facing rand(ToyRobotSimulator::Direction::DIRECTIONS)
    facing ToyRobotSimulator::Direction::NORTH

    #initialize_with { attributes }
  end
end