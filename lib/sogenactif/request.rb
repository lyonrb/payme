module Sogenactif
  class Request
    attr_reader   :options, :params
    
    def initialize(options = {}, params = {})
      @options = default_options.merge(options)
      @params  = default_params.merge(params)
      
    end
    
    
    private
    def default_options
      {
        :bin_path => '/',
        :debug => true
      }
    end
    
    def default_params
      {
        :merchant_id => '123456789',
        :merchant_country => 'fr',
        :amount => 0,
        :currency_code => 978
      }
    end
  end
end

require 'sogenactif/request/params'
require 'sogenactif/request/binary'