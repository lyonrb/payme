# encoding: UTF-8
require 'spec_helper'

describe Payme::Worldline::RequestBinary do
  
  describe 'launch' do
    
    it 'should raise an error api call error if the result is an empty string' do
      request = Payme::Worldline::Request.new(300)
      request.expects(:exec).once.returns('')
      lambda do
        request.launch
      end.should raise_error Payme::Errors::MissingPath
    end
    
    it 'should raise an error api call if there is no error and no code' do
      request = Payme::Worldline::Request.new(300)
      request.expects(:exec).once.returns('!!!')
      lambda do
        request.launch
      end.should raise_error Payme::Errors::MissingPath
    end
    
    it 'should return the form' do
      request = Payme::Worldline::Request.new(300)
      request.expects(:exec).once.returns('!0!!Some Form')
      request.launch.should eql(['', '0', '', 'Some Form'])
    end
  end
  
  describe 'exec' do
    it 'should execute the binary with basic  options' do
      request = Payme::Worldline::Request.new(300)
      request.expects(:`).with("/request #{request.parse_params}").once
      request.send(:exec)
    end
    
    it 'should execute the binary with a defined path' do
      request = Payme::Worldline::Request.new(300, :bin_path => '/bin')
      request.expects(:`).with("/bin/request #{request.parse_params}").once
      request.send(:exec)
    end
    
    it "should return an empty string if there is no result" do
      request = Payme::Worldline::Request.new(300, :bin_path => '/bin')
      request.expects(:`).with("/bin/request #{request.parse_params}").once.returns(nil)
      request.send(:exec).should eql('')
    end
  end
end
