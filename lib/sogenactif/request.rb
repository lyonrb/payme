module Sogenactif
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
      }.merge Sogenactif::Config.default
    end
  end
end

require 'sogenactif/request/params'
require 'sogenactif/request/binary'
