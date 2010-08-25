# encoding: UTF-8
require 'spec_helper'

describe Payme::Response do
  
  describe 'initialize' do
    it 'should be able to initialize without options' do
      Payme::Response.new('test').options[:bin_path].should eql('/')
    end
    
    it 'should be able to initialize with options' do
      Payme::Response.new('test', :bin_path => '/bin').options[:bin_path].should eql('/bin')
    end
  end
end
