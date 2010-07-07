require 'spec_helper'

describe Payme::ResponseBinary do
  
  describe 'launch' do
    it 'should raise an error api call error if the result is an empty string' do
      response = Payme::Response.new('testing')
      response.expects(:exec).once.returns('')
      lambda do
        response.launch
      end.should raise_error Payme::Errors::MissingPath
    end
    
    it 'should raise an error api call if there is no error and no code' do
      response = Payme::Response.new('testing')
      response.expects(:exec).once.returns('!!!')
      lambda do
        response.launch
      end.should raise_error Payme::Errors::MissingPath
    end
    
    it 'should not raise an error if the number of elements is not equal to the number of fields' do
      response = Payme::Response.new('testing')
      response.expects(:exec).once.returns('!0!!!!!')
      response.launch.should be_kind_of Hash
    end
    
    it 'should get the response elements' do
      response = Payme::Response.new('testing')
      fields = Payme::Response.new('testing').send(:fields)
      response.expects(:exec).once.returns("!#{fields.join('!')}")
      
      launched = response.launch
      launched.should be_kind_of Hash
      launched.should_not be_empty
    end
  end
  
  describe 'exec' do
    it 'should execute the binary with basic  options' do
      response = Payme::Response.new('testing')
      response.expects(:`).with("/response pathfile=/ message=testing").once
      response.send(:exec)
    end
    
    it 'should execute the binary with a different message' do
      response = Payme::Response.new('42')
      response.expects(:`).with("/response pathfile=/ message=42").once
      response.send(:exec)
    end
    
    it 'should execute the binary with a defined path' do
      response = Payme::Response.new('testing', :bin_path => '/bin')
      response.expects(:`).with("/bin/response pathfile=/ message=testing").once
      response.send(:exec)
    end
    
    it 'should execute the binary with a defined file' do
      response = Payme::Response.new('testing', :pathfile => '/file')
      response.expects(:`).with("/response pathfile=/file message=testing").once
      response.send(:exec)
    end
  end
  
  describe 'parse_result' do
    it 'should parse the results array' do
      fields = Payme::Response.new('testing').send(:fields)
      result = Payme::Response.new('testing').send(:parse_result, fields)
      result.should be_kind_of Hash
      result.should_not be_empty
    end
  end
  
  describe 'fields' do
    it 'should be an array' do
      Payme::Response.new('testing').send(:fields).should be_kind_of Array
    end
    
    it 'should not be empty' do
      Payme::Response.new('testing').send(:fields).should_not be_empty
    end
  end
end
