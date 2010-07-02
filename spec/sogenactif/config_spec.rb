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
end
