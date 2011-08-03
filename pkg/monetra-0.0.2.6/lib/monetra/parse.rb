module Monetra
  class Parse
    class << self
      def request(request={})
        xml = Builder::XmlMarkup.new({:indent => 2})
        xml.tag!("MonetraTrans") do
          case request.class.to_s
          when "Array"
            request.each_with_index do |transaction, index|
              xml.tag!("Trans", :identifier => index+1) do
                transaction.instance_variables.each do |key|
                  xml.tag!(key.to_s.delete("@"), transaction.instance_variable_get(key))
                end
              end
            end
          else #Monetra::Transaction::Token::Request
            xml.tag!("Trans", :identifier => 1) do
              request.instance_variables.each do |key|
                xml.tag!(key.to_s.delete("@"), request.instance_variable_get(key))
              end
            end
          end
        end
        xml.target!
      end
    end
  end
end