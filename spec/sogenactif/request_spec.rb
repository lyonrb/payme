require 'spec_helper'

describe Sogenactif::Request do
  
  describe 'initialize' do
    it 'should be able to initialize without options' do
      Sogenactif::Request.new.options[:bin_path].should eql('/')
    end
    
    it 'should be able to initialize with options' do
      Sogenactif::Request.new(:bin_path => '/bin').options[:bin_path].should eql('/bin')
    end
    
    it 'should be able to initialize without params' do
      Sogenactif::Request.new.params[:amount].should eql(0)
    end
    
    it 'should be able to initialize with params' do
      Sogenactif::Request.new({}, :amount => 15).params[:amount].should eql(15)
    end
  end
end