module Monetra
	class Configuration
		def options
			@options ||= YAML::load_file(File.join(Rails.root, 'config', 'monetra.yml'))
		end
		
		def user_name
			options[:user_name]
		end
		
		def password
			options[:password]
		end
		
		def host
			options[:host]
		end
		
		def port
			options[:port]
		end
	end
end