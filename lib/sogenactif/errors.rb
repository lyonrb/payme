module Sogenactif
  module Errors
    
    class MissingPath < RuntimeError; end
    class InvalidFieldsNumber < RuntimeError; end
    class ApiCall < RuntimeError
      attr_reader    :code, :error
      def initialize(code, error)
        @code, @error = code, error
        super("The error code ##{code} occured when making the request - #{error}")
      end
    end
  end
end