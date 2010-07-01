require 'spec_helper'

describe Sogenactif::Params do
  
  describe 'parse_params' do
    it 'should parse the default params' do
      Sogenactif::Request.new.parse_params.should match(/([a-z\_]+)=([0-z]+)/)
    end
    
    it 'should parse defined params' do
      Sogenactif::Request.new({}, {
        :merchant_id => '0000',
        :amount => 15,
        :merchant_country => 'uk',
        :currency_code => 42
      }).parse_params.should match(/([a-z\_]+)=([0-z]+)/)
    end
  end
end