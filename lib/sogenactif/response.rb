module Sogenactif
  class Response
    attr_reader   :message, :options
    
    def initialize(message, options = {})
      @message, @options = message, default_options.merge(options)
      
    end
    
    
    private
    def default_options
      {
        :filepath => '/',
        :bin_path => '/',
        :debug => true
      }
    end
  end
end

require 'sogenactif/response/binary'