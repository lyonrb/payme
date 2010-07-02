require "rubygems"
require "bundler"
Bundler.setup

require 'spec/rake/spectask'
#
# The rspec tasks
#
task :default => :spec

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
  t.spec_opts = ['-cfs']
end

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
