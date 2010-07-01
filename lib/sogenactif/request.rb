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
        :merchant_id => '014213245611111',
        :merchant_country => 'fr',
        :amount => 0,
        :currency_code => 978,
        :pathfile => '/'
      }
    end
  end
end

require 'sogenactif/request/params'
require 'sogenactif/request/binary'