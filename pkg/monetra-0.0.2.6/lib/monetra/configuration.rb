module Monetra
  class Configuration
    class << self
      def options(options_or_path_to=nil)
        @options ||= case options_or_path_to.class.to_s
        when "String"
          YAML::load_file(options_or_path_to)
        when "Hash"
          options_or_path_to
        when "NilClass"
          YAML::load_file(File.join(Rails.root, 'config', 'monetra.yml'))[Rails.env]
        end
      end

      def user_name
        Monetra::Configuration.options["user_name"]
      end

      def password
        Monetra::Configuration.options["password"]
      end

      def host
        Monetra::Configuration.options["host"]
      end

      def port
        Monetra::Configuration.options["port"]
      end

      def use_ssl?
       Monetra::Configuration.options["use_ssl"]
      end
    end
  end
end