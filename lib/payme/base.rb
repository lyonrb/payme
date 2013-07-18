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
      Dir[path + "/#{library}/**/*.rb"].each do |file|
        require file
      end

      @library = library
    end
  end
end
