# encoding: UTF-8
require 'payme'

require 'rspec'
require 'mocha'

RSpec.configure do |config|

  config.before :each do
    Payme::Config.set_config(nil, nil)
  end
end
