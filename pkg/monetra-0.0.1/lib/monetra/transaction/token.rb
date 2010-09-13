module Monetra
	module Transaction
		module Token
			class Request
				attr_accessor :username, :password, :action, :account, :admin, :type, :expdate, :street, :zip, :clientref, :desc, :token, :expdate_end
				attr_accessor :active, :hist_id, :amount, :installment_total, :frequency, :bdate, :edate, :cardholdername
				def init(attributes={})
					attributes.each do |att, val|
						self.send("#{att}=", val)
					end
				end
			end
			
			class Response
				attr_accessor :code, :verbiage, :token
				attr_accessor :token, :type, :active, :cardtype, :account, :expdate, :cardholdername, :street, :zip, :descr, :clientref, :amount, :frequency, :bdate, :edate, :installment_num, :installment_total
				attr_accessor :last_run_id, :last_success_date, :last_run_date, :next_run_date, :next_run_amount
				
				def init(attributes={})
					attributes.each do |att, val|
						self.send("#{att}=", val)
					end
				end
				
				
			end
			
			
			def self.new(attributes={})
				request = Request.new(attributes)
				body = Connection.post(request)
				response = Response.new(body)
			end
		end
	end
end


# require 'rubygems'
# require 'monetra'
# Monetra::Configuration.options(:host => "mags.winelibrary.com", :port => "4666")
# Monetra::Transaction::Token.new(:username => "monetra", :password => "monetra123", :action => "admin", :type => "store", :cardholdername => "Daniel Ahern", :street => "4657 Lancer Way", :zip => "89121", :expedite => "0912", :account => "4111111111111111")
