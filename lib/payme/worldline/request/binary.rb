# encoding: UTF-8
require 'payme/worldline/request'
require 'payme/worldline/response'

module Payme
  module Worldline
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
            result
          end
        
          private
          #
          # Executes the binary call
          #
          def exec
            path = File.join(options[:bin_path], 'request')
            `#{path} #{parse_params}` || ''
          end
        end
      end
    end
  end
end

Payme::Worldline::Request.send(:include, Payme::Worldline::RequestBinary)
