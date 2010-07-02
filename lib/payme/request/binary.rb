module Payme
  module RequestBinary
    def self.included(klass)
      klass.class_eval do
        
        #
        # Executes the binary call, gets the datas
        # Validates that the the code is correct
        # And returns the form
        #
        def launch
          result = exec.split('!')
          
          raise Payme::Errors::MissingPath if result.empty? or (result[1].empty? && result[2].empty?)
          raise Payme::Errors::ApiCall.new(result[1], result[2]) unless result[1].to_i == 0
          result
        end
        
        private
        #
        # Executes the binary call
        #
        def exec
          path = File.join(options[:bin_path], 'request')
          `#{path} #{parse_params}`
        end
      end
    end
  end
end

Payme::Request.send(:include, Payme::RequestBinary)
