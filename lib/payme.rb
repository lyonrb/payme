begin
  require "rubygems"
  require "bundler"
  Bundler.setup
rescue  Bundler::GemfileNotFound
  # There is no gemfile for this project (rails 2.3 ?)
end
  

require 'payme/config'
require 'payme/errors'
require 'payme/request'
require 'payme/response'
