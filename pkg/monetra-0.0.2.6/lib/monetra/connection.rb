module Monetra
	class Connection
		class << self
			def base
				@base ||= Net::HTTP.new(Configuration.host, Configuration.port)
			end
			
			def post(data)
			  base.use_ssl = Monetra::Configuration.use_ssl?
				request = base.post("/", data)
				request.body
			end
		end
	end
end