module Monetra
  class Connection
    class << self
      def base
        @base ||= Net::HTTP.new(Configuration.host, Configuration.port)
      end

      def post(data)
        base.use_ssl = Monetra::Configuration.use_ssl?
        ssl_certificate if Monetra::Configuration.use_ssl?
        request = base.post("/", data)
        request.body
      end

      private
      def ssl_certificate
        if RUBY_VERSION.to_f == 1.9
          # base.verify_mode = OpenSSL::SSL::VERIFY_PEER
          case
          when ENV["SSL_CERT_FILE"]
            base.ca_file = ENV["SSL_CERT_FILE"]
          when File.exists?('/etc/ssl/certs') # Ubuntu
            base.ca_path = '/etc/ssl/certs'
          when File.exists?('/usr/lib/ssl/certs/ca-certificates.crt') # heroku
            base.ca_file = '/usr/lib/ssl/certs/ca-certificates.crt'  
          when File.exists?('/opt/local/share/curl/curl-ca-bundle.crt') # Mac OS X
            base.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt'
          end
        end
      end
    end
  end
end