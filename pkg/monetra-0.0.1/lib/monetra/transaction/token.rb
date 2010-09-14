module Monetra
	module Transaction
		module Token
			class Request
				attr_accessor :username, :password, :action, :account, :admin, :type, :expdate, :street, :zip, :clientref, :desc, :token, :expdate_end
				attr_accessor :active, :hist_id, :amount, :installment_total, :frequency, :bdate, :edate, :cardholdername
				def initialize(attributes={})
					attributes.each do |att, val|
						self.__send__("#{att}=", val) if self.respond_to?("#{att}=")
					end
				end
			end
			
			class Response
				attr_accessor :code, :verbiage, :token
				attr_accessor :token, :type, :active, :cardtype, :account, :expdate, :cardholdername, :street, :zip, :descr, :clientref, :amount, :frequency, :bdate, :edate, :installment_num, :installment_total
				attr_accessor :last_run_id, :last_success_date, :last_run_date, :next_run_date, :next_run_amount, :datablock
				
				def initialize(attributes={})
					attributes.each do |att, val|
						self.__send__("#{att}=", val) if self.respond_to?("#{att}=")
					end
				end
				
				def datablock=(data)
					lines = data.split("\n")
				end
				
				
			end
			
			
			def self.new(attributes={})
				request = Request.new(attributes)
#				raise Monetra::Parse.request(request).inspect
				body = Connection.post(Monetra::Parse.request(request))
				puts body.inspect
				body = Hash.from_xml(body)
				transfer_status = body["MonetraResp"]["DataTransferStatus"]
				responses = case body["MonetraResp"]["Resp"].class.to_s
				when "Hash"
					[Response.new(body["MonetraResp"]["Resp"])]
				when "Array"
					body["MonetraResp"]["Resp"].map do |resp|
						Response.new(resp)
					end
				end
				responses
			end
		end
	end
end


# require 'rubygems'
# require 'monetra'
# Monetra::Configuration.options(:host => "mags.winelibrary.com", :port => "8333")
# Monetra::Transaction::Token.new(:username => "winelibrary-ecomm", :password => "WiNELiB7!", :action => "Admin", :type => "Store", :admin => "recurringlist", :token => "1001000000000056")

# require 'monetra'
# Monetra::Configuration.options(:host => "mags.winelibrary.com", :port => "8333")
# Monetra::Transaction::Token.new(:username => "winelibrary-ecomm", :password => "WiNELiB7!", :action => "Admin", :type => "Store", :admin => "recurringadd", :cardholdername => "Daniel Ahern", :street => "4657 Lancer Way", :zip => "89121", :expdate => "0912", :account => "4111111111111111")

# {"MonetraResp"=>{"DataTransferStatus"=>{"code"=>"SUCCESS"}, "Resp"=>{"identifier"=>"1", "code"=>"DENY", "msoft_code"=>"DATA_BADTRANS", "phard_code"=>"UNKNOWN", "verbiage"=>"UNKNOWN TRANSACTION TYPE"}}}