# encoding: UTF-8
require 'spec_helper'

describe Payme::Request do
  
  describe 'initialize' do
    it 'should be able to initialize without options' do
      Payme::Request.new(150).options[:bin_path].should eql('/')
    end
    
    it 'should be able to initialize with options' do
      Payme::Request.new(150, :bin_path => '/bin').options[:bin_path].should eql('/bin')
    end
    
    it 'should initialize the amount' do
      Payme::Request.new(300).amount.should eql(300)
    end
  end
end
