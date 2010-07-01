module Sogenactif
  module Params
    def self.included(klass)
      klass.class_eval do
        
        #
        # Parse the provided parameters before to make a binary call
        #
        def parse_params
          @params.to_a.collect {|a| a.join('=')}.join(' ')
        end
      end
    end
  end
end

Sogenactif::Request.send(:include, Sogenactif::Params)