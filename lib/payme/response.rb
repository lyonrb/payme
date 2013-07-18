module Payme
  #
  # Ghost class Response
  # This class should be used by all users, they are the public API.
  # They don't have a behavior of their own though.
  #
  # Their content is based on which library is defined in the application's configuration.
  #
  class Response < Request

    private
    def library
      @library ||= "Payme::#{library_name.camelize}::Response".constantize
    end
  end
end
