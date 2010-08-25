# encoding: UTF-8
module Payme
  class Response
    attr_reader   :message, :options
    
    def initialize(message, options = {})
      @message, @options = message, Payme::Config.default.merge(options)
      
    end
  end
end

require 'payme/response/binary'
