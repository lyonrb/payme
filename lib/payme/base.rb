# encoding: UTF-8
require 'singleton'
require 'active_support/core_ext/string/inflections'

module Payme
  
  class Base
    include ::Singleton
    attr_reader :library
    
    def self.initialize!
      self.instance.initialize!
    end
    
    def initialize!
      load_libraries config['library']
    end
    
    def config
      @config ||= Payme::Config.default
    end
    
    
    private
    def load_libraries(library)
      library = "worldline" if library.nil?
      raise "Invalid type provided" if library.empty?
      
      path = File.dirname(__FILE__)
      Dir[path + "/#{library}/**/*"].each do |file|
        require file
      end
      
      @library = library
    end
  end
  
  
  #
  # Ghost classes Request and Response
  # These classes should be used by all users, they are the public API.
  # They don't have a behavior of their own though.
  #
  # Their content is based on which library is defined in the application's configuration.
  #
  class Request
    attr_reader :instance
    
    def initialize(*args)
      @instance = library.new(*args)
    end
    
    def method_missing(method, *args, &block)
      @instance.public_send(method, *args, &block)
    end
    
    
    def respond_to?(method)
      @instance.respond_to?(method)
    end
    
    private
    def library_name
      Payme::Base.instance.library
    end
    
    def library
      @library ||= "Payme::#{library_name.camelize}::Request".constantize
    end
  end
  
  
  class Response < Request
    
    private
    def library
      @library ||= "Payme::#{library_name.camelize}::Response".constantize
    end
  end
end