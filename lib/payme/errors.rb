module Payme
  module Errors
    
    class MissingPath < RuntimeError; end
    class InvalidFieldsNumber < RuntimeError; end
  end
end
