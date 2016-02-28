$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'toy_robot_simulator'
require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    FactoryGirl.find_definitions

    begin
      #FactoryGirl.lint
    end
  end
end
