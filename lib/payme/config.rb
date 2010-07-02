module Payme
  class Config
    @@config_path = nil
    @@config_env = nil
    
    def self.default
      self.new.default
    end
    
    def default
      yaml_default || hard_default
    end
    
    def self.set_config(file_path, env)
      @@config_path, @@config_env = file_path, env
    end
    
    def self.config_path
      @@config_path
    end
    
    
    private
    def hard_default
      {
        :pathfile => '/',
        :bin_path => '/',
        :debug => true
      }
    end
    
    def yaml_default
      @config ||= symbolize_keys YAML::load(File.open(@@config_path))[@@config_env] unless @@config_path.nil? or @@config_env.nil?
    end
    
    def symbolize_keys arg
      case arg
      when Array
        arg.map { |elem| symbolize_keys elem }
      when Hash
        Hash[
          arg.map { |key, value|  
            k = key.is_a?(String) ? key.to_sym : key
            v = symbolize_keys value
            [k,v]
          }]
      else
        arg
      end
    end
  end
end
