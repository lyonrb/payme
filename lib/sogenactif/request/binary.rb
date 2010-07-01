module Sogenactif
  module Binary
    def self.included(klass)
      klass.class_eval do
        
        #
        # Executes the binary call, gets the datas
        # Validates that the the code is correct
        # And returns the form
        #
        def launch
          result = exec.split('!')
          
          raise Sogenactif::Errors::MissingPath if result.empty? or (result[1].empty? && result[2].empty?)
          raise Sogenactif::Errors::ApiCall.new(result[1], result[2]) unless result[1].to_i == 0
          result[3]
        end
        
        private
        #
        # Executes the binary call
        #
        def exec
          path = File.join(@options[:bin_path], 'request')
          `#{path} #{parse_params}`
        end
      end
    end
  end
end

Sogenactif::Request.send(:include, Sogenactif::Binary)