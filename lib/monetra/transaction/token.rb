module Monetra
	module Transaction
		module Token
			class Request
				attr_accessor :username, :password, :action, :account, :admin, :type, :expdate, :street, :zip, :clientref, :desc, :token, :expdate_end, :active, :hist_id, :amount, :installment_total, :frequency, :bdate, :edate
			end
			
			class Response
				
			end
		end
	end
end