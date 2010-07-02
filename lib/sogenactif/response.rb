module Sogenactif
  class Response
    attr_reader   :message, :options
    
    def initialize(message, options = {})
      @message, @options = message, Sogenactif::Config.default.merge(options)
      
    end
  end
end

require 'sogenactif/response/binary'
