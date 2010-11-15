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
				attr_accessor :last_run_id, :last_success_date, :last_run_date, :next_run_date, :next_run_amount, :abaroute, :datablock
				
				def initialize(attributes={})
					attributes.each do |att, val|
						self.__send__("#{att}=", val) if self.respond_to?("#{att}=")
					end
				end
				
				def datablock=(data)
					csv_data = CSV.parse(data)
					headers = csv_data.shift.map {|i| i.to_s }
					string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
					array_of_hashes = string_data.map {|row| Hash[*headers.zip(row).flatten] }
					array_of_hashes.first.each_pair do |k,v|
						self.__send__("#{k}=", v)
					end
				end
			end
			
			
			class << self
				def new(attributes={})
					request = Request.new(attributes.merge(:action => "Admin", :type => "store", :admin => "recurringadd"))
					body = Connection.post(Monetra::Parse.request(request))
					body = Hash.from_xml(body)
					transfer_status = body["MonetraResp"]["DataTransferStatus"]
					responses = case body["MonetraResp"]["Resp"].class.to_s
					when "Hash"
						hash_response(body["MonetraResp"]["Resp"])
					when "Array"
						array_response(body["MonetraResp"]["Resp"])
					end
					responses
				end
				
				def find(attributes={})
					request = Request.new(attributes.merge(:action => "Admin", :type => "store", :admin => "recurringlist"))
					body = Connection.post(Monetra::Parse.request(request))
					body = Hash.from_xml(body)
					transfer_status = body["MonetraResp"]["DataTransferStatus"]
					responses = case body["MonetraResp"]["Resp"].class.to_s
					when "Hash"
						hash_response(body["MonetraResp"]["Resp"])
					when "Array"
						array_response(body["MonetraResp"]["Resp"])
					end
					responses
				end
				
				def edit(attributes={})
					request = Request.new(attributes.merge(:action => "Admin", :type => "store", :admin => "recurringedit"))
					body = Connection.post(Monetra::Parse.request(request))
					body = Hash.from_xml(body)
					transfer_status = body["MonetraResp"]["DataTransferStatus"]
					responses = case body["MonetraResp"]["Resp"].class.to_s
					when "Hash"
						hash_response(body["MonetraResp"]["Resp"])
					when "Array"
						array_response(body["MonetraResp"]["Resp"])
					end
					responses
				end
				
				def destroy(attributes={})
					request = Request.new(attributes.merge(:action => "Admin", :type => "store", :admin => "recurringdel"))
					body = Connection.post(Monetra::Parse.request(request))
					body = Hash.from_xml(body)
					transfer_status = body["MonetraResp"]["DataTransferStatus"]
					responses = case body["MonetraResp"]["Resp"].class.to_s
					when "Hash"
						hash_response(body["MonetraResp"]["Resp"])
					when "Array"
						array_response(body["MonetraResp"]["Resp"])
					end
					responses
				end
		
				private
				def hash_response(response)
					response_hash = {}
					response.each_pair do |k,v|
						response_hash[k.downcase] = v
					end
					Response.new(response_hash)
				end
				
				def array_response(responses)
					responses.map do |resp|
						response_hash = {}
						resp.each_pair do |k,v|
							response_hash[k.downcase] = v
						end
						Response.new(resp)
					end
				end
			end
		end
	end
end
