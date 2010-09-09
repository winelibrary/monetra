module Monetra
	module Transaction
		module Engine
			class Request
				attr_accessor :username, :password, :action, :annual_transaction_limit, :begin_date, :card_types, :company_name, :connection_id, :debug, :device_type, :end_date, :email, :encrypt, :error_code, :file
				attr_accessor :industry_code, :ip_address, :key, :level, :license_id, :localhost_only, :error_marker, :max_version, :merchant_restrictions, :method, :mode, :num_users, :os, :partial, :partner_id
				attr_accessor :processing_instructions, :profile_id, :pwd, :require_signed_modules, :required_modules, :restriction, :restriction_data, :restriction_type, :sqlite_only, :sub_account
				attr_accessor :transaction_types, :ttid, :user
			
				alias_method :annual_transaction_limit=, :annual_trans_limit=
				alias_method :begin_date=, :bdate=
				alias_method :card_types=, :cardtypes=
				alias_method :company_name=, :compname=
				alias_method :connection_id=, :connid=
				alias_method :device_type=, :devicetype=
				alias_method :end_date=, :edate=
				alias_method :error_code=, :errorcode=
				alias_method :industry_code=, :indcode=
				alias_method :ip_address=, :ipaddr
				alias_method :error_code=, :errorcode=
				alias_method :error_marker=, :marker=
				alias_method :processing_instructions=, :proc=
				alias_method :require_signed_modules=, :req_signed_mods=
				alias_method :sub_account=, :sub=
			
			
			
				def begin_date=(value)
				end
			
				def card_types=(value)
				end
			
				def end_date=(value)
				end
			
				def industry_code=(value)
				end
			
				def restriction_type=(value)
				
				end
			end
			
			class Response
				attr_accessor :code, :msoft_code, :verbiage, :card_types, :mode, :connection_priority, :email, :configured_methods, :current_method, :online_methods, :offline_methods
				
				alias_method :consecerrors
				alias_method :card_types=, :cardtypes=
				alias_method :connection_priority=, :conn_priority=
				alias_method :configured_methods=, :configuredmethods=
				alias_method :current_method=, :currentmethod
				alias_method :online_methods, :onlinemethods
				alias_method :offline_methods, :offlinemethods
				
				def code=(value)
				end
				
				def msoft_code=(value)
				end
			end
		end
	end
end