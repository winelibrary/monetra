module Monetra
  class Connection
    class << self
      def base
        @base ||= Net::HTTP.new(Configuration.host, Configuration.port)
      end

      def post(data)
        base.use_ssl = Monetra::Configuration.use_ssl?
        if RUBY_VERSION.to_f == 1.9
          base.verify_mode = OpenSSL::SSL::VERIFY_PEER
          base.ca_file = '/usr/lib/ssl/certs/ca-certificates.crt' if File.exists?('/usr/lib/ssl/certs/ca-certificates.crt') # Ubuntu
          base.ca_path = '/etc/ssl/certs' if File.exists?('/etc/ssl/certs') # Ubuntu
          base.ca_file = '/opt/local/share/curl/curl-ca-bundle.crt' if File.exists?('/opt/local/share/curl/curl-ca-bundle.crt') # Mac OS X
        end
        request = base.post("/", data)
        request.body
      end
    end
  end
end