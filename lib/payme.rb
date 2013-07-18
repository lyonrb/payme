# encoding: UTF-8

module Payme
  autoload :Base,     'payme/base'
  autoload :Config,   'payme/config'
  autoload :Errors,   'payme/errors'
  autoload :Request,  'payme/request'
  autoload :Response, 'payme/response'
end

Payme::Base.initialize!
