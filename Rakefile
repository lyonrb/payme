# encoding: UTF-8
require "rubygems"
require "bundler"
Bundler.setup

#
# The rspec tasks
#
require 'rspec/core'
require 'rspec/core/rake_task'
task :default => :spec
RSpec::Core::RakeTask.new(:spec)

#
# Jeweler
#
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "payme"
    gemspec.summary = "Process online payments through the Atos Worldline gateway"
    gemspec.description = "Need online payment?"
    gemspec.email = "damien.mathieu@lim.eu"
    gemspec.homepage = "http://github.com/LIMSAS/payme"
    gemspec.authors = ["LIM SAS", "Damien MATHIEU", "Julien SANCHEZ", "Hervé GAUCHER"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

#
# SDoc
#
begin
  require 'sdoc_helpers'
rescue LoadError
  puts "sdoc support not enabled. Please gem install sdoc-helpers."
end
