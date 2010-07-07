require 'spec_helper'

describe Payme::Config do
  
  describe 'default' do
    it 'should return a hash' do
      Payme::Config.default.should be_kind_of Hash
    end
    
    it 'should not be empty' do
      Payme::Config.default.should_not be_empty
    end
  end
  
  describe 'set and get config' do
    it 'should define the config file path' do
      Payme::Config.config_path.should be_nil
      Payme::Config.set_config('/tmp/test', 'test')
      Payme::Config.config_path.should eql('/tmp/test')
    end
    
    it 'should load the appropriate config when defined' do
      Payme::Config.set_config('spec/fixtures/config.yml', 'test')
      Payme::Request.new(300).options[:merchant_id].should eql('123456789')
    end
    
    it 'should execute erb' do
      Payme::Config.set_config('spec/fixtures/config.yml', 'test')
      Payme::Request.new(300).options[:bin_path].should eql('/tmp/test')
    end
  end
end
