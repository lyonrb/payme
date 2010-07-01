require 'spec_helper'

describe Sogenactif::RequestBinary do
  
  describe 'launch' do
    
    it 'should raise an error api call error if the result is an empty string' do
      request = Sogenactif::Request.new
      request.expects(:exec).once.returns('')
      lambda do
        request.launch
      end.should raise_error Sogenactif::Errors::MissingPath
    end
    
    it 'should raise an error api call if there is no error and no code' do
      request = Sogenactif::Request.new
      request.expects(:exec).once.returns('!!!')
      lambda do
        request.launch
      end.should raise_error Sogenactif::Errors::MissingPath
    end
    
    it 'should raise an error' do
      request = Sogenactif::Request.new
      request.expects(:exec).once.returns('!15!My Error!')
      lambda do
        request.launch
      end.should raise_error Sogenactif::Errors::ApiCall
    end
    
    it 'should return the form' do
      request = Sogenactif::Request.new
      request.expects(:exec).once.returns('!0!!Some Form')
      request.launch.should eql('Some Form')
    end
  end
  
  describe 'exec' do
    it 'should execute the binary with basic  options' do
      request = Sogenactif::Request.new
      request.expects(:`).with("/request #{request.parse_params}").once
      request.send(:exec)
    end
    
    it 'should execute the binary with a defined path' do
      request = Sogenactif::Request.new(:bin_path => '/bin')
      request.expects(:`).with("/bin/request #{request.parse_params}").once
      request.send(:exec)
    end
    
    it 'should execute the binary with defined parameters' do
      request = Sogenactif::Request.new({}, {
        :amount => 15
      })
      request.expects(:`).with("/request #{request.parse_params}").once
      request.send(:exec)
    end
  end
end