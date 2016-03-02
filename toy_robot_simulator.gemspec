# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robot_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = 'toy_robot_simulator'
  spec.version       = ToyRobotSimulator::VERSION
  spec.authors       = ['Martin Bjeldbak Madsen']
  spec.email         = ['martinbmadsen@gmail.com']

  spec.summary       = %q{Simulates a robot that's able to move around a 5x5 field}
  spec.description   = %q{Can take a file as input and parse it with directions, as examples in the PDF attached to
                            this repository shows. Used for http://lookahead.com.au/'s recruitment process.}
  spec.homepage      = 'https://github.com/martinbjeldbak/toy_robot_simulator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.11'
end
