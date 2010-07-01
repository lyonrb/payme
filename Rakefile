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