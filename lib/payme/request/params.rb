module Payme
  module Params
    def self.included(klass)
      klass.class_eval do
        
        #
        # Parse the provided parameters before to make a binary call
        #
        def parse_params
          options.reject do |k,v|
            !valid_params.include?(k.to_s)
          end.to_a.collect do |a|
            a.join('=')
          end.join(' ') + " amount=#{amount}"
        end
      end
      
      
      private
      def valid_params
        ['merchant_id', 'merchant_country', 'amount', 'currency_code', 'pathfile',
          'normal_return_url', 'cancel_return_url', 'automatic_response_url',
          'language', 'payment_means', 'header_flag', 'capture_day', 'capture_mode',
          'bgcolor', 'block_align', 'block_order', 'textcolor', 'receipt_complement',
          'caddie', 'customer_id', 'customer_email', 'customer_ip_address',
          'data', 'return_context', 'target', 'order_id']
      end
    end
  end
end

Payme::Request.send(:include, Payme::Params)
