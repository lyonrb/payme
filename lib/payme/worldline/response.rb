# encoding: UTF-8
module Payme
  module Worldline
    class Response
      attr_reader   :message, :options
      
      def initialize(message, options = {})
        @message, @options = message, Payme::Config.default.merge(options)
      
      end
    end
  end
end