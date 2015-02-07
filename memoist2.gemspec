# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memoist2/version'


Gem::Specification.new do |s|
  # Basic details
  s.name              = "memoist2"
  s.version           = Memoist2::VERSION
  s.authors           = ["Matthew Rudy Jacobs"]
  s.email             = ["matthewrudyjacobs@gmail.com"]

  s.summary           = "Really simple memoization for ruby 2.0"
  s.homepage          = "https://github.com/matthewrudy/memoist2"
  s.license           = "MIT"

  # Only works with Ruby 2
  s.required_ruby_version = '>= 2.0.0'

  # Add any extra files to include in the gem
  s.files             = `git ls-files`.split
  s.require_paths     = ["lib"]
  s.test_files        = s.files.grep(%r{^(test|spec|features)/})

  # Dependencies to run tests
  s.add_development_dependency("rspec")
  s.add_development_dependency("rake")
end
