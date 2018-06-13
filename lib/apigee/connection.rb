require 'faraday'
require 'multi_json'
require 'faraday_middleware'

module Apigee
  # @private
  module Connection
    private

    def connection(raw=false)
      merged_options = connection_options.merge({
        :headers => {
          'Accept' => "application/json",
          'User-Agent' => user_agent
        },
        :proxy => proxy,
        :url => endpoint
      })

      Faraday.new(merged_options) do |builder|
        builder.use Faraday::Request::BasicAuthentication, username, password
        builder.use FaradayMiddleware::EncodeJson
        builder.use FaradayMiddleware::Rashify unless raw
        builder.use FaradayMiddleware::ParseJson unless raw
        builder.adapter(adapter)
      end
    end
  end
end
