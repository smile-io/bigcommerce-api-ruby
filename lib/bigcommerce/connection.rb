module Bigcommerce
  module Connection
    HEADERS = {
      'accept' => 'application/json',
      'content-type' => 'application/json',
      'user-agent' => 'bigcommerce-api-ruby',
      'accept-encoding' => 'gzip'
    }.freeze

    def self.build(config)
      ssl_options = config.ssl || {}
      Faraday.new(url: config.api_url, ssl: ssl_options) do |conn|
        conn.request :json
        conn.headers = HEADERS
        if config.auth == 'legacy'
          conn.use Faraday::Request::Authorization, config.username, config.api_key
        else
          conn.use Bigcommerce::Middleware::Auth, config
        end
        conn.use Bigcommerce::Middleware::HttpException
        conn.request :gzip
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
