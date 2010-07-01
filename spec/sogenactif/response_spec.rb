require 'spec_helper'

describe Sogenactif::Response do
  
  describe 'initialize' do
    it 'should be able to initialize without options' do
      Sogenactif::Response.new('test').options[:bin_path].should eql('/')
    end
    
    it 'should be able to initialize with options' do
      Sogenactif::Response.new('test', :bin_path => '/bin').options[:bin_path].should eql('/bin')
    end
  end
end