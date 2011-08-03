module Monetra
  module Transaction
    module User
      class Request
        attr_accessor :username, :password, :action, :account, :advancedeposit, :amount, :apprcode, :batch, :bdate, :capture, :cardholdername, :cardpresent, :cashbackamount, :cavv, :clerkid, :comments, :curr, :custref, :cv, :dentalamount, :descloc, :descmerch, :edate, :examount, :excharges,
      end

      class Response

      end
    end
  end
end