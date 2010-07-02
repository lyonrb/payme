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
        ['merchant_id', 'merchant_country', 'amount', 'currency_code', 'pathfile']
      end
    end
  end
end

Payme::Request.send(:include, Payme::Params)
