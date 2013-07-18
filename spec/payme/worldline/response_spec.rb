# encoding: UTF-8
require 'spec_helper'

describe Payme::Worldline::Response do

  describe 'initialize' do
    it 'should be able to initialize without options' do
      Payme::Worldline::Response.new('test').options[:bin_path].should eql('/')
    end

    it 'should be able to initialize with options' do
      Payme::Worldline::Response.new('test', :bin_path => '/bin').options[:bin_path].should eql('/bin')
    end
  end
end
