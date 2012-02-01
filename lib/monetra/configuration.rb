module Monetra
  class Configuration
    class << self
      def options(options_or_path_to=nil)
        @options ||= case options_or_path_to.class.to_s
        when "String"
          YAML::load_file(options_or_path_to).symbolize_keys
        when "Hash"
          options_or_path_to.symbolize_keys
        when "NilClass"
          YAML::load_file(File.join(Rails.root, 'config', 'monetra.yml'))[Rails.env].symbolize_keys if defined?(Rails)
        end
      end

      def user_name
        Monetra::Configuration.options[:user_name]
      end

      def user_name=(value)
        Monetra::Configuration.options[:user_name] = value
      end

      def password
        Monetra::Configuration.options[:password]
      end

      def password=(value)
        Monetra::Configuration.options[:password] = value
      end

      def host
        Monetra::Configuration.options[:host]
      end

      def host=(value)
        Monetra::Configuration.options[:host] = value
      end

      def port
        Monetra::Configuration.options[:port]
      end

      def port=(value)
        Monetra::Configuration.options[:port] = value
      end

      def use_ssl?
        Monetra::Configuration.options[:use_ssl]
      end

      def use_ssl=(value)
        Monetra::Configuration.options[:use_ssl] = value
      end
    end
  end
end