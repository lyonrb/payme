# encoding: UTF-8
module Payme
  module Worldline
    class Request
      attr_reader   :amount, :options

      def initialize(amount, options = {})
        @amount, @options = amount, default_options.merge(options)
      end

      private
      def default_options
        {
          :merchant_id => '014213245611111',
          :merchant_country => 'fr',
          :currency_code => 978,
        }.merge Payme::Config.default
      end
    end
  end
end
