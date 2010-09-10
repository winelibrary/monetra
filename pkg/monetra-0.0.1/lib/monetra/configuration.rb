module Monetra
	class Configuration
		class << self
			def options(options_or_path_to=nil)
				@options ||= case options_or_path_to.class.to_s
				when "String"
					puts 'STIRNG'
					YAML::load_file(options_or_path_to)
				when "Hash"
					puts "HASH"
					options_or_path_to
				when "NilClass"
					puts "NIL MF"
					YAML::load_file(File.join(Rails.root, 'config', 'monetra.yml'))
				end 
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
end