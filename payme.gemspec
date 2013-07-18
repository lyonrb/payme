# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "payme/version"

Gem::Specification.new do |s|
  s.name        = "payme"
  s.version     = Payme::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["LIM SAS", "Damien MATHIEU", "Julien SANCHEZ", "Hervé GAUCHER"]
  s.email       = ["42@dmathieu.com"]
  s.homepage    = "https://github.com/lyonrb/payme"
  s.summary     = "Process online payments through the Atos Worldline gateway"

  s.files = %w(README.md LICENSE) + Dir["lib/**/*", "app/**/*"]
  s.license = 'MIT'

  s.require_paths = ["lib"]

  s.add_dependency 'activesupport'
end
