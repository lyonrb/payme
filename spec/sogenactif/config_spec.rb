require 'spec_helper'

describe Sogenactif::Config do
  
  describe 'default' do
    it 'should return a hash' do
      Sogenactif::Config.default.should be_kind_of Hash
    end
    
    it 'should not be empty' do
      Sogenactif::Config.default.should_not be_empty
    end
  end
  
  describe 'set and get config' do
    it 'should define the config file path' do
      Sogenactif::Config.config_path.should be_nil
      Sogenactif::Config.set_config('/tmp/test', 'test')
      Sogenactif::Config.config_path.should eql('/tmp/test')
    end
    
    it 'should load the appropriate config when defined' do
      Sogenactif::Config.set_config('spec/fixtures/config.yml', 'test')
      Sogenactif::Request.new(300).options[:merchant_id].should eql(123456789)
    end
  end
end
