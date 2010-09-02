module Monetra
	class Connection
		class << self
			def base
				@base ||= Net::HTTP.new(Configuration.host, Configuration.port)
			end
			
			def post
				options = options.merge(:company_no => MAGSTAR_CONFIG[:company_number])
				body = Net::HTTP.post_form(uri(path), options).body
			end
		end
	end
end