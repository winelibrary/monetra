module Monetra
	module Transaction
		module Token
			class Request
				attr_accessor :username, :password, :action, :account, :admin, :type, :expdate, :street, :zip, :clientref, :desc, :token, :expdate_end
				attr_accessor :active, :hist_id, :amount, :installment_total, :frequency, :bdate, :edate, :cardholdername
				def self.new(attributes={})
					attributes.each do |att, val|
						self.send("#{att}=", val)
					end
				end
			end
			
			class Response
				attr_accessor :code, :verbiage, :token
				attr_accessor :token, :type, :active, :cardtype, :account, :expdate, :cardholdername, :street, :zip, :descr, :clientref, :amount, :frequency, :bdate, :edate, :installment_num, :installment_total
				attr_accessor :last_run_id, :last_success_date, :last_run_date, :next_run_date, :next_run_amount
				
				def self.new(attributes={})
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