# encoding: UTF-8
require 'spec_helper'

describe Payme::Base do
  
  describe 'config' do
    it "should return the default config" do
      Payme::Base.instance.config.should eql(Payme::Config.default)
    end
  end
  
  describe 'load_libraries' do
    it "should load the required libraries" do
      Payme::Base.instance.send(:load_libraries, 'worldline')
    end
  end
end

describe Payme::Request do
  
  it "should forward to worldline" do
    Payme::Request.new(300).instance.should be_a(Payme::Worldline::Request)
  end
  
  it "should forward a method" do
    lambda do
      Payme::Request.new(300).parse_params
    end.should_not raise_error
  end
  
  it "should forward respond_to" do
    Payme::Request.new(300).respond_to?(:parse_params).should be_true
  end
end

describe Payme::Response do
  
  it "should forward to worldline" do
    Payme::Response.new('test').instance.should be_a(Payme::Worldline::Response)
  end
end
