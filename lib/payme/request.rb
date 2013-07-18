module Payme
  #
  # Ghost class Request
  # This class should be used by all users, they are the public API.
  # They don't have a behavior of their own though.
  #
  # Their content is based on which library is defined in the application's configuration.
  #
  class Request
    attr_reader :instance

    def initialize(*args)
      @instance = library.new(*args)
    end

    def method_missing(method, *args, &block)
      super unless respond_to?(method)
      @instance.send(method, *args, &block)
    end


    def respond_to?(method)
      @instance.respond_to?(method)
    end

    private
    def library_name
      Payme::Base.instance.library
    end

    def library
      @library ||= "Payme::#{library_name.camelize}::Request".constantize
    end
  end
end
