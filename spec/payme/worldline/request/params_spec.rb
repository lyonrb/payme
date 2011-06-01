# encoding: UTF-8
require 'spec_helper'

describe Payme::Worldline::Params do
  
  describe 'parse_params' do
    it 'should parse the default params' do
      Payme::Worldline::Request.new(300).parse_params.should match(/([a-z\_]+)=([0-z]+)/)
    end    
    
    it 'should parse defined params' do
      Payme::Worldline::Request.new(300, {
        :merchant_id => '0000',
        :amount => 15,
        :merchant_country => 'uk',
        :currency_code => 42
      }).parse_params.should match(/([a-z\_]+)=([0-z]+)/)
    end
    
    it 'should have the merchant id' do
      Payme::Worldline::Request.new(300).parse_params.should match(/merchant_id=014213245611111/)
    end
    
    it 'should have the merchant country' do
      Payme::Worldline::Request.new(300).parse_params.should match(/merchant_country=fr/)
    end
    
    it 'should have the currency code' do
      Payme::Worldline::Request.new(300).parse_params.should match(/currency_code=978/)
    end
    
    it 'should have the pathfile' do
      Payme::Worldline::Request.new(300).parse_params.should match(/pathfile=\//)
    end
    
    it 'should have the amount' do
      Payme::Worldline::Request.new(300).parse_params.should match(/amount=300/)
    end
  end
end
